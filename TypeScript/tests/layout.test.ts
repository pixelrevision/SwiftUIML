import { describe, it } from "node:test";
import * as assert from "node:assert";
import { Layout, Node, AttributeKey, ViewType, attr, style } from "../src";
import { Text } from "../src/views";

describe("Layout", () => {
  describe("Construction and Serialization", () => {
    it("creates a layout with styles and content", () => {
      const styles = {
        theme: [
          [AttributeKey.foregroundColor, "red"] as [AttributeKey, string],
          [AttributeKey.backgroundColor, "white"] as [AttributeKey, string],
        ],
      };

      const content = Text("Hello World");
      const layout = new Layout(styles, content);

      assert.strictEqual(layout.content.type, ViewType.text.value);
      assert.deepStrictEqual(layout.styles, styles);
    });

    it("serializes to JSON correctly", () => {
      const styles = {
        theme: [
          [AttributeKey.foregroundColor, "red"] as [AttributeKey, string],
          [AttributeKey.backgroundColor, "white"] as [AttributeKey, string],
        ],
      };

      const content = Text("Test");
      const layout = new Layout(styles, content);

      const json = JSON.parse(JSON.stringify(layout));

      // Check styles are 2D arrays
      assert.ok(json.styles["theme"]);
      assert.ok(Array.isArray(json.styles["theme"]));
      assert.deepStrictEqual(json.styles["theme"][0], ["foregroundColor", "red"]);
      assert.deepStrictEqual(json.styles["theme"][1], ["backgroundColor", "white"]);

      // Check content
      assert.strictEqual(json.content.type, "Text");
    });

    it("serializes correctly", () => {
      const styles = {
        base: [[AttributeKey.backgroundColor, "white"] as [AttributeKey, string]],
        theme: [
          [AttributeKey.inherit, "base"] as [AttributeKey, string],
          [AttributeKey.foregroundColor, "black"] as [AttributeKey, string],
        ],
      };

      const content = Text("Test");
      const layout = new Layout(styles, content);

      const json = JSON.parse(JSON.stringify(layout));

      // Check styles serialized
      assert.ok(json.styles["base"]);
      assert.ok(json.styles["theme"]);

      // Check content serialized
      assert.strictEqual(json.content.type, ViewType.text.value);
      const attrs = json.content.attributes;
      const textIndex = attrs.findIndex((item: any) => item[0] === "text");
      assert.ok(textIndex >= 0);
      assert.strictEqual(attrs[textIndex][1], "Test");
    });
  });

  describe("Complex Styles", () => {
    it("handles multiple styles with inheritance", () => {
      const styles = {
        base: [[AttributeKey.backgroundColor, "white"] as [AttributeKey, string]],
        theme: [
          [AttributeKey.inherit, "base"] as [AttributeKey, string],
          [AttributeKey.foregroundColor, "black"] as [AttributeKey, string],
        ],
        extended: [
          [AttributeKey.inherit, "theme"] as [AttributeKey, string],
          [AttributeKey.fontWeight, 10] as [AttributeKey, number],
        ],
      };

      const content = Text("Test");
      const layout = new Layout(styles, content);

      const json = JSON.parse(JSON.stringify(layout));

      // Verify all styles are present
      assert.ok(json.styles["base"]);
      assert.ok(json.styles["theme"]);
      assert.ok(json.styles["extended"]);

      // Verify inherit values are preserved
      const themeAttrs = json.styles["theme"];
      const inheritAttr = themeAttrs.find(([key]: [string, any]) => key === "inherit");
      assert.ok(inheritAttr);
      assert.strictEqual(inheritAttr[1], "base");
    });

    it("handles empty styles", () => {
      const styles = {};
      const content = Text("Test");
      const layout = new Layout(styles, content);

      const json = JSON.parse(JSON.stringify(layout));

      assert.deepStrictEqual(json.styles, {});
      assert.ok(json.content);
    });

    it("handles complex nested content", () => {
      const styles = {
        card: [
          [AttributeKey.backgroundColor, "white"] as [AttributeKey, string],
          [AttributeKey.cornerRadius, 12] as [AttributeKey, number],
        ],
      };

      const content = new Node(
        ViewType.vStack,
        [[AttributeKey.spacing, 8] as [AttributeKey, number]],
        [Text("Title"), Text("Subtitle")],
      );

      const layout = new Layout(styles, content);
      const json = JSON.parse(JSON.stringify(layout));

      assert.strictEqual(json.content.type, "VStack");
      assert.strictEqual(json.content.children.length, 2);
    });
  });

  describe("Attribute Value Types", () => {
    it("handles string attribute values", () => {
      const styles = {
        test: [[AttributeKey.foregroundColor, "red"] as [AttributeKey, string]],
      };
      const layout = new Layout(styles, Text("Test"));
      const json = JSON.parse(JSON.stringify(layout));

      const attrs = json.styles["test"];
      assert.strictEqual(attrs[0][1], "red");
    });

    it("handles number attribute values", () => {
      const styles = {
        test: [[AttributeKey.fontWeight, 700] as [AttributeKey, number]],
      };
      const layout = new Layout(styles, Text("Test"));
      const json = JSON.parse(JSON.stringify(layout));

      const attrs = json.styles["test"];
      assert.strictEqual(attrs[0][1], 700);
    });

    it("handles null attribute values", () => {
      const styles = {
        test: [["custom", null] as [string, null]],
      };
      const layout = new Layout(styles, Text("Test"));
      const json = JSON.parse(JSON.stringify(layout));

      const attrs = json.styles["test"];
      assert.strictEqual(attrs[0][1], null);
    });
  });

  describe("Ergonomic Helpers", () => {
    // These helpers eliminate the need for type assertions:
    //
    // Before: [AttributeKey.foregroundColor, "red"] as [AttributeKey, string]
    // After:  attr(AttributeKey.foregroundColor, "red")
    //
    // And style() groups attributes cleanly:
    // style(attr(...), attr(...), ...)

    it("attr() helper creates typed attributes", () => {
      const styles = {
        theme: style(
          attr(AttributeKey.foregroundColor, "red"),
          attr(AttributeKey.backgroundColor, "white"),
        ),
      };

      const layout = new Layout(styles, Text("Test"));
      const json = JSON.parse(JSON.stringify(layout));

      const attrs = json.styles["theme"];
      assert.strictEqual(attrs[0][0], "foregroundColor");
      assert.strictEqual(attrs[0][1], "red");
      assert.strictEqual(attrs[1][0], "backgroundColor");
      assert.strictEqual(attrs[1][1], "white");
    });

    it("works with inheritance using helpers", () => {
      const styles = {
        base: style(attr(AttributeKey.backgroundColor, "white")),
        theme: style(
          attr(AttributeKey.inherit, "base"),
          attr(AttributeKey.foregroundColor, "black"),
        ),
      };

      const layout = new Layout(styles, Text("Test"));
      const json = JSON.parse(JSON.stringify(layout));

      // Verify inherit is preserved
      const themeAttrs = json.styles["theme"];
      const inheritAttr = themeAttrs.find((item: any[]) => item[0] === "inherit");
      assert.ok(inheritAttr);
      assert.strictEqual(inheritAttr[1], "base");
    });

    it("works with mixed attr and direct tuples", () => {
      const styles = {
        mixed: [
          attr(AttributeKey.foregroundColor, "red"),
          ["backgroundColor", "blue"] as [string, string],
        ],
      };

      const layout = new Layout(styles, Text("Test"));
      const json = JSON.parse(JSON.stringify(layout));

      const attrs = json.styles["mixed"];
      assert.strictEqual(attrs[0][0], "foregroundColor");
      assert.strictEqual(attrs[0][1], "red");
      assert.strictEqual(attrs[1][0], "backgroundColor");
      assert.strictEqual(attrs[1][1], "blue");
    });
  });

  describe("Node.style() Modifier", () => {
    it("adds style attribute using modifier", () => {
      const styles = {
        theme: style(attr(AttributeKey.foregroundColor, "red")),
      };

      const content = Text("Test").style("theme");
      const layout = new Layout(styles, content);
      const json = JSON.parse(JSON.stringify(layout));

      // Verify style attribute was added to content
      const contentAttrs = json.content.attributes;
      const styleAttr = contentAttrs.find((item: any[]) => item[0] === "style");
      assert.ok(styleAttr, "style attribute should be present");
      assert.strictEqual(styleAttr[1], "theme");
    });

    it("chains style with other modifiers", () => {
      const styles = {
        theme: style(attr(AttributeKey.foregroundColor, "red")),
      };

      const content = Text("Test").style("theme").padding(16).id("my-text");

      const layout = new Layout(styles, content);
      const json = JSON.parse(JSON.stringify(layout));

      // Verify all attributes are present
      const contentAttrs = json.content.attributes;
      const attrKeys = contentAttrs.map((item: any[]) => item[0]);
      assert.ok(attrKeys.includes("style"));
      assert.ok(attrKeys.includes("padding"));
      assert.ok(attrKeys.includes("id"));
    });

    it("works with multiple nodes using style", () => {
      const styles = {
        theme: style(attr(AttributeKey.foregroundColor, "red")),
        accent: style(attr(AttributeKey.foregroundColor, "blue")),
      };

      const text1 = Text("First").style("theme");
      const text2 = Text("Second").style("accent");
      const text3 = Text("Third"); // No style

      // Verify each node has correct style
      const json1 = JSON.parse(JSON.stringify(text1));
      const json2 = JSON.parse(JSON.stringify(text2));
      const json3 = JSON.parse(JSON.stringify(text3));

      const styleAttr1 = json1.attributes.find((item: any[]) => item[0] === "style");
      assert.ok(styleAttr1);
      assert.strictEqual(styleAttr1[1], "theme");

      const styleAttr2 = json2.attributes.find((item: any[]) => item[0] === "style");
      assert.ok(styleAttr2);
      assert.strictEqual(styleAttr2[1], "accent");

      const styleAttr3 = json3.attributes.find((item: any[]) => item[0] === "style");
      assert.ok(!styleAttr3);
    });
  });
});
