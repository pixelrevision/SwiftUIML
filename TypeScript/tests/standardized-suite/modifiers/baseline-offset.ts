/**
 * BaselineOffset modifier test definitions
 * Must match Swift BaselineOffsetTests.swift
 */
import { Node, VStack, HStack, Text } from "../../../src/index";

export function generateBaselineOffsetTests(): Record<string, Node> {
  return {
    "modifier.baseline-offset.different-values": VStack(20, undefined, [
      HStack(5, "bottom", [
        Text("Base").font(20),
        Text("+5").font(20).baselineOffset(5).foregroundColor("green"),
        Text("+10").font(20).baselineOffset(10).foregroundColor("green"),
        Text("+15").font(20).baselineOffset(15).foregroundColor("green"),
      ]),

      HStack(5, "top", [
        Text("Base").font(20),
        Text("-5").font(20).baselineOffset(-5).foregroundColor("red"),
        Text("-10").font(20).baselineOffset(-10).foregroundColor("red"),
        Text("-15").font(20).baselineOffset(-15).foregroundColor("red"),
      ]),
    ]),

    "modifier.baseline-offset.subscript-superscript": VStack(20, undefined, [
      HStack(2, "bottom", [
        Text("H").font(32),
        Text("2").font(20).baselineOffset(-8),
        Text("O").font(32),
      ]),

      HStack(2, "bottom", [
        Text("E").font(32),
        Text("=").font(32),
        Text("mc").font(32),
        Text("2").font(20).baselineOffset(8),
      ]),
    ]),
  };
}
