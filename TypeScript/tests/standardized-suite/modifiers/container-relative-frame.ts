/**
 * ContainerRelativeFrame modifier test definitions
 * Must match Swift ContainerRelativeFrameTests.swift
 */
import { Node, HStack, VStack, Color, Text } from "../../../src/index";

export function generateContainerRelativeFrameTests(): Record<string, Node> {
  return {
    "modifier.container-relative-frame.horizontal": HStack(0, undefined, [
      Color("#FF3B30:#FF453A").containerRelativeFrame("horizontal", 3, 1, 0, "center"),
      Color("#34C759:#30D158").containerRelativeFrame("horizontal", 3, 1, 0, "center"),
      Color("#007AFF:#0A84FF").containerRelativeFrame("horizontal", 3, 1, 0, "center"),
    ]),

    "modifier.container-relative-frame.vertical": VStack(0, undefined, [
      Color("#FF3B30:#FF453A").containerRelativeFrame("vertical", 3, 1, 0, "center"),
      Color("#34C759:#30D158").containerRelativeFrame("vertical", 3, 1, 0, "center"),
      Color("#007AFF:#0A84FF").containerRelativeFrame("vertical", 3, 1, 0, "center"),
    ]),

    "modifier.container-relative-frame.both": VStack(0, undefined, [
      HStack(0, undefined, [
        Color("#FF3B30:#FF453A").containerRelativeFrame("both", 2, 1, 0, "center"),
        Color("#34C759:#30D158").containerRelativeFrame("both", 2, 1, 0, "center"),
      ]),
      HStack(0, undefined, [
        Color("#007AFF:#0A84FF").containerRelativeFrame("both", 2, 1, 0, "center"),
        Color("#FF9500:#FF9F0A").containerRelativeFrame("both", 2, 1, 0, "center"),
      ]),
    ]),

    "modifier.container-relative-frame.span-multiple": HStack(0, undefined, [
      Color("#FF3B30:#FF453A").containerRelativeFrame("horizontal", 4, 3, 0, "center"),
      Color("#34C759:#30D158").containerRelativeFrame("horizontal", 4, 1, 0, "center"),
    ]),

    "modifier.container-relative-frame.with-spacing": HStack(0, undefined, [
      Color("#FF3B30:#FF453A").containerRelativeFrame("horizontal", 3, 1, 10, "center"),
      Color("#34C759:#30D158").containerRelativeFrame("horizontal", 3, 1, 10, "center"),
      Color("#007AFF:#0A84FF").containerRelativeFrame("horizontal", 3, 1, 10, "center"),
    ]),

    "modifier.container-relative-frame.alignment": HStack(0, undefined, [
      Text("Top")
        .containerRelativeFrame("horizontal", 3, 1, 0, "top")
        .background(Color("#FF3B30:#FF453A")),
      Text("Center")
        .containerRelativeFrame("horizontal", 3, 1, 0, "center")
        .background(Color("#34C759:#30D158")),
      Text("Bottom")
        .containerRelativeFrame("horizontal", 3, 1, 0, "bottom")
        .background(Color("#007AFF:#0A84FF")),
    ]),

    "modifier.container-relative-frame.complex-layout": VStack(0, undefined, [
      Color("#FF3B30:#FF453A")
        .containerRelativeFrame("horizontal", 12, 12, 0, "center")
        .frame(undefined, 50),
      HStack(0, undefined, [
        Color("#34C759:#30D158").containerRelativeFrame("horizontal", 12, 3, 0, "center"),
        Color("#007AFF:#0A84FF").containerRelativeFrame("horizontal", 12, 9, 0, "center"),
      ]),
    ]),
  };
}
