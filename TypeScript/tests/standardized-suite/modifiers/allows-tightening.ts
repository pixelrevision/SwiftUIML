/**
 * AllowsTightening modifier test definitions
 * Must match Swift AllowsTighteningTests.swift
 */
import { Node, VStack, Text } from "../../../src/index";

export function generateAllowsTighteningTests(): Record<string, Node> {
  return {
    "modifier.allows-tightening.basic": VStack(20, undefined, [
      Text("Text with tightening enabled")
        .font(18)
        .frame(200, undefined)
        .lineLimit(1)
        .allowsTightening(true)
        .border("blue", 1),

      Text("Text with tightening disabled")
        .font(18)
        .frame(200, undefined)
        .lineLimit(1)
        .allowsTightening(false)
        .border("red", 1),

      Text("Text with default behavior")
        .font(18)
        .frame(200, undefined)
        .lineLimit(1)
        .border("gray", 1),
    ]),
  };
}
