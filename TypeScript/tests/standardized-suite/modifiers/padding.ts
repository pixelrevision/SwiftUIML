/**
 * Padding modifier test definitions
 * Must match Swift PaddingTests.swift
 */
import { Node, Text, Color } from "../../../src/index";

export function generatePaddingTests(): Record<string, Node> {
  return {
    "modifier.padding.uniform": Text("text").padding(16).background(Color("#007AFF:#0A84FF")),

    "modifier.padding.edge-specific": Text("text")
      .padding(20, 8, 4, 24)
      .background(Color("#34C759:#30D158")),

    "modifier.padding.none": Text("text").background(Color("#FF375F:#FF453A")),
  };
}
