/**
 * ViewThatFits view test definitions
 * Must match Swift ViewThatFitsTests.swift
 */
import { Node, HStack, VStack, Text, AttributeKey, ViewType } from "../../../src/index";

// Helper to create ViewThatFits with axis
function ViewThatFitsWithAxis(axis: string, children: Node[]): Node {
  return new Node(ViewType.viewThatFits, [[AttributeKey.axis, axis]], children);
}

export function generateViewThatFitsTests(): Record<string, Node> {
  return {
    "view.view-that-fits.horizontal": HStack(5, undefined, [
      // Wide container - should show "Long"
      ViewThatFitsWithAxis("horizontal", [
        Text("Long").frame(150, undefined, undefined, undefined, undefined, undefined, undefined),
        Text("Medium").frame(100, undefined, undefined, undefined, undefined, undefined, undefined),
        Text("Short").frame(50, undefined, undefined, undefined, undefined, undefined, undefined),
      ])
        .frame(160, 40)
        .backgroundColor("#FF375F:#FF6482"),

      // Medium container - should show "Medium"
      ViewThatFitsWithAxis("horizontal", [
        Text("Long").frame(150, undefined, undefined, undefined, undefined, undefined, undefined),
        Text("Medium").frame(100, undefined, undefined, undefined, undefined, undefined, undefined),
        Text("Short").frame(50, undefined, undefined, undefined, undefined, undefined, undefined),
      ])
        .frame(110, 40)
        .backgroundColor("#34C759:#30D158"),

      // Narrow container - should show "Short"
      ViewThatFitsWithAxis("horizontal", [
        Text("Long").frame(150, undefined, undefined, undefined, undefined, undefined, undefined),
        Text("Medium").frame(100, undefined, undefined, undefined, undefined, undefined, undefined),
        Text("Short").frame(50, undefined, undefined, undefined, undefined, undefined, undefined),
      ])
        .frame(60, 40)
        .backgroundColor("#007AFF:#0A84FF"),
    ]),

    "view.view-that-fits.vertical": VStack(5, undefined, [
      // Tall container - should show "Tall"
      ViewThatFitsWithAxis("vertical", [
        Text("Tall").frame(undefined, undefined, undefined, 150, undefined, undefined, undefined),
        Text("Medium").frame(undefined, undefined, undefined, 100, undefined, undefined, undefined),
        Text("Short").frame(undefined, undefined, undefined, 50, undefined, undefined, undefined),
      ])
        .frame(100, 160)
        .backgroundColor("#FF375F:#FF6482"),

      // Medium container - should show "Medium"
      ViewThatFitsWithAxis("vertical", [
        Text("Tall").frame(undefined, undefined, undefined, 150, undefined, undefined, undefined),
        Text("Medium").frame(undefined, undefined, undefined, 100, undefined, undefined, undefined),
        Text("Short").frame(undefined, undefined, undefined, 50, undefined, undefined, undefined),
      ])
        .frame(100, 110)
        .backgroundColor("#34C759:#30D158"),

      // Short container - should show "Short"
      ViewThatFitsWithAxis("vertical", [
        Text("Tall").frame(undefined, undefined, undefined, 150, undefined, undefined, undefined),
        Text("Medium").frame(undefined, undefined, undefined, 100, undefined, undefined, undefined),
        Text("Short").frame(undefined, undefined, undefined, 50, undefined, undefined, undefined),
      ])
        .frame(100, 60)
        .backgroundColor("#007AFF:#0A84FF"),
    ]),
  };
}
