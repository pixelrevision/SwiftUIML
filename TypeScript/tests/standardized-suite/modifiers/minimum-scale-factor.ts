/**
 * MinimumScaleFactor modifier test definitions
 * Must match Swift MinimumScaleFactorTests.swift
 */
import { Node, VStack, Text } from "../../../src/index";

export function generateMinimumScaleFactorTests(): Record<string, Node> {
  return {
    "modifier.minimum-scale-factor.variations": VStack(20, undefined, [
      Text("This is a long text that should scale down to fit")
        .font(30)
        .frame(150, undefined)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
        .border("red", 1),
      Text("This is a long text that should scale down more")
        .font(30)
        .frame(150, undefined)
        .lineLimit(1)
        .minimumScaleFactor(0.3)
        .border("blue", 1),
      Text("Short text")
        .font(30)
        .frame(150, undefined)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
        .border("green", 1),
    ]),

    "modifier.minimum-scale-factor.different-values": VStack(16, undefined, [
      Text("Scale factor 1.0 (no scaling)")
        .font(24)
        .frame(120, undefined)
        .lineLimit(1)
        .minimumScaleFactor(1.0)
        .border("gray", 1),
      Text("Scale factor 0.8")
        .font(24)
        .frame(120, undefined)
        .lineLimit(1)
        .minimumScaleFactor(0.8)
        .border("gray", 1),
      Text("Scale factor 0.5")
        .font(24)
        .frame(120, undefined)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
        .border("gray", 1),
      Text("Scale factor 0.2")
        .font(24)
        .frame(120, undefined)
        .lineLimit(1)
        .minimumScaleFactor(0.2)
        .border("gray", 1),
    ]),
  };
}
