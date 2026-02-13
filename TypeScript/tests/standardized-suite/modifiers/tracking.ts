/**
 * Tracking modifier test definitions
 * Must match Swift TrackingTests.swift
 */
import { Node, VStack, Text } from "../../../src/index";

export function generateTrackingTests(): Record<string, Node> {
  return {
    "modifier.tracking.variations": VStack(20, undefined, [
      Text("Normal tracking").font(20),
      Text("Tight tracking").font(20).tracking(-2),
      Text("Loose tracking").font(20).tracking(5),
    ]),

    "modifier.tracking.different-values": VStack(16, undefined, [
      Text("Tracking -4").font(18).tracking(-4),
      Text("Tracking 0").font(18).tracking(0),
      Text("Tracking 3").font(18).tracking(3),
      Text("Tracking 10").font(18).tracking(10),
    ]),
  };
}
