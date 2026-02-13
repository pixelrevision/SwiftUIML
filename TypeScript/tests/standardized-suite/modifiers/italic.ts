/**
 * Italic modifier test definitions
 * Must match Swift ItalicTests.swift
 */
import { Node, Text } from "../../../src/index";

export function generateItalicTests(): Record<string, Node> {
  return {
    "modifier.italic.text": Text("Italic").italic(),

    "modifier.italic.with-color": Text("Italic").italic().foregroundColor("#007AFF:#0A84FF"),
  };
}
