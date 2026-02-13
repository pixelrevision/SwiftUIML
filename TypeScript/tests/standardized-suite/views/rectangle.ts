/**
 * Rectangle view test definitions
 * Must match Swift RectangleTests.swift
 */
import { Node, Rectangle, ZStack } from "../../../src/index";

export function generateRectangleTests(): Record<string, Node> {
  return {
    "view.rectangle.filled": Rectangle().foregroundColor("#007AFF:#0A84FF").padding(5),

    "view.rectangle.stroked": Rectangle().stroke("#FF375F:#FF6482", 4).padding(5),

    "view.rectangle.filled-and-stroked": ZStack("center", [
      Rectangle().foregroundColor("#34C75980:#30D15880").padding(5),
      Rectangle().stroke("#34C759:#30D158", 3).padding(5),
    ]),
  };
}
