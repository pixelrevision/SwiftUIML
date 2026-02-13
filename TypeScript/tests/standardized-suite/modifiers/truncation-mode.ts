/**
 * TruncationMode modifier test definitions
 * Must match Swift TruncationModeTests.swift
 */
import { Node, VStack, Text } from "../../../src/index";

export function generateTruncationModeTests(): Record<string, Node> {
  return {
    "modifier.truncation-mode.variations": VStack(20, undefined, [
      Text("This is a very long text that will be truncated at the tail")
        .font(18)
        .frame(200, undefined)
        .lineLimit(1)
        .truncationMode("tail")
        .border("red", 1),
      Text("This is a very long text that will be truncated in the middle")
        .font(18)
        .frame(200, undefined)
        .lineLimit(1)
        .truncationMode("middle")
        .border("blue", 1),
      Text("This is a very long text that will be truncated at the head")
        .font(18)
        .frame(200, undefined)
        .lineLimit(1)
        .truncationMode("head")
        .border("green", 1),
    ]),

    "modifier.truncation-mode.multiline": VStack(16, undefined, [
      Text(
        "This is a long text that spans multiple lines but will be truncated at the tail when it exceeds the line limit",
      )
        .font(16)
        .frame(180, undefined)
        .lineLimit(2)
        .truncationMode("tail")
        .border("purple", 1),
      Text(
        "This is a long text that spans multiple lines but will be truncated in the middle when it exceeds the line limit",
      )
        .font(16)
        .frame(180, undefined)
        .lineLimit(2)
        .truncationMode("middle")
        .border("orange", 1),
    ]),
  };
}
