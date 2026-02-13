/**
 * Font modifier test definitions
 * Must match Swift FontTests.swift
 */
import { Node, VStack, Text } from "../../../src/index";

export function generateFontTests(): Record<string, Node> {
  return {
    "modifier.font.styles": VStack(12, undefined, [
      Text("Large Title").font("largeTitle"),
      Text("Title").font("title"),
      Text("Title 2").font("title2"),
      Text("Title 3").font("title3"),
      Text("Headline").font("headline"),
      Text("Body").font("body"),
      Text("Callout").font("callout"),
      Text("Subheadline").font("subheadline"),
      Text("Footnote").font("footnote"),
      Text("Caption").font("caption"),
      Text("Caption 2").font("caption2"),
    ]),

    "modifier.font.sizes": VStack(8, undefined, [
      Text("Size 10").font(10),
      Text("Size 14").font(14),
      Text("Size 18").font(18),
      Text("Size 24").font(24),
      Text("Size 32").font(32),
      Text("Size 48").font(48),
    ]),

    "modifier.font.weights-with-style": VStack(8, undefined, [
      Text("Title - Ultralight").font("title").fontWeight("ultraLight"),
      Text("Title - Light").font("title").fontWeight("light"),
      Text("Title - Regular").font("title").fontWeight("regular"),
      Text("Title - Medium").font("title").fontWeight("medium"),
      Text("Title - Semibold").font("title").fontWeight("semibold"),
      Text("Title - Bold").font("title").fontWeight("bold"),
      Text("Title - Heavy").font("title").fontWeight("heavy"),
      Text("Title - Black").font("title").fontWeight("black"),
    ]),

    "modifier.font.designs": VStack(12, undefined, [
      Text("Default Design").font(22),
      Text("Rounded Design").font(22, undefined, "rounded"),
      Text("Monospaced Design").font(22, undefined, "monospaced"),
      Text("Serif Design").font(22, undefined, "serif"),
    ]),

    "modifier.font.custom-size": VStack(10, undefined, [
      Text("Custom 12pt Regular").font(12, "regular"),
      Text("Custom 16pt Medium").font(16, "medium"),
      Text("Custom 20pt Bold").font(20, "bold"),
      Text("Custom 28pt Black").font(28, "black"),
    ]),
  };
}
