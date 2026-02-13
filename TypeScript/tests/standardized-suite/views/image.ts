/**
 * Image view test definitions
 * Must match Swift ImageTests.swift
 */
import { Node, ImageSystemName, Image } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

export function generateImageTests(): Record<string, Node> {
  return {
    "view.image.system": ImageSystemName("star.fill"),

    "view.image.system-color": ImageSystemName("heart.fill").foregroundColor("#FF0000:#FF69B4"),

    "view.image.local": Image("generated-image", TEST_BUNDLE_ID)
      .resizable()
      .aspectRatio("1:1", "fit"),
  };
}
