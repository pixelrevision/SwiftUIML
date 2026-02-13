/**
 * Kerning modifier test definitions
 * Must match Swift KerningTests.swift
 */
import { Node, VStack, Text } from "../../../src/index";

export function generateKerningTests(): Record<string, Node> {
  return {
    "modifier.kerning.variations": VStack(20, undefined, [
      Text("Normal kerning").font(20),
      Text("Tight kerning").font(20).kerning(-2),
      Text("Loose kerning").font(20).kerning(5),
    ]),

    "modifier.kerning.different-values": VStack(16, undefined, [
      Text("Kerning -4").font(18).kerning(-4),
      Text("Kerning 0").font(18).kerning(0),
      Text("Kerning 3").font(18).kerning(3),
      Text("Kerning 10").font(18).kerning(10),
    ]),
  };
}
