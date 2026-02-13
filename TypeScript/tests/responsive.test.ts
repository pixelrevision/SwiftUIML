import { describe, test } from "node:test";
import assert from "node:assert";
import {
  Text,
  AsyncImage,
  Breakpoint,
  AttributeKey,
  // Standalone breakpoint helpers
  xs,
  sm,
  md,
  lg,
  xl,
  w,
  h,
} from "../src/index";

describe("Responsive & Conditional Modifiers", () => {
  describe("responsive()", () => {
    test("creates responsive modifier with single breakpoint", () => {
      const node = Text("Hello").responsive(
        new Map([[Breakpoint.sm, { font: "body", padding: 8 }]]),
      );

      const responsive = node.getAttribute(AttributeKey.responsive);
      assert.ok(Array.isArray(responsive));
      assert.strictEqual((responsive as any[]).length, 1);

      const breakpoint = (responsive as any[])[0];
      assert.strictEqual(breakpoint.pattern, "sm");
      assert.ok(Array.isArray(breakpoint.attributes));
      assert.deepStrictEqual(breakpoint.attributes, [
        ["font", "body"],
        ["padding", 8],
      ]);
    });

    test("creates responsive modifier with multiple breakpoints", () => {
      const node = Text("Hello").responsive(
        new Map([
          [Breakpoint.sm, { font: "body" }],
          [Breakpoint.md, { font: "title" }],
          [Breakpoint.lg, { font: "largeTitle" }],
        ]),
      );

      const responsive = node.getAttribute(AttributeKey.responsive);
      assert.ok(Array.isArray(responsive));
      assert.strictEqual((responsive as any[]).length, 3);

      const breakpoints = responsive as any[];
      assert.strictEqual(breakpoints[0].pattern, "sm");
      assert.strictEqual(breakpoints[1].pattern, "md");
      assert.strictEqual(breakpoints[2].pattern, "lg");
    });

    test("creates responsive modifier with custom width breakpoint", () => {
      const node = Text("Hello").responsive(new Map([[Breakpoint.w(800), { hidden: true }]]));

      const responsive = node.getAttribute(AttributeKey.responsive);
      const breakpoint = (responsive as any[])[0];
      assert.strictEqual(breakpoint.pattern, "w>=800");
      assert.deepStrictEqual(breakpoint.attributes, [["hidden", true]]);
    });

    test("creates responsive modifier with custom height breakpoint", () => {
      const node = Text("Hello").responsive(new Map([[Breakpoint.h(600), { padding: 20 }]]));

      const responsive = node.getAttribute(AttributeKey.responsive);
      const breakpoint = (responsive as any[])[0];
      assert.strictEqual(breakpoint.pattern, "h>=600");
    });

    test("creates responsive modifier with combined breakpoint", () => {
      const combined = Breakpoint.w(800).and(Breakpoint.h(600));
      const node = Text("Hello").responsive(new Map([[combined, { fontSize: 24 }]]));

      const responsive = node.getAttribute(AttributeKey.responsive);
      const breakpoint = (responsive as any[])[0];
      assert.strictEqual(breakpoint.pattern, "w>=800,h>=600");
    });

    test("serializes responsive modifier", () => {
      const original = Text("Responsive").responsive(
        new Map([
          [Breakpoint.sm, { font: "body", padding: 8 }],
          [Breakpoint.lg, { font: "title", padding: 16 }],
        ]),
      );

      const json = JSON.parse(JSON.stringify(original));

      assert.strictEqual(json.type, "Text");
      // Check that responsive attribute exists in serialized form
      const attrs = json.attributes;
      const responsiveAttr = attrs.find((item: any[]) => item[0] === "responsive");
      assert.ok(responsiveAttr);

      const responsiveValue = responsiveAttr[1];
      assert.ok(Array.isArray(responsiveValue));
      assert.strictEqual(responsiveValue.length, 2);
    });
  });

  describe("colorSchemeConditional()", () => {
    test("creates conditional with light scheme only", () => {
      const node = AsyncImage("default.jpg").colorSchemeConditional({
        light: { url: "light.jpg" },
      });

      const conditional = node.getAttribute(AttributeKey.colorSchemeConditional);
      assert.ok(typeof conditional === "object");
      assert.ok((conditional as any).light);
      assert.deepStrictEqual((conditional as any).light, [["url", "light.jpg"]]);
    });

    test("creates conditional with dark scheme only", () => {
      const node = AsyncImage("default.jpg").colorSchemeConditional({
        dark: { url: "dark.jpg" },
      });

      const conditional = node.getAttribute(AttributeKey.colorSchemeConditional);
      assert.ok(typeof conditional === "object");
      assert.ok((conditional as any).dark);
      assert.deepStrictEqual((conditional as any).dark, [["url", "dark.jpg"]]);
    });

    test("creates conditional with both light and dark schemes", () => {
      const node = AsyncImage("default.jpg").colorSchemeConditional({
        light: { url: "light.jpg", tint: "#000000" },
        dark: { url: "dark.jpg", tint: "#FFFFFF" },
      });

      const conditional = node.getAttribute(AttributeKey.colorSchemeConditional);
      assert.ok(typeof conditional === "object");

      const cond = conditional as any;
      assert.ok(cond.light);
      assert.ok(cond.dark);

      assert.deepStrictEqual(cond.light, [
        ["url", "light.jpg"],
        ["tint", "#000000"],
      ]);
      assert.deepStrictEqual(cond.dark, [
        ["url", "dark.jpg"],
        ["tint", "#FFFFFF"],
      ]);
    });

    test("works with text foreground color", () => {
      const node = Text("Themed").colorSchemeConditional({
        light: { foregroundColor: "#000000" },
        dark: { foregroundColor: "#FFFFFF" },
      });

      const conditional = node.getAttribute(AttributeKey.colorSchemeConditional);
      const cond = conditional as any;

      assert.deepStrictEqual(cond.light, [["foregroundColor", "#000000"]]);
      assert.deepStrictEqual(cond.dark, [["foregroundColor", "#FFFFFF"]]);
    });

    test("serializes conditional modifier", () => {
      const original = AsyncImage("default.jpg").colorSchemeConditional({
        light: { url: "light.jpg" },
        dark: { url: "dark.jpg" },
      });

      const json = JSON.parse(JSON.stringify(original));

      assert.strictEqual(json.type, "AsyncImage");

      const attrs = json.attributes;
      const conditionalAttr = attrs.find((item: any[]) => item[0] === "colorSchemeConditional");
      assert.ok(conditionalAttr);

      const conditionalValue = conditionalAttr[1];
      assert.ok(typeof conditionalValue === "object");
      assert.ok(conditionalValue.light);
      assert.ok(conditionalValue.dark);
    });
  });

  describe("Breakpoint class", () => {
    test("creates named breakpoints", () => {
      assert.strictEqual(Breakpoint.xs.pattern, "xs");
      assert.strictEqual(Breakpoint.sm.pattern, "sm");
      assert.strictEqual(Breakpoint.md.pattern, "md");
      assert.strictEqual(Breakpoint.lg.pattern, "lg");
      assert.strictEqual(Breakpoint.xl.pattern, "xl");
    });

    test("creates width breakpoints", () => {
      assert.strictEqual(Breakpoint.w(800).pattern, "w>=800");
      assert.strictEqual(Breakpoint.wGreaterThan(600).pattern, "w>600");
      assert.strictEqual(Breakpoint.wLessThanOrEqual(1024).pattern, "w<=1024");
      assert.strictEqual(Breakpoint.wLessThan(768).pattern, "w<768");
    });

    test("creates height breakpoints", () => {
      assert.strictEqual(Breakpoint.h(600).pattern, "h>=600");
      assert.strictEqual(Breakpoint.hGreaterThan(400).pattern, "h>400");
      assert.strictEqual(Breakpoint.hLessThanOrEqual(800).pattern, "h<=800");
      assert.strictEqual(Breakpoint.hLessThan(1024).pattern, "h<1024");
    });

    test("floors fractional values", () => {
      assert.strictEqual(Breakpoint.w(800.7).pattern, "w>=800");
      assert.strictEqual(Breakpoint.h(600.3).pattern, "h>=600");
    });

    test("combines breakpoints with and()", () => {
      const combined = Breakpoint.w(800).and(Breakpoint.h(600));
      assert.strictEqual(combined.pattern, "w>=800,h>=600");
    });

    test("combines breakpoints with plus()", () => {
      const combined = Breakpoint.w(800).plus(Breakpoint.h(600));
      assert.strictEqual(combined.pattern, "w>=800,h>=600");
    });

    test("chains multiple combinations", () => {
      const combined = Breakpoint.w(800).and(Breakpoint.h(600)).and(Breakpoint.wLessThan(1200));
      assert.strictEqual(combined.pattern, "w>=800,h>=600,w<1200");
    });
  });

  describe("Standalone breakpoint helpers (ergonomics)", () => {
    test("named breakpoint exports work", () => {
      assert.strictEqual(xs.pattern, "xs");
      assert.strictEqual(sm.pattern, "sm");
      assert.strictEqual(md.pattern, "md");
      assert.strictEqual(lg.pattern, "lg");
      assert.strictEqual(xl.pattern, "xl");
    });

    test("standalone w() and h() work", () => {
      assert.strictEqual(w(800).pattern, "w>=800");
      assert.strictEqual(h(600).pattern, "h>=600");
    });

    test("responsive with standalone helpers", () => {
      const node = Text("Responsive").responsive(
        new Map([
          [sm, { font: "body", padding: 8 }],
          [md, { font: "title", padding: 16 }],
          [w(1024), { font: "largeTitle", padding: 24 }],
        ]),
      );

      const responsive = node.getAttribute(AttributeKey.responsive);
      assert.ok(Array.isArray(responsive));
      assert.strictEqual((responsive as any[]).length, 3);

      const breakpoints = responsive as any[];
      assert.strictEqual(breakpoints[0].pattern, "sm");
      assert.strictEqual(breakpoints[1].pattern, "md");
      assert.strictEqual(breakpoints[2].pattern, "w>=1024");
    });

    test("combined breakpoints with standalone helpers", () => {
      const combined = w(800).and(h(600));
      const node = Text("Combined").responsive(new Map([[combined, { hidden: true }]]));

      const responsive = node.getAttribute(AttributeKey.responsive);
      const breakpoint = (responsive as any[])[0];
      assert.strictEqual(breakpoint.pattern, "w>=800,h>=600");
    });
  });
});
