/**
 * RoundedRectangle view test definitions
 * Must match Swift RoundedRectangleTests.swift
 */
import { Node, RoundedRectangle } from "../../../src/index";

export function generateRoundedRectangleTests(): Record<string, Node> {
  return {
    "view.rounded-rectangle.filled": RoundedRectangle(12).foregroundColor("#007AFF:#0A84FF"),

    "view.rounded-rectangle.stroked": RoundedRectangle(8).stroke("#FF375F:#FF6482", 3),

    "view.rounded-rectangle.small-radius": RoundedRectangle(4).foregroundColor("#34C759:#30D158"),

    "view.rounded-rectangle.large-radius": RoundedRectangle(24).foregroundColor("#FF9500:#FF9F0A"),
  };
}
