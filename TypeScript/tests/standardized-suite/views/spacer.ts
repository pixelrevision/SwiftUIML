/**
 * Spacer view test definitions
 * Must match Swift SpacerTests.swift
 */
import { Node, HStack, VStack, Color, Spacer } from "../../../src/index";

export function generateSpacerTests(): Record<string, Node> {
  return {
    "view.spacer.horizontal": HStack(undefined, undefined, [
      Color("#00FF00:#FF0000"),
      Spacer(),
      Color("#00FF00:#FF0000"),
      Spacer(),
      Color("#00FF00:#FF0000"),
    ]),

    "view.spacer.vertical": VStack(undefined, undefined, [
      Color("#00FF00:#FF0000"),
      Spacer(),
      Color("#00FF00:#FF0000"),
      Spacer(),
      Color("#00FF00:#FF0000"),
    ]),
  };
}
