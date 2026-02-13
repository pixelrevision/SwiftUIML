/**
 * Ellipse view test definitions
 * Must match Swift EllipseTests.swift
 */
import { Node, Ellipse, ZStack } from "../../../src/index";

export function generateEllipseTests(): Record<string, Node> {
  return {
    "view.ellipse.filled": Ellipse().foregroundColor("#007AFF:#0A84FF"),

    "view.ellipse.stroked": Ellipse().stroke("#FF375F:#FF6482", 4),

    "view.ellipse.filled-and-stroked": ZStack("center", [
      Ellipse().foregroundColor("#34C75980:#30D15880"),
      Ellipse().stroke("#34C759:#30D158", 3),
    ]),
  };
}
