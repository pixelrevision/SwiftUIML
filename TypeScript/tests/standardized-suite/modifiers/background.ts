/**
 * Background modifier test definitions
 * Must match Swift BackgroundTests.swift
 */
import { Node, Text, Color, LinearGradient, Circle } from "../../../src/index";

export function generateBackgroundTests(): Record<string, Node> {
  return {
    "modifier.background.color": Text("test").padding(12).background(Color("#007AFF:#0A84FF")),

    "modifier.background.gradient": Text("test")
      .padding(12)
      .background(LinearGradient(["#007AFF:#0A84FF", "#34C759:#30D158"], "top", "bottom")),

    "modifier.background.aligned": Text("test")
      .padding(12)
      .background(Circle().fill("#FF3B3033:#FF453A33").frame(40, 40), "topLeading"),
  };
}
