/**
 * ToggleStyle modifier test definitions
 * Must match Swift ToggleStyleTests.swift
 */
import { Node, VStack, Toggle } from "../../../src/index";

export function generateToggleStyleTests(): Record<string, Node> {
  return {
    "modifier.toggle-style.variations": VStack(20, undefined, [
      Toggle("Automatic", true).toggleStyle("automatic"),
      Toggle("Switch", true).toggleStyle("switch"),
      Toggle("Button", false).toggleStyle("button"),
    ]).padding(20),
  };
}
