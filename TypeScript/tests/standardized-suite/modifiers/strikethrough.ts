/**
 * Strikethrough modifier test definitions
 * Must match Swift StrikethroughTests.swift
 */
import { Node, VStack, Text } from "../../../src/index";

export function generateStrikethroughTests(): Record<string, Node> {
  return {
    "modifier.strikethrough.basic": VStack(20, undefined, [
      Text("Simple strikethrough").strikethrough(),
      Text("No strikethrough"),
    ]),

    "modifier.strikethrough.with-color": VStack(20, undefined, [
      Text("Red strikethrough").strikethrough(true, "#FF0000:#FF453A"),
      Text("Blue strikethrough").strikethrough(true, "#0000FF:#0A84FF"),
      Text("Default strikethrough").strikethrough(),
    ]),

    "modifier.strikethrough.active": VStack(20, undefined, [
      Text("Active strikethrough").strikethrough(true),
      Text("Inactive strikethrough").strikethrough(false),
    ]),
  };
}
