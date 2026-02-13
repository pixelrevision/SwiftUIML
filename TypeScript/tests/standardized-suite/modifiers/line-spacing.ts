/**
 * LineSpacing modifier test definitions
 * Must match Swift LineSpacingTests.swift
 */
import { Node, VStack, Text } from "../../../src/index";

export function generateLineSpacingTests(): Record<string, Node> {
  return {
    "modifier.line-spacing.different-values": VStack(20, undefined, [
      Text("Spacing 0\nSecond line\nThird line").font(14).lineSpacing(0),
      Text("Spacing 5\nSecond line\nThird line").font(14).lineSpacing(5),
      Text("Spacing 15\nSecond line\nThird line").font(14).lineSpacing(15),
    ]),
  };
}
