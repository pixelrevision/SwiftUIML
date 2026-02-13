/**
 * Frame modifier test definitions
 * Must match Swift FrameTests.swift
 */
import { Node, Text, Color } from "../../../src/index";

export function generateFrameTests(): Record<string, Node> {
  return {
    "modifier.frame.fixed-width-height": Text("test")
      .frame(100, 50)
      .background(Color("#007AFF:#0A84FF")),

    "modifier.frame.width-only": Text("test")
      .frame(80, undefined)
      .background(Color("#34C759:#30D158")),

    "modifier.frame.height-only": Text("test")
      .frame(undefined, 60)
      .background(Color("#FF9500:#FF9F0A")),

    "modifier.frame.max-width-infinity": Text("test")
      .frame(undefined, undefined, Infinity, undefined, undefined, undefined)
      .background(Color("#FF3B30:#FF453A")),

    "modifier.frame.max-height-infinity": Text("test")
      .frame(undefined, undefined, undefined, undefined, undefined, Infinity)
      .background(Color("#5856D6:#5E5CE6")),

    "modifier.frame.multiple-modifiers": Color("#FF2D55:#FF375F")
      .frame(undefined, undefined, 100, undefined, undefined, undefined)
      .frame(undefined, 40),

    "modifier.frame.chained-constraints": Color("#5AC8FA:#64D2FF")
      .frame(80, undefined)
      .frame(undefined, undefined, undefined, 30, undefined, 50),
  };
}
