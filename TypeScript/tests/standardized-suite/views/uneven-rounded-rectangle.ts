/**
 * UnevenRoundedRectangle view test definitions
 * Must match Swift UnevenRoundedRectangleTests.swift
 */
import { Node, UnevenRoundedRectangle } from "../../../src/index";

export function generateUnevenRoundedRectangleTests(): Record<string, Node> {
  return {
    "view.uneven-rounded-rectangle.filled": UnevenRoundedRectangle(30, 10, 30, 10).foregroundColor(
      "#007AFF",
    ),

    "view.uneven-rounded-rectangle.stroked": UnevenRoundedRectangle(30, 10, 30, 10).stroke(
      "#FF375F",
      3,
    ),

    "view.uneven-rounded-rectangle.all-corners": UnevenRoundedRectangle(
      20,
      20,
      20,
      20,
    ).foregroundColor("#34C759"),

    "view.uneven-rounded-rectangle.single-corner": UnevenRoundedRectangle(
      30,
      0,
      0,
      0,
    ).foregroundColor("#FF9500"),
  };
}
