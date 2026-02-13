/**
 * Resizable modifier test definitions
 * Must match Swift ResizableTests.swift
 */
import { Node, HStack, VStack, Image, ImageSystemName, Text, Color } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

export function generateResizableTests(): Record<string, Node> {
  return {
    "modifier.resizable.basic": HStack(24, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).frame(100, 100),
        Text("Not Resizable").font("caption"),
      ]),

      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(100, 100),
        Text("Resizable").font("caption"),
      ]),
    ]),

    "modifier.resizable.aspect-fit": HStack(24, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID)
          .resizable()
          .aspectRatio(1.0, "fit")
          .frame(100, 120)
          .background(Color("#F0F0F0")),
        Text("Aspect Fit").font("caption"),
      ]),

      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID)
          .resizable()
          .aspectRatio(1.0, "fill")
          .frame(100, 120)
          .clipped()
          .background(Color("#F0F0F0")),
        Text("Aspect Fill").font("caption"),
      ]),
    ]),

    "modifier.resizable.symbol": HStack(24, undefined, [
      VStack(8, undefined, [
        ImageSystemName("star.fill").resizable().frame(60, 60).foregroundColor("#FF9500"),
        Text("60x60").font("caption"),
      ]),

      VStack(8, undefined, [
        ImageSystemName("heart.fill").resizable().frame(80, 80).foregroundColor("#FF3B30"),
        Text("80x80").font("caption"),
      ]),
    ]),

    "modifier.resizable.different-sizes": HStack(16, undefined, [
      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(50, 50),
        Text("50x50").font("caption"),
      ]),

      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(80, 80),
        Text("80x80").font("caption"),
      ]),

      VStack(8, undefined, [
        Image("generated-image", TEST_BUNDLE_ID).resizable().frame(120, 120),
        Text("120x120").font("caption"),
      ]),
    ]),
  };
}
