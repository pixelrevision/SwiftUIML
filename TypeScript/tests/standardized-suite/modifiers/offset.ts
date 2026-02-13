/**
 * Offset modifier test definitions
 * Must match Swift OffsetTests.swift
 */
import { Node, ZStack, Color } from "../../../src/index";

export function generateOffsetTests(): Record<string, Node> {
  return {
    "modifier.offset.x": ZStack("topLeading", [
      Color("#CCCCCC:#444444").frame(50, 50),
      Color("#FF0000:#FF453A").frame(50, 50).offset(30, 0),
    ]),

    "modifier.offset.y": ZStack("topLeading", [
      Color("#CCCCCC:#444444").frame(50, 50),
      Color("#0000FF:#0A84FF").frame(50, 50).offset(0, 30),
    ]),

    "modifier.offset.xy": ZStack("topLeading", [
      Color("#CCCCCC:#444444").frame(50, 50),
      Color("#00FF00:#30D158").frame(50, 50).offset(25, 25),
    ]),
  };
}
