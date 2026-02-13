/**
 * Clipped modifier test definitions
 * Must match Swift ClippedTests.swift
 */
import { Node, Text, Color, ZStack, HStack, VStack, Circle } from "../../../src/index";

export function generateClippedTests(): Record<string, Node> {
  return {
    "modifier.clipped.basic": HStack(32, undefined, [
      VStack(8, undefined, [
        ZStack(undefined, [
          Color("#007AFF:#0A84FF").frame(100, 100),
          Text("Overflow Text That Is Very Long").font(20).foregroundColor("#FFFFFF"),
        ]).frame(80, 80),
        Text("Not Clipped").font("caption"),
      ]),

      VStack(8, undefined, [
        ZStack(undefined, [
          Color("#007AFF:#0A84FF").frame(100, 100),
          Text("Overflow Text That Is Very Long").font(20).foregroundColor("#FFFFFF"),
        ])
          .frame(80, 80)
          .clipped(),
        Text("Clipped").font("caption"),
      ]),
    ]),

    "modifier.clipped.rotated": HStack(32, undefined, [
      VStack(8, undefined, [
        Color("#FF3B30:#FF453A").frame(80, 80).rotationEffect(45).frame(60, 60),
        Text("Not Clipped").font("caption"),
      ]),

      VStack(8, undefined, [
        Color("#FF3B30:#FF453A").frame(80, 80).rotationEffect(45).frame(60, 60).clipped(),
        Text("Clipped").font("caption"),
      ]),
    ]),

    "modifier.clipped.scaled": HStack(32, undefined, [
      VStack(8, undefined, [
        Circle().fill("#34C759:#30D158").frame(100, 100).frame(60, 60),
        Text("Not Clipped").font("caption"),
      ]),

      VStack(8, undefined, [
        Circle().fill("#34C759:#30D158").frame(100, 100).frame(60, 60).clipped(),
        Text("Clipped").font("caption"),
      ]),
    ]),
  };
}
