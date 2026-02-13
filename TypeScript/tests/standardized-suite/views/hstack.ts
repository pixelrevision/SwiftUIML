/**
 * HStack view test definitions
 * Must match Swift HStackTests.swift
 */
import { Node, HStack, Color } from "../../../src/index";

export function generateHStackTests(): Record<string, Node> {
  return {
    "view.hstack.basic-spacing": HStack(10, undefined, [
      Color("#FF375F:#FF6482").frame(30, 30),
      Color("#34C759:#30D158").frame(30, 30),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.hstack.align-top": HStack(10, "top", [
      Color("#FF375F:#FF6482").frame(30, 20),
      Color("#34C759:#30D158").frame(30, 40),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.hstack.align-center": HStack(10, "center", [
      Color("#FF375F:#FF6482").frame(30, 20),
      Color("#34C759:#30D158").frame(30, 40),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.hstack.align-bottom": HStack(10, "bottom", [
      Color("#FF375F:#FF6482").frame(30, 20),
      Color("#34C759:#30D158").frame(30, 40),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),
  };
}
