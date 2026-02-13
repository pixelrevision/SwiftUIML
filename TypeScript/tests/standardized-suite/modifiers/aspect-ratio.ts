/**
 * AspectRatio modifier test definitions
 * Must match Swift AspectRatioTests.swift
 */
import { Node, VStack, Circle, RoundedRectangle, Rectangle } from "../../../src/index";

export function generateAspectRatioTests(): Record<string, Node> {
  return {
    "modifier.aspect-ratio.fit": VStack(4, undefined, [
      Circle()
        .fill("#FF0000:#FF453A")
        .aspectRatio(1.0, "fit")
        .frame(100, 60)
        .border("#CCCCCC:#666666", 1),
    ]),

    "modifier.aspect-ratio.fill": VStack(4, undefined, [
      RoundedRectangle(20)
        .fill("#0000FF33:#0A84FF33")
        .aspectRatio(1.0, "fill")
        .frame(100, 60)
        .border("#CCCCCC:#666666", 1),
    ]),

    "modifier.aspect-ratio.wide": VStack(4, undefined, [
      Rectangle()
        .fill("#00AA00:#30D158")
        .aspectRatio(2.0, "fit")
        .frame(80, 80)
        .border("#CCCCCC:#666666", 1),
    ]),
  };
}
