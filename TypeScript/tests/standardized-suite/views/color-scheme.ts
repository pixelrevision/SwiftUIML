/**
 * ColorScheme view test definitions
 * Must match Swift ColorSchemeViewTests.swift
 */
import { Node, ColorScheme, Text, HStack } from "../../../src/index";

export function generateColorSchemeTests(): Record<string, Node> {
  return {
    "view.color-scheme.basic-switch": ColorScheme([
      Text("Light Mode"),
      Text("Dark Mode").foregroundColor("#FFFFFF"),
    ]),

    "view.color-scheme.defaults-light": ColorScheme([
      Text("Light Mode").foregroundColor("#FF375F"),
    ]),

    "view.color-scheme.respects-override": HStack(undefined, undefined, [
      ColorScheme([
        Text("Light Mode").foregroundColor("#000000").backgroundColor("#FFFFFF"),
        Text("Dark Mode").foregroundColor("#FFFFFF"),
      ]),
    ]).colorScheme("light"),
  };
}
