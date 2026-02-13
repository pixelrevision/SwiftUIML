/**
 * Button view test definitions
 * Must match Swift ButtonTests.swift
 */
import { Node, Button, Color } from "../../../src/index";

export function generateButtonTests(): Record<string, Node> {
  return {
    "view.button.basic": Button("Tap Me", "tap"),

    "view.button.styled": Button("Styled", "tap")
      .foregroundColor("#007AFF")
      .padding(12)
      .background(Color("#007AFF").opacity(0.1))
      .cornerRadius(8),
  };
}
