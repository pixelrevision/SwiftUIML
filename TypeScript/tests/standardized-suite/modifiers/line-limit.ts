/**
 * LineLimit modifier test definitions
 * Must match Swift LineLimitTests.swift
 */
import { Node, Text } from "../../../src/index";

export function generateLineLimitTests(): Record<string, Node> {
  return {
    "modifier.line-limit.one": Text("This is a long text that should wrap to multiple lines")
      .lineLimit(1)
      .frame(120, undefined),

    "modifier.line-limit.two": Text("This is a long text that should wrap to multiple lines")
      .lineLimit(2)
      .frame(120, undefined),

    "modifier.line-limit.three": Text(
      "This is a long text that should wrap to multiple lines and show all content",
    )
      .lineLimit(3)
      .frame(120, undefined),

    "modifier.line-limit.none": Text(
      "This is a long text that should wrap to multiple lines and show all content without any truncation",
    ).frame(120, undefined),
  };
}
