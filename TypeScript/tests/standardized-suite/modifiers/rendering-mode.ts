/**
 * RenderingMode modifier test definitions
 * Must match Swift RenderingModeTests.swift
 */
import { Node, HStack, VStack, Image, Text } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

export function generateRenderingModeTests(): Record<string, Node> {
  return {
    "modifier.rendering-mode.original": HStack(32, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID)
          .resizable()
          .renderingMode("original")
          .frame(80, 80),
        Text("Original").font("caption"),
        Text("(Image Colors)").font("caption2"),
      ]),

      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID)
          .resizable()
          .renderingMode("template")
          .foregroundColor("#FF3B30")
          .frame(80, 80),
        Text("Template").font("caption"),
        Text("(Red Tint)").font("caption2"),
      ]),
    ]),
  };
}
