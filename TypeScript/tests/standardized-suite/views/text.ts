/**
 * Text view test definitions
 * Must match Swift TextTests.swift
 */
import { Node, Text, TextMarkdown } from "../../../src/index";

export function generateTextTests(): Record<string, Node> {
  return {
    "view.text.basic": Text("hello"),

    "view.text.markdown": TextMarkdown("**Bold** and *Italic*"),

    // Use 3-argument form to match Swift's customFont(name:size:) signature
    // which produces {name, size} instead of {name, fixedSize}
    "view.text.custom-font": Text("Custom").customFont("Splash-Regular", 12, undefined),
  };
}
