/**
 * ColorScheme modifier test definitions
 * Must match Swift ColorSchemeTests.swift
 */
import { Node, VStack, Text, Color } from "../../../src/index";

export function generateColorSchemeTests(): Record<string, Node> {
  return {
    "modifier.color-scheme.forced-light": VStack(undefined, undefined, [
      Text("Light").foregroundColor("#000000:#FFFFFF").background(Color("#FFFFFF:#000000")),
      Color("systemBackground").frame(60, 30),
    ]).colorScheme("light"),

    "modifier.color-scheme.forced-dark": VStack(undefined, undefined, [
      Text("Dark").foregroundColor("#000000:#FFFFFF").background(Color("#FFFFFF:#000000")),
      Color("systemBackground").frame(60, 30),
    ]).colorScheme("dark"),
  };
}
