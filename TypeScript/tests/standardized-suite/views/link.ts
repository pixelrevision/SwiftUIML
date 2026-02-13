/**
 * Link view test definitions
 * Must match Swift LinkTests.swift
 */
import { Node, Link, HStack, ImageSystemName, Text, VStack } from "../../../src/index";

export function generateLinkTests(): Record<string, Node> {
  return {
    "view.link.basic": Link("Visit Apple", "https://apple.com"),

    "view.link.custom-label": Link("https://github.com", [
      HStack(8, undefined, [ImageSystemName("link"), Text("GitHub")]),
    ]),

    "view.link.styled": VStack(15, "leading", [
      Link("Default Link", "https://example.com"),

      Link("Styled Link", "https://example.com").font("title3").foregroundColor("#007AFF"),

      Link("Large Link", "https://example.com").font("title").bold(),
    ]).padding(20),

    "view.link.with-icon": Link("https://apple.com", [
      HStack(6, undefined, [
        Text("Apple"),
        ImageSystemName("arrow.up.right.square").font("caption"),
      ]),
    ]),
  };
}
