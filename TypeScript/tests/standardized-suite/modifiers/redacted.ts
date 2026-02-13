/**
 * Redacted modifier test definitions
 * Must match Swift RedactedTests.swift
 */
import { Node, VStack, HStack, Text, Circle } from "../../../src/index";

export function generateRedactedTests(): Record<string, Node> {
  return {
    "modifier.redacted.placeholder": VStack(20, undefined, [
      Text("Normal Text").font("title"),
      Text("Loading Content...").font("title").redacted("placeholder"),
      HStack(10, undefined, [
        Circle().fill("#3498DB:#0A84FF").frame(50, 50).redacted("placeholder"),
        VStack(undefined, "leading", [
          Text("User Name").font("headline"),
          Text("user@example.com").font("caption"),
        ]).redacted("placeholder"),
      ]),
    ]).padding(),
  };
}
