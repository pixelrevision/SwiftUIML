/**
 * ListStyle modifier test definitions
 * Must match Swift ListStyleTests.swift
 */
import { Node, VStack, List, Text } from "../../../src/index";

export function generateListStyleTests(): Record<string, Node> {
  return {
    "modifier.list-style.variations": VStack(20, undefined, [
      List([Text("Item 1"), Text("Item 2"), Text("Item 3")]).listStyle("plain"),
      List([Text("Item 1"), Text("Item 2"), Text("Item 3")]).listStyle("insetGrouped"),
    ]).padding(20),
  };
}
