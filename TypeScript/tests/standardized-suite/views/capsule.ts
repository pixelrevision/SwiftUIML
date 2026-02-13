/**
 * Capsule view test definitions
 * Must match Swift CapsuleTests.swift
 */
import { Node, Capsule } from "../../../src/index";

export function generateCapsuleTests(): Record<string, Node> {
  return {
    "view.capsule.filled": Capsule().foregroundColor("#007AFF:#0A84FF"),

    "view.capsule.stroked": Capsule().stroke("#FF375F:#FF6482", 4),

    "view.capsule.conditional": Capsule().stroke("#FAD97D:#6E6BFF", 4),
  };
}
