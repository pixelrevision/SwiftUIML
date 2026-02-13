/**
 * ForegroundColor modifier test definitions
 * Must match Swift ForegroundColorTests.swift
 */
import { Node, Text } from "../../../src/index";

export function generateForegroundColorTests(): Record<string, Node> {
  return {
    "modifier.foreground-color.conditional": Text("hello").foregroundColor("#FF0000:#0000FF"),

    "modifier.foreground-color.named": Text("hello").foregroundColor("orange"),
  };
}
