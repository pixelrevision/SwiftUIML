/**
 * Tests for special numeric value serialization (Infinity, -Infinity, NaN)
 */

import { describe, test } from "node:test";
import assert from "node:assert";
import { Node, AttributeKey, ViewType } from "../src/index";
import { Text } from "../src/views";

describe("Special Numeric Values", () => {
  describe("Infinity serialization", () => {
    test("positive infinity serializes to $infinity", () => {
      const node = new Node(ViewType.text, [
        [AttributeKey.text, "Hello"],
        [AttributeKey.frame, { maxWidth: Infinity }],
      ]);

      const json = JSON.parse(JSON.stringify(node));
      assert.strictEqual(json.attributes[1][1].maxWidth, "$infinity");
    });

    test("negative infinity serializes to $-infinity", () => {
      const node = new Node(ViewType.text, [
        [AttributeKey.text, "Hello"],
        [AttributeKey.frame, { maxWidth: -Infinity }],
      ]);

      const json = JSON.parse(JSON.stringify(node));
      assert.strictEqual(json.attributes[1][1].maxWidth, "$-infinity");
    });

    test("NaN serializes to $nan", () => {
      const node = new Node(ViewType.text, [
        [AttributeKey.text, "Hello"],
        [AttributeKey.opacity, NaN],
      ]);

      const json = JSON.parse(JSON.stringify(node));
      assert.strictEqual(json.attributes[1][1], "$nan");
    });

    test("regular numbers serialize normally", () => {
      const node = new Node(ViewType.text, [
        [AttributeKey.text, "Hello"],
        [AttributeKey.opacity, 0.5],
      ]);

      const json = JSON.parse(JSON.stringify(node));
      assert.strictEqual(json.attributes[1][1], 0.5);
    });
  });

  describe("Infinity in arrays", () => {
    test("infinity in array serializes correctly", () => {
      const node = new Node(ViewType.text, [
        [AttributeKey.text, "Hello"],
        [AttributeKey.padding, [Infinity, 10, -Infinity, NaN]],
      ]);

      const json = JSON.parse(JSON.stringify(node));
      assert.deepStrictEqual(json.attributes[1][1], ["$infinity", 10, "$-infinity", "$nan"]);
    });
  });

  describe("Infinity in nested dictionaries", () => {
    test("infinity in nested dict serializes correctly", () => {
      const node = new Node(ViewType.vStack, [
        [
          AttributeKey.frame,
          {
            width: 100,
            maxWidth: Infinity,
            minWidth: 0,
            maxHeight: -Infinity,
          },
        ],
      ]);

      const json = JSON.parse(JSON.stringify(node));
      assert.deepStrictEqual(json.attributes[0][1], {
        width: 100,
        maxWidth: "$infinity",
        minWidth: 0,
        maxHeight: "$-infinity",
      });
    });
  });

  describe("Infinity with DSL", () => {
    test("DSL frame method with maxWidth infinity serializes correctly", () => {
      // frame(minWidth?, idealWidth?, maxWidth?, minHeight?, idealHeight?, maxHeight?, alignment?)
      // Need 4+ args to trigger long form overload
      const node = Text("Hello").frame(undefined, undefined, Infinity, undefined);

      const json = JSON.parse(JSON.stringify(node));
      const frameAttr = json.attributes.find((attr: any) => attr[0] === "frame");
      assert.strictEqual(frameAttr[1].maxWidth, "$infinity");
    });

    test("DSL frame method with maxHeight infinity serializes correctly", () => {
      const node = Text("Hello").frame(
        undefined,
        undefined,
        undefined,
        undefined,
        undefined,
        Infinity,
      ); // maxHeight

      const json = JSON.parse(JSON.stringify(node));
      const frameAttr = json.attributes.find((attr: any) => attr[0] === "frame");
      assert.strictEqual(frameAttr[1].maxHeight, "$infinity");
    });

    test("DSL addingAttribute also works with infinity", () => {
      const node = Text("Hello").addingAttribute(AttributeKey.frame, {
        maxWidth: Infinity,
      });

      const json = JSON.parse(JSON.stringify(node));
      const frameAttr = json.attributes.find((attr: any) => attr[0] === "frame");
      assert.strictEqual(frameAttr[1].maxWidth, "$infinity");
    });
  });

  describe("Edge cases", () => {
    test("zero serializes normally", () => {
      const node = new Node(ViewType.text, [[AttributeKey.opacity, 0]]);

      const json = JSON.parse(JSON.stringify(node));
      assert.strictEqual(json.attributes[0][1], 0);
    });

    test("very large numbers serialize normally", () => {
      const node = new Node(ViewType.text, [[AttributeKey.padding, 1e308]]);

      const json = JSON.parse(JSON.stringify(node));
      assert.strictEqual(json.attributes[0][1], 1e308);
    });

    test("very small numbers serialize normally", () => {
      const node = new Node(ViewType.text, [[AttributeKey.padding, 1e-308]]);

      const json = JSON.parse(JSON.stringify(node));
      assert.strictEqual(json.attributes[0][1], 1e-308);
    });
  });

  describe("Real-world usage", () => {
    test("frame with maxWidth infinity and fixed height", () => {
      // Using frame method: frame(minWidth?, idealWidth?, maxWidth?, minHeight?, idealHeight?, maxHeight?)
      const node = Text("Hello").frame(undefined, undefined, Infinity, undefined, 50); // maxWidth: Infinity, idealHeight: 50

      const json = JSON.parse(JSON.stringify(node));
      const frameAttr = json.attributes.find((attr: any) => attr[0] === "frame");

      assert.ok(frameAttr);
      assert.strictEqual(frameAttr[1].maxWidth, "$infinity");
      assert.strictEqual(frameAttr[1].height, 50);
    });

    test("multiple special values in same node", () => {
      const node = new Node(ViewType.vStack, [
        [AttributeKey.frame, { maxWidth: Infinity, maxHeight: Infinity }],
        [AttributeKey.opacity, NaN],
        [AttributeKey.padding, -Infinity],
      ]);

      const json = JSON.parse(JSON.stringify(node));

      assert.strictEqual(json.attributes[0][1].maxWidth, "$infinity");
      assert.strictEqual(json.attributes[0][1].maxHeight, "$infinity");
      assert.strictEqual(json.attributes[1][1], "$nan");
      assert.strictEqual(json.attributes[2][1], "$-infinity");
    });
  });
});
