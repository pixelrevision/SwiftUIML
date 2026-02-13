/**
 * Tint modifier test definitions
 * Must match Swift TintTests.swift
 */
import { Node, VStack, HStack, Text, Button, ProgressView } from "../../../src/index";

export function generateTintTests(): Record<string, Node> {
  return {
    "modifier.tint.button": VStack(16, undefined, [
      Text("Bordered Buttons").font("headline"),
      HStack(12, undefined, [
        Button("Blue", "tap").buttonStyle("bordered").tint("#007AFF"),
        Button("Red", "tap").buttonStyle("bordered").tint("#FF3B30"),
        Button("Green", "tap").buttonStyle("bordered").tint("#34C759"),
      ]),
      Text("Prominent Buttons").font("headline"),
      HStack(12, undefined, [
        Button("Purple", "tap").buttonStyle("borderedProminent").tint("#5856D6"),
        Button("Orange", "tap").buttonStyle("borderedProminent").tint("#FF9500"),
        Button("Pink", "tap").buttonStyle("borderedProminent").tint("#FF2D55"),
      ]),
    ]),

    "modifier.tint.progress-view": VStack(20, undefined, [
      VStack(8, undefined, [ProgressView().tint("#007AFF"), Text("Blue Progress").font("caption")]),
      VStack(8, undefined, [ProgressView().tint("#FF3B30"), Text("Red Progress").font("caption")]),
      VStack(8, undefined, [
        ProgressView().tint("#34C759"),
        Text("Green Progress").font("caption"),
      ]),
    ]).frame(200, undefined),
  };
}
