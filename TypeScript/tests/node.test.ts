import { describe, test } from "node:test";
import assert from "node:assert";
import { Node, AttributeKey, ViewType, addStableIds } from "../src/index";

describe("Node", () => {
  test("creates a basic node with type and attributes", () => {
    const node = new Node(ViewType.text, [[AttributeKey.text, "Hello World"]]);

    assert.strictEqual(node.type, "Text");
    assert.strictEqual(node.getAttribute(AttributeKey.text), "Hello World");
    assert.deepStrictEqual(node.children, []);
  });

  test("accepts string type", () => {
    const node = new Node("CustomView", [[AttributeKey.value, "test"]]);

    assert.strictEqual(node.type, "CustomView");
  });

  test("accepts ViewType type", () => {
    const node = new Node(ViewType.text, [[AttributeKey.text, "test"]]);

    assert.strictEqual(node.type, "Text");
  });

  test("getAttribute returns value by key", () => {
    const node = new Node(ViewType.text, [
      [AttributeKey.text, "Hello"],
      [AttributeKey.bold, true],
    ]);

    assert.strictEqual(node.getAttribute(AttributeKey.text), "Hello");
    assert.strictEqual(node.getAttribute("bold"), true);
    assert.strictEqual(node.getAttribute("nonexistent"), undefined);
  });

  test("setAttribute updates existing attribute", () => {
    const node = new Node(ViewType.text, [[AttributeKey.text, "Hello"]]);

    node.setAttribute(AttributeKey.text, "World");

    assert.strictEqual(node.getAttribute(AttributeKey.text), "World");
  });

  test("setAttribute adds new attribute", () => {
    const node = new Node(ViewType.text, [[AttributeKey.text, "Hello"]]);

    node.setAttribute(AttributeKey.bold, true);

    assert.strictEqual(node.getAttribute(AttributeKey.bold), true);
  });

  test("addingAttribute returns new node (immutable)", () => {
    const original = new Node(ViewType.text, [[AttributeKey.text, "Hello"]]);
    const modified = original.addingAttribute(AttributeKey.bold, true);

    assert.notStrictEqual(modified, original);
    assert.strictEqual(modified.getAttribute(AttributeKey.bold), true);
    assert.strictEqual(original.getAttribute(AttributeKey.bold), undefined);
  });

  test("serializes to attribute array", () => {
    const node = new Node(ViewType.text, [
      [AttributeKey.text, "Hello"],
      [AttributeKey.bold, true],
    ]);

    const json = JSON.parse(JSON.stringify(node));

    assert.strictEqual(json.type, "Text");
    assert.deepStrictEqual(json.attributes, [
      ["text", "Hello"],
      ["bold", true],
    ]);
    assert.strictEqual(json.children, undefined); // children omitted when empty
  });

  test("handles array attribute values", () => {
    const node = new Node(ViewType.linearGradient, [
      [AttributeKey.colors, ["red", "blue", "green"]],
    ]);

    const json = JSON.parse(JSON.stringify(node));

    assert.deepStrictEqual(json.attributes[0][1], ["red", "blue", "green"]);
  });

  test("handles dictionary attribute values", () => {
    const node = new Node(ViewType.vStack, [
      [AttributeKey.padding, { top: 10, leading: 20, bottom: 10, trailing: 20 }],
    ]);

    const json = JSON.parse(JSON.stringify(node));

    assert.deepStrictEqual(json.attributes[0][1], {
      top: 10,
      leading: 20,
      bottom: 10,
      trailing: 20,
    });
  });

  test("handles nested nodes in attributes", () => {
    const innerNode = new Node(ViewType.text, [[AttributeKey.text, "Inner"]]);
    const outerNode = new Node(ViewType.button, [[AttributeKey.label, innerNode]]);

    const json = JSON.parse(JSON.stringify(outerNode));

    assert.strictEqual(json.attributes.length, 1);
    assert.strictEqual(json.attributes[0][0], "label");
    assert.strictEqual(json.attributes[0][1].$type, "node");
    assert.strictEqual(json.attributes[0][1].value.type, "Text");
  });

  test("handles children nodes", () => {
    const child1 = new Node(ViewType.text, [[AttributeKey.text, "Child 1"]]);
    const child2 = new Node(ViewType.text, [[AttributeKey.text, "Child 2"]]);
    const parent = new Node(ViewType.vStack, [], [child1, child2]);

    assert.strictEqual(parent.children.length, 2);
    assert.strictEqual(parent.children[0].type, "Text");
    assert.strictEqual(parent.children[1].type, "Text");

    const json = JSON.parse(JSON.stringify(parent));
    assert.strictEqual(json.children.length, 2);
  });

  test("handles null attribute values", () => {
    const node = new Node(ViewType.text, [
      [AttributeKey.text, "Hello"],
      [AttributeKey.value, null],
    ]);

    const json = JSON.parse(JSON.stringify(node));
    assert.deepStrictEqual(json.attributes, [
      ["text", "Hello"],
      ["value", null],
    ]);
  });

  test("addStableIds to single node", () => {
    const node = new Node(ViewType.text, [[AttributeKey.text, "Hello"]]);
    const withIds = addStableIds(node);

    assert.strictEqual(withIds.getAttribute(AttributeKey.id), "Text.0");
  });

  test("addStableIds preserves existing IDs", () => {
    const node = new Node(ViewType.text, [
      [AttributeKey.text, "Hello"],
      [AttributeKey.id, "custom-id"],
    ]);
    const withIds = addStableIds(node);

    assert.strictEqual(withIds.getAttribute(AttributeKey.id), "custom-id");
  });

  test("addStableIds to multiple siblings", () => {
    const node = new Node(
      ViewType.vStack,
      [],
      [
        new Node(ViewType.text, [[AttributeKey.text, "First"]]),
        new Node(ViewType.text, [[AttributeKey.text, "Second"]]),
        new Node(ViewType.text, [[AttributeKey.text, "Third"]]),
      ],
    );

    const withIds = addStableIds(node);

    assert.strictEqual(withIds.getAttribute(AttributeKey.id), "VStack.0");
    assert.strictEqual(withIds.children[0].getAttribute(AttributeKey.id), "Text.0");
    assert.strictEqual(withIds.children[1].getAttribute(AttributeKey.id), "Text.1");
    assert.strictEqual(withIds.children[2].getAttribute(AttributeKey.id), "Text.2");
  });

  test("addStableIds to nested structure", () => {
    const node = new Node(
      ViewType.vStack,
      [],
      [
        new Node(ViewType.text, [[AttributeKey.text, "Title"]]),
        new Node(
          ViewType.hStack,
          [],
          [
            new Node(ViewType.text, [[AttributeKey.text, "Left"]]),
            new Node(ViewType.text, [[AttributeKey.text, "Right"]]),
          ],
        ),
        new Node(ViewType.text, [[AttributeKey.text, "Footer"]]),
      ],
    );

    const withIds = addStableIds(node);

    // VStack
    assert.strictEqual(withIds.getAttribute(AttributeKey.id), "VStack.0");

    // First Text
    assert.strictEqual(withIds.children[0].getAttribute(AttributeKey.id), "Text.0");

    // HStack
    const hstack = withIds.children[1];
    assert.strictEqual(hstack.getAttribute(AttributeKey.id), "HStack.0");

    // HStack children
    assert.strictEqual(hstack.children[0].getAttribute(AttributeKey.id), "Text.1");
    assert.strictEqual(hstack.children[1].getAttribute(AttributeKey.id), "Text.2");

    // Last Text
    assert.strictEqual(withIds.children[2].getAttribute(AttributeKey.id), "Text.3");
  });

  test("addStableIds mixed with explicit IDs", () => {
    const node = new Node(
      ViewType.vStack,
      [],
      [
        new Node(ViewType.text, [[AttributeKey.text, "Auto ID"]]),
        new Node(ViewType.text, [
          [AttributeKey.text, "Custom ID"],
          [AttributeKey.id, "my-text"],
        ]),
        new Node(ViewType.text, [[AttributeKey.text, "Another Auto"]]),
      ],
    );

    const withIds = addStableIds(node);

    assert.strictEqual(withIds.getAttribute(AttributeKey.id), "VStack.0");
    assert.strictEqual(withIds.children[0].getAttribute(AttributeKey.id), "Text.0");
    assert.strictEqual(withIds.children[1].getAttribute(AttributeKey.id), "my-text");
    assert.strictEqual(withIds.children[2].getAttribute(AttributeKey.id), "Text.1");
  });

  test("addStableIds to different view types", () => {
    const node = new Node(
      ViewType.vStack,
      [],
      [
        new Node(ViewType.text, [[AttributeKey.text, "Text"]]),
        new Node(ViewType.button, [[AttributeKey.text, "Button"]]),
        new Node(ViewType.image, [[AttributeKey.systemName, "star"]]),
        new Node(ViewType.circle, []),
      ],
    );

    const withIds = addStableIds(node);

    assert.strictEqual(withIds.getAttribute(AttributeKey.id), "VStack.0");
    assert.strictEqual(withIds.children[0].getAttribute(AttributeKey.id), "Text.0");
    assert.strictEqual(withIds.children[1].getAttribute(AttributeKey.id), "Button.0");
    assert.strictEqual(withIds.children[2].getAttribute(AttributeKey.id), "Image.0");
    assert.strictEqual(withIds.children[3].getAttribute(AttributeKey.id), "Circle.0");
  });
});
