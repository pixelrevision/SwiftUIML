/**
 * Position modifier test definitions
 * Must match Swift PositionTests.swift
 */
import { Node, ZStack, Color } from "../../../src/index";

export function generatePositionTests(): Record<string, Node> {
  return {
    "modifier.position.center": ZStack("topLeading", [
      Color("#CCCCCC:#444444").frame(100, 100),
      Color("#FF0000:#FF453A").frame(20, 20).position(50, 50),
    ]),

    "modifier.position.top-left": ZStack("topLeading", [
      Color("#CCCCCC:#444444").frame(100, 100),
      Color("#0000FF:#0A84FF").frame(20, 20).position(10, 10),
    ]),

    "modifier.position.bottom-right": ZStack("topLeading", [
      Color("#CCCCCC:#444444").frame(100, 100),
      Color("#00FF00:#30D158").frame(20, 20).position(90, 90),
    ]),
  };
}
