/**
 * ButtonBorderShape modifier test definitions
 * Must match Swift ButtonBorderShapeTests.swift
 */
import { Node, VStack, Button } from "../../../src/index";

export function generateButtonBorderShapeTests(): Record<string, Node> {
  return {
    "modifier.button-border-shape.variations": VStack(20, undefined, [
      Button("Automatic", "test").buttonStyle("bordered").buttonBorderShape("automatic"),

      Button("Capsule", "test").buttonStyle("bordered").buttonBorderShape("capsule"),

      Button("Rounded Rectangle", "test")
        .buttonStyle("bordered")
        .buttonBorderShape("roundedRectangle"),
    ]).padding(20),
  };
}
