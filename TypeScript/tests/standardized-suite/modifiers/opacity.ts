/**
 * Opacity modifier test definitions
 * Must match Swift OpacityTests.swift
 */
import { Node, Text, Color } from "../../../src/index";

export function generateOpacityTests(): Record<string, Node> {
  return {
    "modifier.opacity.full": Text("Opacity")
      .padding(8)
      .background(Color("#007AFF:#0A84FF"))
      .opacity(1.0),

    "modifier.opacity.half": Text("Opacity")
      .padding(8)
      .background(Color("#007AFF:#0A84FF"))
      .opacity(0.5),

    "modifier.opacity.low": Text("Opacity")
      .padding(8)
      .background(Color("#007AFF:#0A84FF"))
      .opacity(0.2),

    "modifier.opacity.zero": Text("Opacity")
      .padding(8)
      .background(Color("#007AFF:#0A84FF"))
      .opacity(0.0),
  };
}
