/**
 * ButtonStyle modifier test definitions
 * Must match Swift ButtonStyleTests.swift
 */
import { Node, VStack, Button } from "../../../src/index";

export function generateButtonStyleTests(): Record<string, Node> {
  return {
    "modifier.button-style.variations": VStack(20, undefined, [
      Button("Automatic Style", "test").buttonStyle("automatic"),
      Button("Plain Style", "test").buttonStyle("plain"),
      Button("Bordered Style", "test").buttonStyle("bordered"),
      Button("Bordered Prominent", "test").buttonStyle("borderedProminent"),
      Button("Borderless Style", "test").buttonStyle("borderless"),
    ]).padding(20),
  };
}
