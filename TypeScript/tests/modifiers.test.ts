import { describe, test } from "node:test";
import assert from "node:assert";
import {
  Text,
  VStack,
  HStack,
  Circle,
  TabView,
  Gauge,
  List,
  Toggle,
  Picker,
  AttributeKey,
  Node,
  RoundedRectangle,
} from "../src/index";

describe("Node Modifiers", () => {
  describe("Frame Modifiers", () => {
    test("frame sets width and height", () => {
      const node = Text("Hello").frame(100, 50);

      const frame = node.getAttribute(AttributeKey.frame) as any;
      assert.strictEqual(frame.width, 100);
      assert.strictEqual(frame.height, 50);
    });

    test("frame sets width only", () => {
      const node = Text("Hello").frame(100);

      const frame = node.getAttribute(AttributeKey.frame) as any;
      assert.strictEqual(frame.width, 100);
      assert.strictEqual(frame.height, undefined);
    });

    test("frame sets alignment", () => {
      const node = Text("Hello").frame(100, 50, "center");

      const frame = node.getAttribute(AttributeKey.frame) as any;
      assert.strictEqual(frame.alignment, "center");
    });

    test("containerRelativeFrame with defaults", () => {
      const node = Text("Hello").containerRelativeFrame("horizontal", 12, 1);

      const crFrame = node.getAttribute(AttributeKey.containerRelativeFrame) as any;
      assert.strictEqual(crFrame.axis, "horizontal");
      assert.strictEqual(crFrame.count, 12);
      assert.strictEqual(crFrame.span, 1);
      assert.strictEqual(crFrame.spacing, undefined);
      assert.strictEqual(crFrame.alignment, undefined);
    });

    test("containerRelativeFrame with all params", () => {
      const node = Text("Hello").containerRelativeFrame("horizontal", 12, 8, 10, "topLeading");

      const crFrame = node.getAttribute(AttributeKey.containerRelativeFrame) as any;
      assert.strictEqual(crFrame.axis, "horizontal");
      assert.strictEqual(crFrame.count, 12);
      assert.strictEqual(crFrame.span, 8);
      assert.strictEqual(crFrame.spacing, 10);
      assert.strictEqual(crFrame.alignment, "topLeading");
    });
  });

  describe("Padding Modifiers", () => {
    test("padding with no arguments sets null (system default)", () => {
      const node = Text("Hello").padding();

      assert.strictEqual(node.getAttribute(AttributeKey.padding), null);
    });

    test("padding sets uniform padding", () => {
      const node = Text("Hello").padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("padding sets directional padding", () => {
      const node = Text("Hello").padding(10, 20, 30, 40);

      const padding = node.getAttribute(AttributeKey.padding) as any;
      assert.strictEqual(padding.top, 10);
      assert.strictEqual(padding.leading, 20);
      assert.strictEqual(padding.bottom, 30);
      assert.strictEqual(padding.trailing, 40);
    });
  });

  describe("Layout Modifiers", () => {
    test("offset sets x and y offset", () => {
      const node = Text("Hello").offset(10, 20);

      const offset = node.getAttribute(AttributeKey.offset) as any;
      assert.strictEqual(offset.x, 10);
      assert.strictEqual(offset.y, 20);
    });

    test("offset sets uniform offset", () => {
      const node = Text("Hello").offset(15);

      assert.strictEqual(node.getAttribute(AttributeKey.offset), 15);
    });

    test("position sets x and y position", () => {
      const node = Text("Hello").position(50, 100);

      const position = node.getAttribute(AttributeKey.position) as any;
      assert.strictEqual(position.x, 50);
      assert.strictEqual(position.y, 100);
    });

    test("rotationEffect sets degrees", () => {
      const node = Text("Hello").rotationEffect(45);

      const rotation = node.getAttribute(AttributeKey.rotationEffect) as any;
      assert.strictEqual(rotation.degrees, 45);
      assert.strictEqual(rotation.anchor, "center");
    });

    test("rotationEffect sets degrees with anchor", () => {
      const node = Text("Hello").rotationEffect(90, "topLeading");

      const rotation = node.getAttribute(AttributeKey.rotationEffect) as any;
      assert.strictEqual(rotation.degrees, 90);
      assert.strictEqual(rotation.anchor, "topLeading");
    });

    test("rotationEffectRadians sets radians", () => {
      const node = Text("Hello").rotationEffectRadians(3.14);

      const rotation = node.getAttribute(AttributeKey.rotationEffect) as any;
      assert.strictEqual(rotation.radians, 3.14);
      assert.strictEqual(rotation.anchor, "center");
    });

    test("rotationEffectRadians sets radians with anchor", () => {
      const node = Text("Hello").rotationEffectRadians(1.57, "bottomTrailing");

      const rotation = node.getAttribute(AttributeKey.rotationEffect) as any;
      assert.strictEqual(rotation.radians, 1.57);
      assert.strictEqual(rotation.anchor, "bottomTrailing");
    });

    test("rotation3DEffect sets degrees with axis", () => {
      const node = Text("Hello").rotation3DEffect(45, { x: 1, y: 0, z: 0 });

      const rotation = node.getAttribute(AttributeKey.rotation3DEffect) as any;
      assert.strictEqual(rotation.degrees, 45);
      assert.strictEqual(rotation.x, 1);
      assert.strictEqual(rotation.y, 0);
      assert.strictEqual(rotation.z, 0);
      assert.strictEqual(rotation.anchor, "center");
      assert.strictEqual(rotation.anchorZ, 0);
      assert.strictEqual(rotation.perspective, 1);
    });

    test("rotation3DEffect sets all parameters", () => {
      const node = Text("Hello").rotation3DEffect(90, { x: 0, y: 1, z: 0 }, "topLeading", 10, 0.5);

      const rotation = node.getAttribute(AttributeKey.rotation3DEffect) as any;
      assert.strictEqual(rotation.degrees, 90);
      assert.strictEqual(rotation.x, 0);
      assert.strictEqual(rotation.y, 1);
      assert.strictEqual(rotation.z, 0);
      assert.strictEqual(rotation.anchor, "topLeading");
      assert.strictEqual(rotation.anchorZ, 10);
      assert.strictEqual(rotation.perspective, 0.5);
    });

    test("rotation3DEffectRadians sets radians with axis", () => {
      const node = Text("Hello").rotation3DEffectRadians(1.57, { x: 0, y: 0, z: 1 });

      const rotation = node.getAttribute(AttributeKey.rotation3DEffect) as any;
      assert.strictEqual(rotation.radians, 1.57);
      assert.strictEqual(rotation.x, 0);
      assert.strictEqual(rotation.y, 0);
      assert.strictEqual(rotation.z, 1);
      assert.strictEqual(rotation.anchor, "center");
      assert.strictEqual(rotation.anchorZ, 0);
      assert.strictEqual(rotation.perspective, 1);
    });

    test("rotation3DEffectRadians sets all parameters", () => {
      const node = Text("Hello").rotation3DEffectRadians(
        3.14,
        { x: 1, y: 1, z: 0 },
        "bottomTrailing",
        5,
        0.8,
      );

      const rotation = node.getAttribute(AttributeKey.rotation3DEffect) as any;
      assert.strictEqual(rotation.radians, 3.14);
      assert.strictEqual(rotation.x, 1);
      assert.strictEqual(rotation.y, 1);
      assert.strictEqual(rotation.z, 0);
      assert.strictEqual(rotation.anchor, "bottomTrailing");
      assert.strictEqual(rotation.anchorZ, 5);
      assert.strictEqual(rotation.perspective, 0.8);
    });

    test("perspective sets value", () => {
      const node = Text("Hello").perspective(0.5);

      assert.strictEqual(node.getAttribute(AttributeKey.perspective), 0.5);
    });

    test("perspective sets different values", () => {
      const node1 = Text("Test").perspective(0.2);
      assert.strictEqual(node1.getAttribute(AttributeKey.perspective), 0.2);

      const node2 = Text("Test").perspective(1.0);
      assert.strictEqual(node2.getAttribute(AttributeKey.perspective), 1.0);

      const node3 = Text("Test").perspective(2.0);
      assert.strictEqual(node3.getAttribute(AttributeKey.perspective), 2.0);
    });

    test("scaleEffect sets uniform scale", () => {
      const node = Text("Hello").scaleEffect(2.0);

      assert.strictEqual(node.getAttribute(AttributeKey.scaleEffect), 2.0);
    });

    test("scaleEffect sets x and y scale", () => {
      const node = Text("Hello").scaleEffect(1.5, 0.5);

      const scale = node.getAttribute(AttributeKey.scaleEffect) as any;
      assert.strictEqual(scale.x, 1.5);
      assert.strictEqual(scale.y, 0.5);
      assert.strictEqual(scale.anchor, "center");
    });

    test("scaleEffect sets x and y scale with anchor", () => {
      const node = Text("Hello").scaleEffect(2.0, 3.0, "leading");

      const scale = node.getAttribute(AttributeKey.scaleEffect) as any;
      assert.strictEqual(scale.x, 2.0);
      assert.strictEqual(scale.y, 3.0);
      assert.strictEqual(scale.anchor, "leading");
    });

    test("layoutPriority sets zero", () => {
      const node = Text("Hello").layoutPriority(0);

      assert.strictEqual(node.getAttribute(AttributeKey.layoutPriority), 0);
    });

    test("layoutPriority sets one", () => {
      const node = Text("Hello").layoutPriority(1);

      assert.strictEqual(node.getAttribute(AttributeKey.layoutPriority), 1);
    });

    test("layoutPriority sets custom value", () => {
      const node = Text("Hello").layoutPriority(2.5);

      assert.strictEqual(node.getAttribute(AttributeKey.layoutPriority), 2.5);
    });

    test("coordinateSpace sets name", () => {
      const node = Text("Hello").coordinateSpace("mySpace");

      assert.strictEqual(node.getAttribute(AttributeKey.coordinateSpace), "mySpace");
    });

    test("coordinateSpace sets different names", () => {
      const node1 = Text("Hello").coordinateSpace("container");
      assert.strictEqual(node1.getAttribute(AttributeKey.coordinateSpace), "container");

      const node2 = Text("World").coordinateSpace("scrollView");
      assert.strictEqual(node2.getAttribute(AttributeKey.coordinateSpace), "scrollView");
    });
  });

  describe("Gauge Label Modifiers", () => {
    test("currentValueLabel with string creates text node", () => {
      const node = Gauge("Speed", 0.5).currentValueLabel("50%");

      const label = node.getAttribute(AttributeKey.currentValueLabel) as Node;
      assert.ok(label instanceof Node);
      assert.strictEqual(label.type, "Text");
      assert.strictEqual(label.getAttribute(AttributeKey.text), "50%");
    });

    test("currentValueLabel with node uses node directly", () => {
      const customLabel = Text("Custom").bold();
      const node = Gauge("Speed", 0.5).currentValueLabel(customLabel);

      const label = node.getAttribute(AttributeKey.currentValueLabel) as Node;
      assert.strictEqual(label, customLabel);
    });

    test("minimumValueLabel with string creates text node", () => {
      const node = Gauge("Speed", 0.5).minimumValueLabel("0");

      const label = node.getAttribute(AttributeKey.minimumValueLabel) as Node;
      assert.ok(label instanceof Node);
      assert.strictEqual(label.type, "Text");
      assert.strictEqual(label.getAttribute(AttributeKey.text), "0");
    });

    test("minimumValueLabel with node uses node directly", () => {
      const customLabel = Text("Min").foregroundColor("gray");
      const node = Gauge("Speed", 0.5).minimumValueLabel(customLabel);

      const label = node.getAttribute(AttributeKey.minimumValueLabel) as Node;
      assert.strictEqual(label, customLabel);
    });

    test("maximumValueLabel with string creates text node", () => {
      const node = Gauge("Speed", 0.5).maximumValueLabel("100");

      const label = node.getAttribute(AttributeKey.maximumValueLabel) as Node;
      assert.ok(label instanceof Node);
      assert.strictEqual(label.type, "Text");
      assert.strictEqual(label.getAttribute(AttributeKey.text), "100");
    });

    test("maximumValueLabel with node uses node directly", () => {
      const customLabel = Text("Max").foregroundColor("green");
      const node = Gauge("Speed", 0.5).maximumValueLabel(customLabel);

      const label = node.getAttribute(AttributeKey.maximumValueLabel) as Node;
      assert.strictEqual(label, customLabel);
    });

    test("all gauge labels can be combined", () => {
      const node = Gauge("Speed", 0.75)
        .currentValueLabel("75%")
        .minimumValueLabel("0%")
        .maximumValueLabel("100%");

      const current = node.getAttribute(AttributeKey.currentValueLabel) as Node;
      const min = node.getAttribute(AttributeKey.minimumValueLabel) as Node;
      const max = node.getAttribute(AttributeKey.maximumValueLabel) as Node;

      assert.strictEqual(current.getAttribute(AttributeKey.text), "75%");
      assert.strictEqual(min.getAttribute(AttributeKey.text), "0%");
      assert.strictEqual(max.getAttribute(AttributeKey.text), "100%");
    });
  });

  describe("Color Modifiers", () => {
    test("foregroundColor sets foreground color", () => {
      const node = Text("Hello").foregroundColor("blue");

      assert.strictEqual(node.getAttribute(AttributeKey.foregroundColor), "blue");
    });

    test("backgroundColor sets background color", () => {
      const node = Text("Hello").backgroundColor("red");

      assert.strictEqual(node.getAttribute(AttributeKey.backgroundColor), "red");
    });
  });

  describe("Text Modifiers", () => {
    test("font sets font style", () => {
      const node = Text("Hello").font("body");

      assert.strictEqual(node.getAttribute(AttributeKey.font), "body");
    });

    test("fontWeight sets font weight", () => {
      const node = Text("Hello").fontWeight("bold");

      assert.strictEqual(node.getAttribute(AttributeKey.fontWeight), "bold");
    });

    test("bold sets bold to true", () => {
      const node = Text("Hello").bold();

      assert.strictEqual(node.getAttribute(AttributeKey.bold), true);
    });

    test("italic sets italic to true", () => {
      const node = Text("Hello").italic();

      assert.strictEqual(node.getAttribute(AttributeKey.italic), true);
    });

    test("underline sets underline to true", () => {
      const node = Text("Hello").underline();

      assert.strictEqual(node.getAttribute(AttributeKey.underline), true);
    });

    test("underline sets underline with color", () => {
      const node = Text("Hello").underline(true, "#FF0000");

      const underline = node.getAttribute(AttributeKey.underline) as any;
      assert.strictEqual(underline.isActive, true);
      assert.strictEqual(underline.color, "#FF0000");
    });

    test("underline sets inactive", () => {
      const node = Text("Hello").underline(false);

      const underline = node.getAttribute(AttributeKey.underline) as any;
      assert.strictEqual(underline.isActive, false);
    });

    test("strikethrough sets strikethrough to true", () => {
      const node = Text("Hello").strikethrough();

      assert.strictEqual(node.getAttribute(AttributeKey.strikethrough), true);
    });

    test("strikethrough sets strikethrough with color", () => {
      const node = Text("Hello").strikethrough(true, "#FF0000");

      const strikethrough = node.getAttribute(AttributeKey.strikethrough) as any;
      assert.strictEqual(strikethrough.isActive, true);
      assert.strictEqual(strikethrough.color, "#FF0000");
    });

    test("strikethrough sets inactive", () => {
      const node = Text("Hello").strikethrough(false);

      const strikethrough = node.getAttribute(AttributeKey.strikethrough) as any;
      assert.strictEqual(strikethrough.isActive, false);
    });

    test("kerning sets character spacing", () => {
      const node = Text("Hello").kerning(2);

      assert.strictEqual(node.getAttribute(AttributeKey.kerning), 2);
    });

    test("kerning sets negative spacing", () => {
      const node = Text("Hello").kerning(-1.5);

      assert.strictEqual(node.getAttribute(AttributeKey.kerning), -1.5);
    });

    test("kerning sets zero spacing", () => {
      const node = Text("Hello").kerning(0);

      assert.strictEqual(node.getAttribute(AttributeKey.kerning), 0);
    });

    test("tracking sets character spacing", () => {
      const node = Text("Hello").tracking(2);

      assert.strictEqual(node.getAttribute(AttributeKey.tracking), 2);
    });

    test("tracking sets negative spacing", () => {
      const node = Text("Hello").tracking(-1.5);

      assert.strictEqual(node.getAttribute(AttributeKey.tracking), -1.5);
    });

    test("tracking sets zero spacing", () => {
      const node = Text("Hello").tracking(0);

      assert.strictEqual(node.getAttribute(AttributeKey.tracking), 0);
    });

    test("lineSpacing sets vertical spacing", () => {
      const node = Text("Hello").lineSpacing(5);

      assert.strictEqual(node.getAttribute(AttributeKey.lineSpacing), 5);
    });

    test("lineSpacing sets large spacing", () => {
      const node = Text("Hello").lineSpacing(15);

      assert.strictEqual(node.getAttribute(AttributeKey.lineSpacing), 15);
    });

    test("lineSpacing sets zero spacing", () => {
      const node = Text("Hello").lineSpacing(0);

      assert.strictEqual(node.getAttribute(AttributeKey.lineSpacing), 0);
    });

    test("minimumScaleFactor sets scale factor", () => {
      const node = Text("Hello").minimumScaleFactor(0.5);

      assert.strictEqual(node.getAttribute(AttributeKey.minimumScaleFactor), 0.5);
    });

    test("minimumScaleFactor sets one", () => {
      const node = Text("Hello").minimumScaleFactor(1.0);

      assert.strictEqual(node.getAttribute(AttributeKey.minimumScaleFactor), 1.0);
    });

    test("minimumScaleFactor sets small value", () => {
      const node = Text("Hello").minimumScaleFactor(0.2);

      assert.strictEqual(node.getAttribute(AttributeKey.minimumScaleFactor), 0.2);
    });

    test("lineLimit sets line limit", () => {
      const node = Text("Hello").lineLimit(2);

      assert.strictEqual(node.getAttribute(AttributeKey.lineLimit), 2);
    });

    test("truncationMode sets tail", () => {
      const node = Text("Hello").truncationMode("tail");

      assert.strictEqual(node.getAttribute(AttributeKey.truncationMode), "tail");
    });

    test("truncationMode sets middle", () => {
      const node = Text("Hello").truncationMode("middle");

      assert.strictEqual(node.getAttribute(AttributeKey.truncationMode), "middle");
    });

    test("truncationMode sets head", () => {
      const node = Text("Hello").truncationMode("head");

      assert.strictEqual(node.getAttribute(AttributeKey.truncationMode), "head");
    });

    test("allowsTightening sets true by default", () => {
      const node = Text("Hello").allowsTightening();

      assert.strictEqual(node.getAttribute(AttributeKey.allowsTightening), true);
    });

    test("allowsTightening sets true explicitly", () => {
      const node = Text("Hello").allowsTightening(true);

      assert.strictEqual(node.getAttribute(AttributeKey.allowsTightening), true);
    });

    test("allowsTightening sets false", () => {
      const node = Text("Hello").allowsTightening(false);

      assert.strictEqual(node.getAttribute(AttributeKey.allowsTightening), false);
    });

    test("baselineOffset sets positive value", () => {
      const node = Text("Hello").baselineOffset(10);

      assert.strictEqual(node.getAttribute(AttributeKey.baselineOffset), 10);
    });

    test("baselineOffset sets negative value", () => {
      const node = Text("Hello").baselineOffset(-5);

      assert.strictEqual(node.getAttribute(AttributeKey.baselineOffset), -5);
    });

    test("baselineOffset sets zero", () => {
      const node = Text("Hello").baselineOffset(0);

      assert.strictEqual(node.getAttribute(AttributeKey.baselineOffset), 0);
    });
  });

  describe("Shape Modifiers", () => {
    test("cornerRadius sets corner radius", () => {
      const node = Circle().cornerRadius(10);

      assert.strictEqual(node.getAttribute(AttributeKey.cornerRadius), 10);
    });

    test("clipShape sets clip shape", () => {
      const node = Text("Hello").clipShape(Circle());

      const clipShape = node.getAttribute(AttributeKey.clipShape);
      assert.ok(clipShape instanceof Object); // It's a Node
    });
  });

  describe("Visual Effect Modifiers", () => {
    test("opacity sets opacity", () => {
      const node = Text("Hello").opacity(0.5);

      assert.strictEqual(node.getAttribute(AttributeKey.opacity), 0.5);
    });

    test("blendMode sets multiply", () => {
      const node = Text("Hello").blendMode("multiply");

      assert.strictEqual(node.getAttribute(AttributeKey.blendMode), "multiply");
    });

    test("blendMode sets screen", () => {
      const node = Text("Hello").blendMode("screen");

      assert.strictEqual(node.getAttribute(AttributeKey.blendMode), "screen");
    });

    test("blendMode sets overlay", () => {
      const node = Text("Hello").blendMode("overlay");

      assert.strictEqual(node.getAttribute(AttributeKey.blendMode), "overlay");
    });

    test("blendMode can be chained", () => {
      const node = Text("Hello").blendMode("multiply").opacity(0.5);

      assert.strictEqual(node.getAttribute(AttributeKey.blendMode), "multiply");
      assert.strictEqual(node.getAttribute(AttributeKey.opacity), 0.5);
    });

    test("brightness sets brightness", () => {
      const node = Text("Hello").brightness(0.3);

      assert.strictEqual(node.getAttribute(AttributeKey.brightness), 0.3);
    });

    test("brightness sets negative brightness", () => {
      const node = Text("Hello").brightness(-0.5);

      assert.strictEqual(node.getAttribute(AttributeKey.brightness), -0.5);
    });

    test("brightness can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .brightness(0.2)
        .padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.brightness), 0.2);
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("contrast sets contrast", () => {
      const node = Text("Hello").contrast(1.5);

      assert.strictEqual(node.getAttribute(AttributeKey.contrast), 1.5);
    });

    test("contrast sets low contrast", () => {
      const node = Text("Hello").contrast(0.5);

      assert.strictEqual(node.getAttribute(AttributeKey.contrast), 0.5);
    });

    test("contrast can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .contrast(2.0)
        .padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.contrast), 2.0);
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("saturation sets saturation", () => {
      const node = Text("Hello").saturation(1.5);

      assert.strictEqual(node.getAttribute(AttributeKey.saturation), 1.5);
    });

    test("saturation sets grayscale", () => {
      const node = Text("Hello").saturation(0.0);

      assert.strictEqual(node.getAttribute(AttributeKey.saturation), 0.0);
    });

    test("saturation can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .saturation(2.0)
        .padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.saturation), 2.0);
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("grayscale sets grayscale", () => {
      const node = Text("Hello").grayscale(0.5);

      assert.strictEqual(node.getAttribute(AttributeKey.grayscale), 0.5);
    });

    test("grayscale sets full grayscale", () => {
      const node = Text("Hello").grayscale(1.0);

      assert.strictEqual(node.getAttribute(AttributeKey.grayscale), 1.0);
    });

    test("grayscale can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .grayscale(0.8)
        .padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.grayscale), 0.8);
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("hueRotation sets rotation", () => {
      const node = Text("Hello").hueRotation(90);

      assert.strictEqual(node.getAttribute(AttributeKey.hueRotation), 90);
    });

    test("hueRotation sets 180 degrees", () => {
      const node = Text("Hello").hueRotation(180);

      assert.strictEqual(node.getAttribute(AttributeKey.hueRotation), 180);
    });

    test("hueRotation can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .hueRotation(45)
        .padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.hueRotation), 45);
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("hueRotation with degrees object", () => {
      const node = Text("Hello").hueRotation({ degrees: 90 });

      const attr = node.getAttribute(AttributeKey.hueRotation) as any;
      assert.strictEqual(attr.degrees, 90);
    });

    test("hueRotation with radians object", () => {
      const node = Text("Hello").hueRotation({ radians: 1.57 });

      const attr = node.getAttribute(AttributeKey.hueRotation) as any;
      assert.strictEqual(attr.radians, 1.57);
    });

    test("hueRotation with zero", () => {
      const node = Text("Hello").hueRotation({ zero: true });

      const attr = node.getAttribute(AttributeKey.hueRotation) as any;
      assert.strictEqual(attr.zero, true);
    });

    test("colorInvert inverts colors", () => {
      const node = Text("Hello").colorInvert();

      assert.strictEqual(node.getAttribute(AttributeKey.colorInvert), true);
    });

    test("colorInvert can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .colorInvert()
        .padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.colorInvert), true);
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("luminanceToAlpha converts luminance to alpha", () => {
      const node = Text("Hello").luminanceToAlpha();

      assert.strictEqual(node.getAttribute(AttributeKey.luminanceToAlpha), true);
    });

    test("luminanceToAlpha can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .luminanceToAlpha()
        .padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.luminanceToAlpha), true);
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("colorMultiply multiplies colors", () => {
      const node = Text("Hello").colorMultiply("#FF0000");

      assert.strictEqual(node.getAttribute(AttributeKey.colorMultiply), "#FF0000");
    });

    test("colorMultiply can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .colorMultiply("#00FF00")
        .padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.colorMultiply), "#00FF00");
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("hidden sets hidden to true", () => {
      const node = Text("Hello").hidden();

      assert.strictEqual(node.getAttribute(AttributeKey.hidden), true);
    });

    test("clipped sets clipped to true", () => {
      const node = Text("Hello").clipped();

      assert.strictEqual(node.getAttribute(AttributeKey.clipped), true);
    });

    test("ignoresSafeArea sets ignoresSafeArea to true", () => {
      const node = Text("Hello").ignoresSafeArea();

      assert.strictEqual(node.getAttribute(AttributeKey.ignoresSafeArea), true);
    });

    test("ignoresSafeArea sets edges", () => {
      const node = Text("Hello").ignoresSafeArea("top");

      assert.strictEqual(node.getAttribute(AttributeKey.ignoresSafeArea), "top");
    });

    test("safeAreaInset sets top edge", () => {
      const content = Text("Inset");
      const node = Text("Hello").safeAreaInset("top", "center", undefined, content);

      const inset = node.getAttribute(AttributeKey.safeAreaInset) as any;
      assert.strictEqual(inset.edge, "top");
      assert.strictEqual(inset.alignment, "center");
      assert.ok(inset.content);
    });

    test("safeAreaInset sets bottom with spacing", () => {
      const content = Text("Inset");
      const node = Text("Hello").safeAreaInset("bottom", "leading", 20, content);

      const inset = node.getAttribute(AttributeKey.safeAreaInset) as any;
      assert.strictEqual(inset.edge, "bottom");
      assert.strictEqual(inset.alignment, "leading");
      assert.strictEqual(inset.spacing, 20);
    });

    test("border sets border with color and width", () => {
      const node = Text("Hello").border("red", 1);

      const border = node.getAttribute(AttributeKey.border) as any;
      assert.strictEqual(border.color, "red");
      assert.strictEqual(border.width, 1);
    });

    test("border sets border with color and custom width", () => {
      const node = Text("Hello").border("blue", 2);

      const border = node.getAttribute(AttributeKey.border) as any;
      assert.strictEqual(border.color, "blue");
      assert.strictEqual(border.width, 2);
    });

    test("shadow sets shadow with color and defaults", () => {
      const node = Text("Hello").shadow("black");

      const shadow = node.getAttribute(AttributeKey.shadow) as any;
      assert.strictEqual(shadow.color, "black");
      assert.strictEqual(shadow.radius, 5);
      assert.strictEqual(shadow.x, 0);
      assert.strictEqual(shadow.y, 0);
    });

    test("shadow sets shadow with color, radius and offset", () => {
      const node = Text("Hello").shadow("black", 10, 2, 3);

      const shadow = node.getAttribute(AttributeKey.shadow) as any;
      assert.strictEqual(shadow.color, "black");
      assert.strictEqual(shadow.radius, 10);
      assert.strictEqual(shadow.x, 2);
      assert.strictEqual(shadow.y, 3);
    });
  });

  describe("Interaction Modifiers", () => {
    test("onTapGesture sets gesture action", () => {
      const node = Text("Hello").onTapGesture("handleTap");

      assert.strictEqual(node.getAttribute(AttributeKey.onTapGesture), "handleTap");
    });

    test("disabled sets disabled to true by default", () => {
      const node = Text("Hello").disabled();

      assert.strictEqual(node.getAttribute(AttributeKey.disabled), true);
    });

    test("disabled accepts explicit value", () => {
      const node = Text("Hello").disabled(false);

      assert.strictEqual(node.getAttribute(AttributeKey.disabled), false);
    });
  });

  describe("Modifier Chaining", () => {
    test("modifiers can be chained", () => {
      const node = Text("Hello")
        .font("body")
        .bold()
        .foregroundColor("blue")
        .padding(20)
        .cornerRadius(10)
        .opacity(0.9);

      assert.strictEqual(node.getAttribute(AttributeKey.font), "body");
      assert.strictEqual(node.getAttribute(AttributeKey.bold), true);
      assert.strictEqual(node.getAttribute(AttributeKey.foregroundColor), "blue");
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
      assert.strictEqual(node.getAttribute(AttributeKey.cornerRadius), 10);
      assert.strictEqual(node.getAttribute(AttributeKey.opacity), 0.9);
    });

    test("modifiers return new nodes (immutability)", () => {
      const original = Text("Hello");
      const step1 = original.bold();
      const step2 = step1.foregroundColor("blue");

      assert.notStrictEqual(original, step1);
      assert.notStrictEqual(step1, step2);
      assert.strictEqual(original.getAttribute(AttributeKey.bold), undefined);
      assert.strictEqual(step1.getAttribute(AttributeKey.bold), true);
      assert.strictEqual(step1.getAttribute(AttributeKey.foregroundColor), undefined);
      assert.strictEqual(step2.getAttribute(AttributeKey.foregroundColor), "blue");
    });
  });

  describe("Modifiers on Different View Types", () => {
    test("modifiers work on VStack", () => {
      const node = VStack(undefined, "center", [Text("Child")])
        .padding(20)
        .backgroundColor("gray");

      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
      assert.strictEqual(node.getAttribute(AttributeKey.backgroundColor), "gray");
    });

    test("modifiers work on shapes", () => {
      const node = Circle().foregroundColor("red").frame(50, 50);

      assert.strictEqual(node.getAttribute(AttributeKey.foregroundColor), "red");
      const frame = node.getAttribute(AttributeKey.frame) as any;
      assert.strictEqual(frame.width, 50);
      assert.strictEqual(frame.height, 50);
    });
  });

  describe("Text Field Style", () => {
    test("textFieldStyle sets automatic", () => {
      const node = Text("Hello").textFieldStyle("automatic");

      assert.strictEqual(node.getAttribute(AttributeKey.textFieldStyle), "automatic");
    });

    test("textFieldStyle sets plain", () => {
      const node = Text("Hello").textFieldStyle("plain");

      assert.strictEqual(node.getAttribute(AttributeKey.textFieldStyle), "plain");
    });

    test("textFieldStyle sets roundedBorder", () => {
      const node = Text("Hello").textFieldStyle("roundedBorder");

      assert.strictEqual(node.getAttribute(AttributeKey.textFieldStyle), "roundedBorder");
    });
  });

  describe("Button Style", () => {
    test("buttonStyle sets automatic", () => {
      const node = Text("Hello").buttonStyle("automatic");

      assert.strictEqual(node.getAttribute(AttributeKey.buttonStyle), "automatic");
    });

    test("buttonStyle sets plain", () => {
      const node = Text("Hello").buttonStyle("plain");

      assert.strictEqual(node.getAttribute(AttributeKey.buttonStyle), "plain");
    });

    test("buttonStyle sets bordered", () => {
      const node = Text("Hello").buttonStyle("bordered");

      assert.strictEqual(node.getAttribute(AttributeKey.buttonStyle), "bordered");
    });

    test("buttonStyle sets borderedProminent", () => {
      const node = Text("Hello").buttonStyle("borderedProminent");

      assert.strictEqual(node.getAttribute(AttributeKey.buttonStyle), "borderedProminent");
    });

    test("buttonStyle sets borderless", () => {
      const node = Text("Hello").buttonStyle("borderless");

      assert.strictEqual(node.getAttribute(AttributeKey.buttonStyle), "borderless");
    });
  });

  describe("Progress View Style", () => {
    test("progressViewStyle sets automatic", () => {
      const node = Text("Hello").progressViewStyle("automatic");

      assert.strictEqual(node.getAttribute(AttributeKey.progressViewStyle), "automatic");
    });

    test("progressViewStyle sets linear", () => {
      const node = Text("Hello").progressViewStyle("linear");

      assert.strictEqual(node.getAttribute(AttributeKey.progressViewStyle), "linear");
    });

    test("progressViewStyle sets circular", () => {
      const node = Text("Hello").progressViewStyle("circular");

      assert.strictEqual(node.getAttribute(AttributeKey.progressViewStyle), "circular");
    });
  });

  describe("List Style", () => {
    test("listStyle sets automatic", () => {
      const node = List([]).listStyle("automatic");

      assert.strictEqual(node.getAttribute(AttributeKey.listStyle), "automatic");
    });

    test("listStyle sets plain", () => {
      const node = List([]).listStyle("plain");

      assert.strictEqual(node.getAttribute(AttributeKey.listStyle), "plain");
    });

    test("listStyle sets grouped", () => {
      const node = List([]).listStyle("grouped");

      assert.strictEqual(node.getAttribute(AttributeKey.listStyle), "grouped");
    });

    test("listStyle sets inset", () => {
      const node = List([]).listStyle("inset");

      assert.strictEqual(node.getAttribute(AttributeKey.listStyle), "inset");
    });

    test("listStyle sets insetGrouped", () => {
      const node = List([]).listStyle("insetGrouped");

      assert.strictEqual(node.getAttribute(AttributeKey.listStyle), "insetGrouped");
    });

    test("listStyle sets sidebar", () => {
      const node = List([]).listStyle("sidebar");

      assert.strictEqual(node.getAttribute(AttributeKey.listStyle), "sidebar");
    });
  });

  describe("Toggle Style", () => {
    test("toggleStyle sets automatic", () => {
      const node = Toggle("Test").toggleStyle("automatic");

      assert.strictEqual(node.getAttribute(AttributeKey.toggleStyle), "automatic");
    });

    test("toggleStyle sets switch", () => {
      const node = Toggle("Test").toggleStyle("switch");

      assert.strictEqual(node.getAttribute(AttributeKey.toggleStyle), "switch");
    });

    test("toggleStyle sets button", () => {
      const node = Toggle("Test").toggleStyle("button");

      assert.strictEqual(node.getAttribute(AttributeKey.toggleStyle), "button");
    });
  });

  describe("Picker Style", () => {
    test("pickerStyle sets automatic", () => {
      const node = Picker("Test", []).pickerStyle("automatic");

      assert.strictEqual(node.getAttribute(AttributeKey.pickerStyle), "automatic");
    });

    test("pickerStyle sets inline", () => {
      const node = Picker("Test", []).pickerStyle("inline");

      assert.strictEqual(node.getAttribute(AttributeKey.pickerStyle), "inline");
    });

    test("pickerStyle sets menu", () => {
      const node = Picker("Test", []).pickerStyle("menu");

      assert.strictEqual(node.getAttribute(AttributeKey.pickerStyle), "menu");
    });

    test("pickerStyle sets navigationLink", () => {
      const node = Picker("Test", []).pickerStyle("navigationLink");

      assert.strictEqual(node.getAttribute(AttributeKey.pickerStyle), "navigationLink");
    });

    test("pickerStyle sets palette", () => {
      const node = Picker("Test", []).pickerStyle("palette");

      assert.strictEqual(node.getAttribute(AttributeKey.pickerStyle), "palette");
    });

    test("pickerStyle sets segmented", () => {
      const node = Picker("Test", []).pickerStyle("segmented");

      assert.strictEqual(node.getAttribute(AttributeKey.pickerStyle), "segmented");
    });

    test("pickerStyle sets wheel", () => {
      const node = Picker("Test", []).pickerStyle("wheel");

      assert.strictEqual(node.getAttribute(AttributeKey.pickerStyle), "wheel");
    });
  });

  describe("Labels Hidden", () => {
    test("labelsHidden sets true", () => {
      const node = Text("Hello").labelsHidden();

      assert.strictEqual(node.getAttribute(AttributeKey.labelsHidden), true);
    });
  });

  describe("Button Border Shape", () => {
    test("buttonBorderShape sets automatic", () => {
      const node = Text("Hello").buttonBorderShape("automatic");

      assert.strictEqual(node.getAttribute(AttributeKey.buttonBorderShape), "automatic");
    });

    test("buttonBorderShape sets capsule", () => {
      const node = Text("Hello").buttonBorderShape("capsule");

      assert.strictEqual(node.getAttribute(AttributeKey.buttonBorderShape), "capsule");
    });

    test("buttonBorderShape sets roundedRectangle", () => {
      const node = Text("Hello").buttonBorderShape("roundedRectangle");

      assert.strictEqual(node.getAttribute(AttributeKey.buttonBorderShape), "roundedRectangle");
    });
  });

  describe("Modifier Serialization", () => {
    test("modifiers serialize correctly", () => {
      const node = Text("Hello").bold().foregroundColor("blue").padding(20);

      const json = JSON.parse(JSON.stringify(node));

      const keys = json.attributes.map((item: any[]) => item[0]);
      assert.ok(keys.includes("text"));
      assert.ok(keys.includes("bold"));
      assert.ok(keys.includes("foregroundColor"));
      assert.ok(keys.includes("padding"));
    });
  });

  describe("Sheet Modifier", () => {
    test("sheet with basic content", () => {
      const sheetContent = Text("Sheet Content");
      const node = VStack(undefined, "center", [Text("Main")]).sheet(sheetContent);

      const sheet = node.getAttribute(AttributeKey.sheet) as any;
      assert.ok(sheet);
      assert.strictEqual(sheet.value.type, "Text");
      assert.strictEqual(sheet.isPresented, true);
      assert.strictEqual(sheet.animated, true);
    });

    test("sheet with all options", () => {
      const sheetContent = Text("Sheet");
      const node = VStack(undefined, "center", [Text("Main")]).sheet(
        sheetContent,
        "my-sheet",
        false,
        false,
        { action: "opened" },
        { action: "closed" },
      );

      const sheet = node.getAttribute(AttributeKey.sheet) as any;
      assert.strictEqual(sheet.id, "my-sheet");
      assert.strictEqual(sheet.isPresented, false);
      assert.strictEqual(sheet.animated, false);
      assert.deepStrictEqual(sheet.onPresented, { action: "opened" });
      assert.deepStrictEqual(sheet.onDismiss, { action: "closed" });
    });

    test("sheet serializes correctly", () => {
      const node = VStack(undefined, "center", [Text("Main")]).sheet(Text("Sheet"), "test-sheet");

      const json = JSON.parse(JSON.stringify(node));
      const sheetAttr = json.attributes.find((item: any[]) => item[0] === "sheet");

      assert.ok(sheetAttr);
      assert.strictEqual(sheetAttr[1].id, "test-sheet");
      assert.strictEqual(sheetAttr[1].value.$type, "node");
      assert.strictEqual(sheetAttr[1].value.value.type, "Text");
    });
  });

  describe("FullScreenCover Modifier", () => {
    test("fullScreenCover with basic content", () => {
      const coverContent = Text("Cover Content");
      const node = VStack(undefined, "center", [Text("Main")]).fullScreenCover(coverContent);

      const cover = node.getAttribute(AttributeKey.fullScreenCover) as any;
      assert.ok(cover);
      assert.strictEqual(cover.value.type, "Text");
      assert.strictEqual(cover.isPresented, true);
      assert.strictEqual(cover.animated, true);
    });

    test("fullScreenCover with all options", () => {
      const coverContent = Text("Cover");
      const node = VStack(undefined, "center", [Text("Main")]).fullScreenCover(
        coverContent,
        "my-cover",
        false,
        false,
        { action: "opened" },
        { action: "closed" },
      );

      const cover = node.getAttribute(AttributeKey.fullScreenCover) as any;
      assert.strictEqual(cover.id, "my-cover");
      assert.strictEqual(cover.isPresented, false);
      assert.strictEqual(cover.animated, false);
      assert.deepStrictEqual(cover.onPresented, { action: "opened" });
      assert.deepStrictEqual(cover.onDismiss, { action: "closed" });
    });

    test("fullScreenCover serializes correctly", () => {
      const node = VStack(undefined, "center", [Text("Main")]).fullScreenCover(
        Text("Cover"),
        "test-cover",
      );

      const json = JSON.parse(JSON.stringify(node));
      const coverAttr = json.attributes.find((item: any[]) => item[0] === "fullScreenCover");

      assert.ok(coverAttr);
      assert.strictEqual(coverAttr[1].id, "test-cover");
      assert.strictEqual(coverAttr[1].value.$type, "node");
      assert.strictEqual(coverAttr[1].value.value.type, "Text");
    });
  });

  describe("Alert Modifier", () => {
    test("alert with basic configuration", () => {
      const node = VStack(undefined, "center", [Text("Main")]).alert(
        "Delete Item?",
        "This action cannot be undone",
        true,
        [
          { label: "Cancel", role: "cancel" },
          { label: "Delete", role: "destructive", action: { action: "deleteItem" } },
        ],
      );

      const alert = node.getAttribute(AttributeKey.alert) as any;
      assert.ok(alert);
      assert.strictEqual(alert.title, "Delete Item?");
      assert.strictEqual(alert.message, "This action cannot be undone");
      assert.strictEqual(alert.isPresented, true);
      assert.strictEqual(alert.buttons.length, 2);
      assert.strictEqual(alert.buttons[0].label, "Cancel");
      assert.strictEqual(alert.buttons[0].role, "cancel");
      assert.strictEqual(alert.buttons[1].label, "Delete");
      assert.strictEqual(alert.buttons[1].role, "destructive");
    });

    test("alert without message", () => {
      const node = VStack(undefined, "center", [Text("Main")]).alert("Confirm", undefined, true, [
        { label: "OK" },
      ]);

      const alert = node.getAttribute(AttributeKey.alert) as any;
      assert.ok(alert);
      assert.strictEqual(alert.title, "Confirm");
      assert.strictEqual(alert.message, undefined);
    });

    test("alert with onDismiss", () => {
      const node = VStack(undefined, "center", [Text("Main")]).alert(
        "Alert",
        undefined,
        true,
        [{ label: "OK" }],
        { action: "alertDismissed" },
      );

      const alert = node.getAttribute(AttributeKey.alert) as any;
      assert.deepStrictEqual(alert.onDismiss, { action: "alertDismissed" });
    });

    test("alert serializes correctly", () => {
      const node = VStack(undefined, "center", [Text("Main")]).alert(
        "Test Alert",
        "Test Message",
        true,
        [{ label: "OK" }],
      );

      const json = JSON.parse(JSON.stringify(node));
      const alertAttr = json.attributes.find((item: any[]) => item[0] === "alert");

      assert.ok(alertAttr);
      assert.strictEqual(alertAttr[1].title, "Test Alert");
      assert.strictEqual(alertAttr[1].message, "Test Message");
      assert.ok(Array.isArray(alertAttr[1].buttons));
    });
  });

  describe("Toolbar", () => {
    test("toolbar sets single item", () => {
      const node = Text("Hello").toolbar(Text("Button"));

      const toolbar = node.getAttribute(AttributeKey.toolbar) as any;
      assert.ok(toolbar);
      assert.strictEqual(toolbar.type, "ToolbarContent");
      assert.strictEqual(toolbar.children.length, 1);
    });

    test("toolbar sets multiple items", () => {
      const node = Text("Hello").toolbar(Text("Button 1"), Text("Button 2"));

      const toolbar = node.getAttribute(AttributeKey.toolbar) as any;
      assert.ok(toolbar);
      assert.strictEqual(toolbar.type, "ToolbarContent");
      assert.strictEqual(toolbar.children.length, 2);
    });
  });

  describe("Navigation Modifiers", () => {
    test("navigationDestination with basic content", () => {
      const node = VStack(undefined, "center", [Text("Home")]).navigationDestination(
        "detail",
        Text("Detail View"),
      );

      const destination = node.getAttribute(AttributeKey.navigationDestination) as any;
      assert.ok(destination);
      assert.strictEqual(destination.value, "detail");
      assert.strictEqual(destination.isPresented, false);
      assert.strictEqual(destination.content.type, "Text");
    });

    test("navigationDestination with all options", () => {
      const node = VStack(undefined, "center", [Text("Home")]).navigationDestination(
        "detail",
        Text("Detail"),
        "my-detail",
        true,
        { action: "pushed" },
        { action: "popped" },
      );

      const destination = node.getAttribute(AttributeKey.navigationDestination) as any;
      assert.strictEqual(destination.value, "detail");
      assert.strictEqual(destination.id, "my-detail");
      assert.strictEqual(destination.isPresented, true);
      assert.deepStrictEqual(destination.onPresented, { action: "pushed" });
      assert.deepStrictEqual(destination.onDismiss, { action: "popped" });
    });

    test("navigationDestination serializes correctly", () => {
      const node = VStack(undefined, "center", [Text("Home")]).navigationDestination(
        "detail",
        Text("Detail"),
      );

      const json = JSON.parse(JSON.stringify(node));
      const destAttr = json.attributes.find((item: any[]) => item[0] === "navigationDestination");

      assert.ok(destAttr);
      assert.strictEqual(destAttr[1].value, "detail");
      assert.strictEqual(destAttr[1].isPresented, false);
      assert.ok(destAttr[1].content);
    });

    test("navigationTitle sets title", () => {
      const node = VStack(undefined, "center", [Text("Content")]).navigationTitle("Home Screen");

      assert.strictEqual(node.getAttribute(AttributeKey.navigationTitle), "Home Screen");
    });

    test("navigationTitle can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .padding(20)
        .navigationTitle("Screen")
        .navigationDestination("detail", Text("Detail"));

      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
      assert.strictEqual(node.getAttribute(AttributeKey.navigationTitle), "Screen");
      assert.ok(node.getAttribute(AttributeKey.navigationDestination));
    });

    test("navigationDestinationKey sets key", () => {
      const node = Text("Profile Screen").navigationDestinationKey("profile");

      assert.strictEqual(node.getAttribute(AttributeKey.navigationDestinationKey), "profile");
    });

    test("navigationDestinations with multiple destinations", () => {
      const dest1 = Text("Profile").navigationDestinationKey("profile");
      const dest2 = Text("Settings").navigationDestinationKey("settings");
      const node = VStack(undefined, "center", [Text("Home")]).navigationDestinations(dest1, dest2);

      const destinations = node.getAttribute(AttributeKey.navigationDestinations) as any[];
      assert.ok(destinations);
      assert.strictEqual(destinations.length, 2);
      assert.strictEqual(destinations[0].type.value || destinations[0].type, "Text");
      assert.strictEqual(
        destinations[0].getAttribute(AttributeKey.navigationDestinationKey),
        "profile",
      );
      assert.strictEqual(destinations[1].type.value || destinations[1].type, "Text");
      assert.strictEqual(
        destinations[1].getAttribute(AttributeKey.navigationDestinationKey),
        "settings",
      );
    });

    test("navigationDestinations serializes correctly", () => {
      const dest1 = Text("Profile").navigationDestinationKey("profile");
      const dest2 = Text("Settings").navigationDestinationKey("settings");
      const node = VStack(undefined, "center", [Text("Home")]).navigationDestinations(dest1, dest2);

      const json = JSON.parse(JSON.stringify(node));
      const destAttr = json.attributes.find((item: any[]) => item[0] === "navigationDestinations");

      assert.ok(destAttr);
      assert.strictEqual(destAttr[1].length, 2);
      // When nodes are serialized, they're wrapped with $type: "node" and value
      assert.strictEqual(destAttr[1][0].$type, "node");
      assert.strictEqual(destAttr[1][0].value.type, "Text");
      assert.strictEqual(destAttr[1][1].$type, "node");
      assert.strictEqual(destAttr[1][1].value.type, "Text");
    });
  });

  describe("Tab Modifiers", () => {
    test("tabViewStyle sets automatic", () => {
      const node = TabView([Text("Page 1"), Text("Page 2")]).tabViewStyle("automatic");

      assert.strictEqual(node.getAttribute(AttributeKey.tabViewStyle), "automatic");
    });

    test("tabViewStyle sets page", () => {
      const node = TabView([Text("Page 1"), Text("Page 2")]).tabViewStyle("page");

      assert.strictEqual(node.getAttribute(AttributeKey.tabViewStyle), "page");
    });

    test("tabViewStyle can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .tabViewStyle("page")
        .padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.tabViewStyle), "page");
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("tabViewStyle on different view types", () => {
      const textNode = Text("Test").tabViewStyle("automatic");
      const stackNode = HStack(undefined, "center", [Text("A"), Text("B")]).tabViewStyle("page");

      assert.strictEqual(textNode.getAttribute(AttributeKey.tabViewStyle), "automatic");
      assert.strictEqual(stackNode.getAttribute(AttributeKey.tabViewStyle), "page");
    });

    test("tabViewStyle serializes correctly", () => {
      const node = TabView([Text("Page 1"), Text("Page 2")]).tabViewStyle("page");

      const json = JSON.parse(JSON.stringify(node));
      const styleAttr = json.attributes.find((item: any[]) => item[0] === "tabViewStyle");

      assert.ok(styleAttr);
      assert.strictEqual(styleAttr[1], "page");
    });

    test("badge with string", () => {
      const node = Text("Inbox").badge("New");

      assert.strictEqual(node.getAttribute(AttributeKey.badge), "New");
    });

    test("badge with string number", () => {
      const node = Text("Messages").badge("99+");

      assert.strictEqual(node.getAttribute(AttributeKey.badge), "99+");
    });

    test("badge with integer", () => {
      const node = Text("Notifications").badge(5);

      assert.strictEqual(node.getAttribute(AttributeKey.badge), 5);
    });

    test("badge with zero", () => {
      const node = Text("Updates").badge(0);

      assert.strictEqual(node.getAttribute(AttributeKey.badge), 0);
    });

    test("badge can be chained", () => {
      const node = VStack(undefined, "center", [Text("Content")])
        .badge(42)
        .padding(20);

      assert.strictEqual(node.getAttribute(AttributeKey.badge), 42);
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("badge serializes string correctly", () => {
      const node = Text("Inbox").badge("New");

      const json = JSON.parse(JSON.stringify(node));
      const badgeAttr = json.attributes.find((item: any[]) => item[0] === "badge");

      assert.ok(badgeAttr);
      assert.strictEqual(badgeAttr[1], "New");
    });

    test("badge serializes integer correctly", () => {
      const node = Text("Messages").badge(10);

      const json = JSON.parse(JSON.stringify(node));
      const badgeAttr = json.attributes.find((item: any[]) => item[0] === "badge");

      assert.ok(badgeAttr);
      assert.strictEqual(badgeAttr[1], 10);
    });
  });

  describe("Accessibility Modifiers", () => {
    test("accessibilitySortPriority sets sort priority", () => {
      const node = Text("Hello").accessibilitySortPriority(1.5);

      assert.strictEqual(node.getAttribute(AttributeKey.accessibilitySortPriority), 1.5);
    });

    test("accessibilitySortPriority with zero", () => {
      const node = Text("Hello").accessibilitySortPriority(0);

      assert.strictEqual(node.getAttribute(AttributeKey.accessibilitySortPriority), 0);
    });

    test("accessibilitySortPriority with negative value", () => {
      const node = Text("Hello").accessibilitySortPriority(-2);

      assert.strictEqual(node.getAttribute(AttributeKey.accessibilitySortPriority), -2);
    });

    test("accessibilityElement sets contain", () => {
      const node = VStack(undefined, "center", [Text("Hello"), Text("World")]).accessibilityElement(
        "contain",
      );

      assert.strictEqual(node.getAttribute(AttributeKey.accessibilityElement), "contain");
    });

    test("accessibilityElement sets ignore", () => {
      const node = VStack(undefined, "center", [Text("Hello"), Text("World")]).accessibilityElement(
        "ignore",
      );

      assert.strictEqual(node.getAttribute(AttributeKey.accessibilityElement), "ignore");
    });

    test("accessibilityElement sets combine", () => {
      const node = VStack(undefined, "center", [Text("Hello"), Text("World")]).accessibilityElement(
        "combine",
      );

      assert.strictEqual(node.getAttribute(AttributeKey.accessibilityElement), "combine");
    });

    test("accessibilityInputLabels sets single label", () => {
      const node = Text("Submit").accessibilityInputLabels(["Send"]);

      const labels = node.getAttribute(AttributeKey.accessibilityInputLabels) as string[];
      assert.deepStrictEqual(labels, ["Send"]);
    });

    test("accessibilityInputLabels sets multiple labels", () => {
      const node = Text("Submit").accessibilityInputLabels(["Send", "Go", "Submit"]);

      const labels = node.getAttribute(AttributeKey.accessibilityInputLabels) as string[];
      assert.deepStrictEqual(labels, ["Send", "Go", "Submit"]);
    });

    test("accessibilityInputLabels with empty array", () => {
      const node = Text("Submit").accessibilityInputLabels([]);

      const labels = node.getAttribute(AttributeKey.accessibilityInputLabels) as string[];
      assert.deepStrictEqual(labels, []);
    });

    test("multiple accessibility modifiers can be combined", () => {
      const node = Text("Important Button")
        .accessibilitySortPriority(2)
        .accessibilityElement("combine")
        .accessibilityInputLabels(["Tap", "Press"]);

      assert.strictEqual(node.getAttribute(AttributeKey.accessibilitySortPriority), 2);
      assert.strictEqual(node.getAttribute(AttributeKey.accessibilityElement), "combine");
      const labels = node.getAttribute(AttributeKey.accessibilityInputLabels) as string[];
      assert.deepStrictEqual(labels, ["Tap", "Press"]);
    });

    test("accessibilityRemoveTraits with single trait", () => {
      const node = Text("Hello").accessibilityRemoveTraits("isButton");
      assert.strictEqual(node.getAttribute(AttributeKey.accessibilityRemoveTraits), "isButton");
    });

    test("accessibilityRemoveTraits with multiple traits", () => {
      const node = Text("Hello").accessibilityRemoveTraits(["isButton", "isHeader"]);
      const traits = node.getAttribute(AttributeKey.accessibilityRemoveTraits) as string[];
      assert.deepStrictEqual(traits, ["isButton", "isHeader"]);
    });

    test("accessibilityAction", () => {
      const node = Text("Hello").accessibilityAction("Refresh", { action: "refresh" });
      const action = node.getAttribute(AttributeKey.accessibilityAction) as {
        name: string;
        message: { action: string };
      };
      assert.strictEqual(action.name, "Refresh");
      assert.deepStrictEqual(action.message, { action: "refresh" });
    });

    test("combined accessibility modifiers with new modifiers", () => {
      const node = Text("Hello")
        .accessibilityLabel("Custom Label")
        .accessibilityTraits("isButton")
        .accessibilityRemoveTraits("isHeader")
        .accessibilityAction("Delete", { action: "delete", id: "item-1" });

      assert.strictEqual(node.getAttribute(AttributeKey.accessibilityLabel), "Custom Label");
      assert.strictEqual(node.getAttribute(AttributeKey.accessibilityTraits), "isButton");
      assert.strictEqual(node.getAttribute(AttributeKey.accessibilityRemoveTraits), "isHeader");
      const action = node.getAttribute(AttributeKey.accessibilityAction) as {
        name: string;
        message: { action: string; id: string };
      };
      assert.strictEqual(action.name, "Delete");
      assert.deepStrictEqual(action.message, { action: "delete", id: "item-1" });
    });

    test("preferredColorScheme sets light mode", () => {
      const node = Text("Hello").preferredColorScheme("light");
      assert.strictEqual(node.getAttribute(AttributeKey.preferredColorScheme), "light");
    });

    test("preferredColorScheme sets dark mode", () => {
      const node = Text("Hello").preferredColorScheme("dark");
      assert.strictEqual(node.getAttribute(AttributeKey.preferredColorScheme), "dark");
    });

    test("preferredColorScheme sets system default", () => {
      const node = Text("Hello").preferredColorScheme("system");
      assert.strictEqual(node.getAttribute(AttributeKey.preferredColorScheme), "system");
    });

    test("controlSize sets mini", () => {
      const node = Text("Hello").controlSize("mini");
      assert.strictEqual(node.getAttribute(AttributeKey.controlSize), "mini");
    });

    test("controlSize sets small", () => {
      const node = Text("Hello").controlSize("small");
      assert.strictEqual(node.getAttribute(AttributeKey.controlSize), "small");
    });

    test("controlSize sets regular", () => {
      const node = Text("Hello").controlSize("regular");
      assert.strictEqual(node.getAttribute(AttributeKey.controlSize), "regular");
    });

    test("controlSize sets large", () => {
      const node = Text("Hello").controlSize("large");
      assert.strictEqual(node.getAttribute(AttributeKey.controlSize), "large");
    });

    test("controlSize sets extraLarge", () => {
      const node = Text("Hello").controlSize("extraLarge");
      assert.strictEqual(node.getAttribute(AttributeKey.controlSize), "extraLarge");
    });

    test("navigationBarTitleDisplayMode sets automatic", () => {
      const node = Text("Hello").navigationBarTitleDisplayMode("automatic");
      assert.strictEqual(
        node.getAttribute(AttributeKey.navigationBarTitleDisplayMode),
        "automatic",
      );
    });

    test("navigationBarTitleDisplayMode sets inline", () => {
      const node = Text("Hello").navigationBarTitleDisplayMode("inline");
      assert.strictEqual(node.getAttribute(AttributeKey.navigationBarTitleDisplayMode), "inline");
    });

    test("navigationBarTitleDisplayMode sets large", () => {
      const node = Text("Hello").navigationBarTitleDisplayMode("large");
      assert.strictEqual(node.getAttribute(AttributeKey.navigationBarTitleDisplayMode), "large");
    });

    test("navigationBarHidden sets true by default", () => {
      const node = Text("Hello").navigationBarHidden();
      assert.strictEqual(node.getAttribute(AttributeKey.navigationBarHidden), true);
    });

    test("navigationBarHidden sets explicit false", () => {
      const node = Text("Hello").navigationBarHidden(false);
      assert.strictEqual(node.getAttribute(AttributeKey.navigationBarHidden), false);
    });

    test("navigationBarBackButtonHidden sets true by default", () => {
      const node = Text("Hello").navigationBarBackButtonHidden();
      assert.strictEqual(node.getAttribute(AttributeKey.navigationBarBackButtonHidden), true);
    });

    test("navigationBarBackButtonHidden sets explicit false", () => {
      const node = Text("Hello").navigationBarBackButtonHidden(false);
      assert.strictEqual(node.getAttribute(AttributeKey.navigationBarBackButtonHidden), false);
    });

    test("keyboardType sets default", () => {
      const node = Text("Hello").keyboardType("default");
      assert.strictEqual(node.getAttribute(AttributeKey.keyboardType), "default");
    });

    test("keyboardType sets emailAddress", () => {
      const node = Text("Hello").keyboardType("emailAddress");
      assert.strictEqual(node.getAttribute(AttributeKey.keyboardType), "emailAddress");
    });

    test("keyboardType sets numberPad", () => {
      const node = Text("Hello").keyboardType("numberPad");
      assert.strictEqual(node.getAttribute(AttributeKey.keyboardType), "numberPad");
    });

    test("keyboardType sets phonePad", () => {
      const node = Text("Hello").keyboardType("phonePad");
      assert.strictEqual(node.getAttribute(AttributeKey.keyboardType), "phonePad");
    });

    test("keyboardType sets URL", () => {
      const node = Text("Hello").keyboardType("URL");
      assert.strictEqual(node.getAttribute(AttributeKey.keyboardType), "URL");
    });

    test("keyboardType sets decimalPad", () => {
      const node = Text("Hello").keyboardType("decimalPad");
      assert.strictEqual(node.getAttribute(AttributeKey.keyboardType), "decimalPad");
    });

    test("autocapitalization sets words", () => {
      const node = Text("Hello").autocapitalization("words");
      assert.strictEqual(node.getAttribute(AttributeKey.autocapitalization), "words");
    });

    test("autocapitalization sets sentences", () => {
      const node = Text("Hello").autocapitalization("sentences");
      assert.strictEqual(node.getAttribute(AttributeKey.autocapitalization), "sentences");
    });

    test("textContentType sets emailAddress", () => {
      const node = Text("Hello").textContentType("emailAddress");
      assert.strictEqual(node.getAttribute(AttributeKey.textContentType), "emailAddress");
    });

    test("textContentType sets username", () => {
      const node = Text("Hello").textContentType("username");
      assert.strictEqual(node.getAttribute(AttributeKey.textContentType), "username");
    });

    test("textContentType sets password", () => {
      const node = Text("Hello").textContentType("password");
      assert.strictEqual(node.getAttribute(AttributeKey.textContentType), "password");
    });

    test("submitLabel sets search", () => {
      const node = Text("Hello").submitLabel("search");
      assert.strictEqual(node.getAttribute(AttributeKey.submitLabel), "search");
    });

    test("submitLabel sets done", () => {
      const node = Text("Hello").submitLabel("done");
      assert.strictEqual(node.getAttribute(AttributeKey.submitLabel), "done");
    });

    test("submitLabel sets send", () => {
      const node = Text("Hello").submitLabel("send");
      assert.strictEqual(node.getAttribute(AttributeKey.submitLabel), "send");
    });
  });

  describe("List Row Modifiers", () => {
    test("listRowBackground sets background node", () => {
      const node = Text("Hello").listRowBackground(Text("Background"));
      const attr = node.getAttribute(AttributeKey.listRowBackground);
      assert.ok(attr instanceof Node);
      assert.strictEqual(attr.type, "Text");
    });

    test("listRowBackground sets ignoreEquatable", () => {
      const node = Text("Hello").listRowBackground(Text("Background"));
      assert.strictEqual(node.getAttribute(AttributeKey.ignoreEquatable), true);
    });

    test("listRowInsets sets all values", () => {
      const node = Text("Hello").listRowInsets(10, 20, 30, 40);
      const insets = node.getAttribute(AttributeKey.listRowInsets);
      assert.deepStrictEqual(insets, {
        top: 10,
        leading: 20,
        bottom: 30,
        trailing: 40,
      });
    });

    test("listRowInsets uses defaults", () => {
      const node = Text("Hello").listRowInsets();
      const insets = node.getAttribute(AttributeKey.listRowInsets);
      assert.deepStrictEqual(insets, {
        top: 0,
        leading: 0,
        bottom: 0,
        trailing: 0,
      });
    });

    test("listRowInsets sets ignoreEquatable", () => {
      const node = Text("Hello").listRowInsets(10);
      assert.strictEqual(node.getAttribute(AttributeKey.ignoreEquatable), true);
    });

    test("listRowSeparator sets visibility only", () => {
      const node = Text("Hello").listRowSeparator("hidden");
      assert.strictEqual(node.getAttribute(AttributeKey.listRowSeparator), "hidden");
    });

    test("listRowSeparator sets visibility and edges", () => {
      const node = Text("Hello").listRowSeparator("hidden", "bottom");
      const attr = node.getAttribute(AttributeKey.listRowSeparator);
      assert.deepStrictEqual(attr, {
        visibility: "hidden",
        edges: "bottom",
      });
    });

    test("listRowSeparator sets ignoreEquatable (visibility only)", () => {
      const node = Text("Hello").listRowSeparator("hidden");
      assert.strictEqual(node.getAttribute(AttributeKey.ignoreEquatable), true);
    });

    test("listRowSeparator sets ignoreEquatable (visibility and edges)", () => {
      const node = Text("Hello").listRowSeparator("hidden", "bottom");
      assert.strictEqual(node.getAttribute(AttributeKey.ignoreEquatable), true);
    });
  });

  describe("Presentation Modifiers", () => {
    test("presentationDetents sets string array", () => {
      const node = Text("Hello").presentationDetents(["medium", "large"]);

      const detents = node.getAttribute(AttributeKey.presentationDetents);
      assert.ok(Array.isArray(detents));
      assert.strictEqual(detents.length, 2);
      assert.strictEqual(detents[0], "medium");
      assert.strictEqual(detents[1], "large");
    });

    test("presentationDetents sets mixed array", () => {
      const node = Text("Hello").presentationDetents([
        "medium",
        { type: "fraction", value: 0.5 },
        { type: "height", value: 300 },
      ]);

      const detents = node.getAttribute(AttributeKey.presentationDetents) as any[];
      assert.ok(Array.isArray(detents));
      assert.strictEqual(detents.length, 3);
      assert.strictEqual(detents[0], "medium");
      assert.deepStrictEqual(detents[1], { type: "fraction", value: 0.5 });
      assert.deepStrictEqual(detents[2], { type: "height", value: 300 });
    });

    test("presentationDetents can be chained", () => {
      const node = Text("Hello").presentationDetents(["medium"]).padding(20);

      assert.ok(node.getAttribute(AttributeKey.presentationDetents));
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 20);
    });

    test("presentationDragIndicator sets visible", () => {
      const node = Text("Hello").presentationDragIndicator("visible");

      assert.strictEqual(node.getAttribute(AttributeKey.presentationDragIndicator), "visible");
    });

    test("presentationDragIndicator sets hidden", () => {
      const node = Text("Hello").presentationDragIndicator("hidden");

      assert.strictEqual(node.getAttribute(AttributeKey.presentationDragIndicator), "hidden");
    });

    test("presentationDragIndicator sets automatic", () => {
      const node = Text("Hello").presentationDragIndicator("automatic");

      assert.strictEqual(node.getAttribute(AttributeKey.presentationDragIndicator), "automatic");
    });

    test("presentationDragIndicator can be chained", () => {
      const node = Text("Hello").presentationDragIndicator("visible").padding(10);

      assert.strictEqual(node.getAttribute(AttributeKey.presentationDragIndicator), "visible");
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 10);
    });

    test("interactiveDismissDisabled defaults to true", () => {
      const node = Text("Hello").interactiveDismissDisabled();

      assert.strictEqual(node.getAttribute(AttributeKey.interactiveDismissDisabled), true);
    });

    test("interactiveDismissDisabled sets true", () => {
      const node = Text("Hello").interactiveDismissDisabled(true);

      assert.strictEqual(node.getAttribute(AttributeKey.interactiveDismissDisabled), true);
    });

    test("interactiveDismissDisabled sets false", () => {
      const node = Text("Hello").interactiveDismissDisabled(false);

      assert.strictEqual(node.getAttribute(AttributeKey.interactiveDismissDisabled), false);
    });

    test("interactiveDismissDisabled can be chained", () => {
      const node = Text("Hello").interactiveDismissDisabled(true).padding(15);

      assert.strictEqual(node.getAttribute(AttributeKey.interactiveDismissDisabled), true);
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 15);
    });

    test("combined presentation modifiers", () => {
      const node = Text("Hello")
        .presentationDetents(["medium", "large"])
        .presentationDragIndicator("visible")
        .interactiveDismissDisabled(true);

      const detents = node.getAttribute(AttributeKey.presentationDetents);
      assert.ok(Array.isArray(detents));

      assert.strictEqual(node.getAttribute(AttributeKey.presentationDragIndicator), "visible");
      assert.strictEqual(node.getAttribute(AttributeKey.interactiveDismissDisabled), true);
    });
  });

  describe("Shape Modifiers", () => {
    test("trim with single argument (to)", () => {
      const node = Circle().trim(0.75);

      const trim = node.getAttribute(AttributeKey.trim);
      assert.strictEqual(trim, 0.75);
    });

    test("trim with from and to arguments", () => {
      const node = Circle().trim(0.25, 0.75);

      const trim = node.getAttribute(AttributeKey.trim) as any;
      assert.strictEqual(trim.from, 0.25);
      assert.strictEqual(trim.to, 0.75);
    });

    test("trim can be combined with stroke", () => {
      const node = Circle().trim(0.5).stroke("#FF0000", 5);

      assert.strictEqual(node.getAttribute(AttributeKey.trim), 0.5);

      const stroke = node.getAttribute(AttributeKey.stroke) as any;
      assert.strictEqual(stroke.color, "#FF0000");
      assert.strictEqual(stroke.lineWidth, 5);
    });

    test("trim can be combined with fill", () => {
      const node = RoundedRectangle(10).trim(0.25, 0.75).fill("#0000FF");

      const trim = node.getAttribute(AttributeKey.trim) as any;
      assert.strictEqual(trim.from, 0.25);
      assert.strictEqual(trim.to, 0.75);
      assert.strictEqual(node.getAttribute(AttributeKey.fill), "#0000FF");
    });

    test("trim serializes correctly", () => {
      const node = Circle().trim(0.6);
      const json = JSON.parse(JSON.stringify(node));

      assert.strictEqual(json.type, "Circle");
      const trimAttr = json.attributes.find((attr: any) => attr[0] === "trim");
      assert.ok(trimAttr);
      assert.strictEqual(trimAttr[1], 0.6);
    });

    test("trim with from/to serializes correctly", () => {
      const node = Circle().trim(0.2, 0.8);
      const json = JSON.parse(JSON.stringify(node));

      const trimAttr = json.attributes.find((attr: any) => attr[0] === "trim");
      assert.ok(trimAttr);
      assert.strictEqual(trimAttr[1].from, 0.2);
      assert.strictEqual(trimAttr[1].to, 0.8);
    });
  });
});
