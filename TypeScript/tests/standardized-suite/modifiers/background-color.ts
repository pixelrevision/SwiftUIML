/**
 * BackgroundColor modifier test definitions
 * Must match Swift BackgroundColorTests.swift
 */
import { Node, Text, VStack, ZStack, Color } from "../../../src/index";

export function generateBackgroundColorTests(): Record<string, Node> {
  return {
    "modifier.background-color.solid": Text("Hello")
      .padding(12)
      .backgroundColor("#007AFF:#0A84FF")
      .cornerRadius(8),

    "modifier.background-color.semi-transparent": ZStack(undefined, [
      Color("#FF3B30:#FF453A").frame(100, 100),
      Text("Semi").padding(12).backgroundColor("#00000080:#FFFFFF80").cornerRadius(8),
    ]),

    "modifier.background-color.multiple": VStack(8, undefined, [
      Text("Red").padding(8).backgroundColor("#FF3B30:#FF453A"),
      Text("Blue").padding(8).backgroundColor("#007AFF:#0A84FF"),
      Text("Green").padding(8).backgroundColor("#34C759:#30D158"),
    ]),
  };
}
