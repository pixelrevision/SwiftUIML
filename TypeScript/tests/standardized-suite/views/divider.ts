/**
 * Divider view test definitions
 * Must match Swift DividerTests.swift
 */
import { Node, VStack, Text, Divider, Color } from "../../../src/index";

export function generateDividerTests(): Record<string, Node> {
  return {
    "view.divider.basic": VStack(undefined, undefined, [Text("Top"), Divider(), Text("Bottom")])
      .padding(10)
      .background(Color("#FFFFFF:#1C1C1E")),
  };
}
