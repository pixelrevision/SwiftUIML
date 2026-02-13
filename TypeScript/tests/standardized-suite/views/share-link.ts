/**
 * ShareLink view test definitions
 * Must match Swift ShareLinkTests.swift
 */
import { Node, ShareLink, VStack } from "../../../src/index";

export function generateShareLinkTests(): Record<string, Node> {
  return {
    "view.share-link.basic": ShareLink("https://apple.com"),

    "view.share-link.with-title": ShareLink("Share this link", "https://apple.com"),

    "view.share-link.styled": VStack(15, "leading", [
      ShareLink("Default", "https://example.com"),

      ShareLink("Styled Link", "https://example.com").font("title3").foregroundColor("#007AFF"),

      ShareLink("Large", "https://example.com").font("title").bold(),
    ]).padding(20),
  };
}
