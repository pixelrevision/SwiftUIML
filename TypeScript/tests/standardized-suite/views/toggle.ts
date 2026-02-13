/**
 * Toggle view test definitions
 * Must match Swift ToggleTests.swift
 */
import { Node, VStack, Toggle } from "../../../src/index";

export function generateToggleTests(): Record<string, Node> {
  return {
    "view.toggle.configurations": VStack(20, "leading", [
      // Basic toggle (off)
      Toggle("Enable notifications"),

      // Toggle with initial on state
      Toggle("Dark mode", true),

      // Toggle with custom font
      Toggle("Wi-Fi").font("headline"),

      // Toggle with foreground color
      Toggle("Airplane mode").foregroundColor("#007AFF"),

      // Toggle with both on state and styling
      Toggle("Bluetooth", true).font("body").foregroundColor("#333333"),
    ]).padding(20),
  };
}
