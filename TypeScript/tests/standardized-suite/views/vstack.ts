/**
 * VStack view test definitions
 * Must match Swift VStackTests.swift
 */
import { Node, VStack, Color } from "../../../src/index";

export function generateVStackTests(): Record<string, Node> {
  return {
    "view.vstack.basic-spacing": VStack(10, undefined, [
      Color("#FF375F:#FF6482").frame(30, 30),
      Color("#34C759:#30D158").frame(30, 30),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.vstack.align-leading": VStack(10, "leading", [
      Color("#FF375F:#FF6482").frame(20, 30),
      Color("#34C759:#30D158").frame(40, 30),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.vstack.align-center": VStack(10, "center", [
      Color("#FF375F:#FF6482").frame(20, 30),
      Color("#34C759:#30D158").frame(40, 30),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.vstack.align-trailing": VStack(10, "trailing", [
      Color("#FF375F:#FF6482").frame(20, 30),
      Color("#34C759:#30D158").frame(40, 30),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),
  };
}
