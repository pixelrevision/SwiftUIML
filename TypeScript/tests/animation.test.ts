import { describe, test } from "node:test";
import assert from "node:assert";
import {
  Text,
  AttributeKey,
  easeIn,
  easeOut,
  easeInOut,
  linear,
  spring,
  bouncy,
  smooth,
  snappy,
  delay,
  speed,
  repeatCount,
  repeatForever,
} from "../src/index";

describe("Animation Types", () => {
  describe("Base Animations - Timing Curves", () => {
    test("easeIn creates correct animation", () => {
      const anim = easeIn(0.5).toAttributeValue();
      assert.strictEqual(anim.type, "easeIn");
      assert.strictEqual(anim.duration, 0.5);
      assert.strictEqual(anim.next, undefined);
    });

    test("easeIn uses default duration", () => {
      const anim = easeIn().toAttributeValue();
      assert.strictEqual(anim.duration, 0.35);
    });

    test("easeOut creates correct animation", () => {
      const anim = easeOut(0.3).toAttributeValue();
      assert.strictEqual(anim.type, "easeOut");
      assert.strictEqual(anim.duration, 0.3);
    });

    test("easeInOut creates correct animation", () => {
      const anim = easeInOut(0.4).toAttributeValue();
      assert.strictEqual(anim.type, "easeInOut");
      assert.strictEqual(anim.duration, 0.4);
    });

    test("linear creates correct animation", () => {
      const anim = linear(0.2).toAttributeValue();
      assert.strictEqual(anim.type, "linear");
      assert.strictEqual(anim.duration, 0.2);
    });
  });

  describe("Base Animations - Spring", () => {
    test("spring creates correct animation with all params", () => {
      const anim = spring(0.6, 0.8, 0.1).toAttributeValue();
      assert.strictEqual(anim.type, "spring");
      assert.strictEqual(anim.response, 0.6);
      assert.strictEqual(anim.dampingFraction, 0.8);
      assert.strictEqual(anim.blendDuration, 0.1);
    });

    test("spring uses default params", () => {
      const anim = spring().toAttributeValue();
      assert.strictEqual(anim.response, 0.55);
      assert.strictEqual(anim.dampingFraction, 0.825);
      assert.strictEqual(anim.blendDuration, 0);
    });

    test("bouncy creates correct animation", () => {
      const anim = bouncy(0.6).toAttributeValue();
      assert.strictEqual(anim.type, "bouncy");
      assert.strictEqual(anim.duration, 0.6);
    });

    test("smooth creates correct animation", () => {
      const anim = smooth(0.45).toAttributeValue();
      assert.strictEqual(anim.type, "smooth");
      assert.strictEqual(anim.duration, 0.45);
    });

    test("snappy creates correct animation", () => {
      const anim = snappy(0.25).toAttributeValue();
      assert.strictEqual(anim.type, "snappy");
      assert.strictEqual(anim.duration, 0.25);
    });
  });

  describe("Animation Modifiers", () => {
    test("delay creates correct modifier", () => {
      const anim = delay(0.5).toAttributeValue();
      assert.strictEqual(anim.type, "delay");
      assert.strictEqual(anim.delay, 0.5);
    });

    test("speed creates correct modifier", () => {
      const anim = speed(2.0).toAttributeValue();
      assert.strictEqual(anim.type, "speed");
      assert.strictEqual(anim.speed, 2.0);
    });

    test("repeatCount creates correct modifier", () => {
      const anim = repeatCount(3, true).toAttributeValue();
      assert.strictEqual(anim.type, "repeatCount");
      assert.strictEqual(anim.count, 3);
      assert.strictEqual(anim.autoreverses, true);
    });

    test("repeatCount defaults autoreverses to false", () => {
      const anim = repeatCount(3).toAttributeValue();
      assert.strictEqual(anim.autoreverses, false);
    });

    test("repeatForever creates correct modifier", () => {
      const anim = repeatForever(true).toAttributeValue();
      assert.strictEqual(anim.type, "repeatForever");
      assert.strictEqual(anim.autoreverses, true);
    });

    test("repeatForever defaults autoreverses to false", () => {
      const anim = repeatForever().toAttributeValue();
      assert.strictEqual(anim.autoreverses, false);
    });
  });

  describe("Chaining Animations", () => {
    test("easeIn with delay", () => {
      const anim = easeIn(0.5).delay(0.2).toAttributeValue();
      assert.strictEqual(anim.type, "easeIn");
      assert.strictEqual(anim.duration, 0.5);

      const next = anim.next as any;
      assert.strictEqual(next.type, "delay");
      assert.strictEqual(next.delay, 0.2);
    });

    test("spring with delay and speed", () => {
      const anim = spring(0.6, 0.8).delay(0.2).speed(1.5).toAttributeValue();

      assert.strictEqual(anim.type, "spring");
      assert.strictEqual(anim.response, 0.6);
      assert.strictEqual(anim.dampingFraction, 0.8);

      const delayNext = anim.next as any;
      assert.strictEqual(delayNext.type, "delay");
      assert.strictEqual(delayNext.delay, 0.2);

      const speedNext = delayNext.next as any;
      assert.strictEqual(speedNext.type, "speed");
      assert.strictEqual(speedNext.speed, 1.5);
    });

    test("complex chain with multiple modifiers", () => {
      const anim = easeOut(0.5).delay(0.1).speed(2.0).repeatCount(3, true).toAttributeValue();

      assert.strictEqual(anim.type, "easeOut");
      assert.strictEqual(anim.duration, 0.5);

      const delayNext = anim.next as any;
      assert.strictEqual(delayNext.type, "delay");

      const speedNext = delayNext.next as any;
      assert.strictEqual(speedNext.type, "speed");

      const repeatNext = speedNext.next as any;
      assert.strictEqual(repeatNext.type, "repeatCount");
      assert.strictEqual(repeatNext.count, 3);
      assert.strictEqual(repeatNext.autoreverses, true);
      assert.strictEqual(repeatNext.next, undefined);
    });
  });
});

describe("Node Animation Modifier", () => {
  test("animation modifier with AttributeKey", () => {
    const node = Text("Hello")
      .foregroundColor("red")
      .animation(easeIn(0.5), AttributeKey.foregroundColor);

    const animationAttr = node.getAttribute(AttributeKey.animation) as any;
    assert.strictEqual(animationAttr.attribute, "foregroundColor");
    assert.strictEqual(animationAttr.type, "easeIn");
    assert.strictEqual(animationAttr.duration, 0.5);
  });

  test("animation modifier with string attribute", () => {
    const node = Text("Hello").opacity(1.0).animation(easeOut(0.3), "opacity");

    const animationAttr = node.getAttribute(AttributeKey.animation) as any;
    assert.strictEqual(animationAttr.attribute, "opacity");
    assert.strictEqual(animationAttr.type, "easeOut");
    assert.strictEqual(animationAttr.duration, 0.3);
  });

  test("animation with chained modifiers", () => {
    const node = Text("Animated")
      .foregroundColor("blue")
      .animation(spring(0.6, 0.8).delay(0.2).speed(1.5), AttributeKey.foregroundColor);

    const animationAttr = node.getAttribute(AttributeKey.animation) as any;
    assert.strictEqual(animationAttr.attribute, "foregroundColor");
    assert.strictEqual(animationAttr.type, "spring");
    assert.strictEqual(animationAttr.response, 0.6);

    const delayNext = animationAttr.next as any;
    assert.strictEqual(delayNext.type, "delay");
    assert.strictEqual(delayNext.delay, 0.2);

    const speedNext = delayNext.next as any;
    assert.strictEqual(speedNext.type, "speed");
    assert.strictEqual(speedNext.speed, 1.5);
  });

  test("animation serializes correctly to JSON", () => {
    const node = Text("Hello")
      .foregroundColor("red")
      .animation(easeIn(0.5).delay(0.2), "foregroundColor");

    const json = JSON.parse(JSON.stringify(node));

    // Find the animation attribute in the 2D array
    const animAttr = json.attributes.find((attr: any) => attr[0] === "animation");
    assert.ok(animAttr);

    const animValue = animAttr[1];
    assert.strictEqual(animValue.attribute, "foregroundColor");
    assert.strictEqual(animValue.type, "easeIn");
    assert.strictEqual(animValue.duration, 0.5);
    assert.strictEqual(animValue.next.type, "delay");
    assert.strictEqual(animValue.next.delay, 0.2);
  });
});
