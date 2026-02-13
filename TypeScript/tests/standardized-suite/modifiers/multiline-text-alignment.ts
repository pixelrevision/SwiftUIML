/**
 * MultilineTextAlignment modifier test definitions
 * Must match Swift MultilineTextAlignmentTests.swift
 */
import { Node, Text } from "../../../src/index";

export function generateMultilineTextAlignmentTests(): Record<string, Node> {
  return {
    "modifier.multiline-text-alignment.leading": Text("Short\nMedium Line\nVery Long Line Here")
      .multilineTextAlignment("leading")
      .frame(180, undefined),

    "modifier.multiline-text-alignment.center": Text("Short\nMedium Line\nVery Long Line Here")
      .multilineTextAlignment("center")
      .frame(180, undefined),

    "modifier.multiline-text-alignment.trailing": Text("Short\nMedium Line\nVery Long Line Here")
      .multilineTextAlignment("trailing")
      .frame(180, undefined),
  };
}
