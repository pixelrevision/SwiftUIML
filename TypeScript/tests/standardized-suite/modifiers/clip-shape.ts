/**
 * ClipShape modifier test definitions
 * Must match Swift ClipShapeTests.swift
 */
import { Node, ImageSystemName, Color, Circle, Capsule, Text } from "../../../src/index";

export function generateClipShapeTests(): Record<string, Node> {
  return {
    "modifier.clip-shape.circle": ImageSystemName("star.fill")
      .resizable()
      .foregroundColor("#FFD60A:#FFD60A")
      .frame(80, 80)
      .clipShape(Circle().frame(50, 50)),

    "modifier.clip-shape.capsule": Color("#007AFF:#0A84FF")
      .frame(100, 60)
      .overlay(Text("Clipped").foregroundColor("#FFFFFF:#000000"))
      .clipShape(Capsule()),
  };
}
