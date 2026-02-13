/**
 * Underline modifier test definitions
 * Must match Swift UnderlineTests.swift
 */
import { Node, VStack, Text } from "../../../src/index";

export function generateUnderlineTests(): Record<string, Node> {
  return {
    "modifier.underline.basic": VStack(20, undefined, [
      Text("Simple underline").underline(),
      Text("No underline"),
    ]),

    "modifier.underline.with-color": VStack(20, undefined, [
      Text("Red underline").underline(true, "#FF0000:#FF453A"),
      Text("Blue underline").underline(true, "#0000FF:#0A84FF"),
      Text("Default underline").underline(),
    ]),

    "modifier.underline.active": VStack(20, undefined, [
      Text("Active underline").underline(true),
      Text("Inactive underline").underline(false),
    ]),
  };
}
