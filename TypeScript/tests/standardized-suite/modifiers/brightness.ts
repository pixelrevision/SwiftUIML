/**
 * Brightness modifier test definitions
 * Must match Swift BrightnessTests.swift
 */
import { Node, HStack, VStack, Color, Text, ImageSystemName } from "../../../src/index";

export function generateBrightnessTests(): Record<string, Node> {
  return {
    "modifier.brightness.variations": HStack(16, undefined, [
      VStack(8, undefined, [
        Color("#007AFF:#0A84FF").frame(60, 60),
        Text("-0.5").font(12),
      ]).brightness(-0.5),

      VStack(8, undefined, [
        Color("#007AFF:#0A84FF").frame(60, 60),
        Text("0.0").font(12),
      ]).brightness(0.0),

      VStack(8, undefined, [
        Color("#007AFF:#0A84FF").frame(60, 60),
        Text("0.5").font(12),
      ]).brightness(0.5),

      VStack(8, undefined, [
        Color("#007AFF:#0A84FF").frame(60, 60),
        Text("1.0").font(12),
      ]).brightness(1.0),
    ]),

    "modifier.brightness.on-image": HStack(16, undefined, [
      ImageSystemName("star.fill")
        .resizable()
        .foregroundColor("#FFD60A:#FFD60A")
        .frame(50, 50)
        .brightness(-0.3),

      ImageSystemName("star.fill").resizable().foregroundColor("#FFD60A:#FFD60A").frame(50, 50),

      ImageSystemName("star.fill")
        .resizable()
        .foregroundColor("#FFD60A:#FFD60A")
        .frame(50, 50)
        .brightness(0.3),
    ]),
  };
}
