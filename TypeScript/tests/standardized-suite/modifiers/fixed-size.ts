/**
 * FixedSize modifier test definitions
 * Must match Swift FixedSizeTests.swift
 */
import { Node, HStack, VStack, Color, Text } from "../../../src/index";

export function generateFixedSizeTests(): Record<string, Node> {
  return {
    "modifier.fixed-size.both-axes": HStack(10, undefined, [
      VStack(undefined, undefined, [
        Text("Wrapped"),
        Text("Text wraps here").frame(60, undefined).padding(4).border("#FF0000:#FF453A", 1),
      ]),

      VStack(undefined, undefined, [
        Text("Fixed"),
        Text("Text wraps here").fixedSize().padding(4).border("#00FF00:#30D158", 1),
      ]),
    ]),

    "modifier.fixed-size.horizontal-only": VStack(8, undefined, [
      Text("Without fixedSize:"),
      HStack(undefined, undefined, [Color("#FF0000:#FF453A").frame(50, 40), Text("Wraps")])
        .frame(80, undefined)
        .border("#FF0000:#FF453A", 1),

      Text("With fixedSize:"),
      HStack(undefined, undefined, [Color("#00FF00:#30D158").frame(50, 40), Text("Wraps")])
        .fixedSize(true, false)
        .border("#00FF00:#30D158", 1),
    ]),

    "modifier.fixed-size.vertical-only": HStack(10, undefined, [
      VStack(undefined, undefined, [
        Text("Compressed"),
        Color("#FF0000:#FF453A").frame(40, 60).frame(undefined, 30).border("#FF0000:#FF453A", 1),
      ]),

      VStack(undefined, undefined, [
        Text("Fixed"),
        Color("#00FF00:#30D158").frame(40, 60).fixedSize(false, true).border("#00FF00:#30D158", 1),
      ]),
    ]),
  };
}
