/**
 * ScaleEffect modifier test definitions
 * Must match Swift ScaleEffectTests.swift
 */
import { Node, HStack, VStack, Color, Text } from "../../../src/index";

export function generateScaleEffectTests(): Record<string, Node> {
  return {
    "modifier.scale-effect.variations": HStack(24, undefined, [
      VStack(8, undefined, [
        Color("#007AFF:#0A84FF").frame(50, 50).scaleEffect(0.5).frame(60, 60),
        Text("0.5x").font(10),
      ]),
      VStack(8, undefined, [
        Color("#007AFF:#0A84FF").frame(50, 50).scaleEffect(1.0).frame(60, 60),
        Text("1.0x").font(10),
      ]),
      VStack(8, undefined, [
        Color("#007AFF:#0A84FF").frame(50, 50).scaleEffect(1.5).frame(80, 80),
        Text("1.5x").font(10),
      ]),
      VStack(8, undefined, [
        Color("#007AFF:#0A84FF").frame(50, 50).scaleEffect(2.0).frame(110, 110),
        Text("2.0x").font(10),
      ]),
    ]),

    "modifier.scale-effect.non-uniform": HStack(24, undefined, [
      VStack(8, undefined, [
        Color("#34C759:#30D158").frame(50, 50).frame(60, 60),
        Text("Original").font(10),
      ]),
      VStack(8, undefined, [
        Color("#34C759:#30D158").frame(50, 50).scaleEffect(2.0, 1.0).frame(110, 60),
        Text("Wide").font(10),
      ]),
      VStack(8, undefined, [
        Color("#34C759:#30D158").frame(50, 50).scaleEffect(1.0, 2.0).frame(60, 110),
        Text("Tall").font(10),
      ]),
    ]),
  };
}
