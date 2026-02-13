/**
 * Circle view test definitions
 * Must match Swift CircleTests.swift
 */
import { Node, Circle, ZStack } from "../../../src/index";

export function generateCircleTests(): Record<string, Node> {
  return {
    "view.circle.filled": Circle().foregroundColor("#007AFF:#0A84FF"),

    "view.circle.stroked": Circle().stroke("#FF375F:#FF6482", 4),

    "view.circle.filled-and-stroked": ZStack("center", [
      Circle().foregroundColor("#34C75980:#30D15880"),
      Circle().stroke("#34C759:#30D158", 3),
    ]),
  };
}
