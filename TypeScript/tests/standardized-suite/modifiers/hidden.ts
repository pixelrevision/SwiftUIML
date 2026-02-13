/**
 * Hidden modifier test definitions
 * Must match Swift HiddenTests.swift
 */
import { Node, VStack, HStack, Text, Color, Circle, Divider } from "../../../src/index";

export function generateHiddenTests(): Record<string, Node> {
  return {
    "modifier.hidden.basic": VStack(16, undefined, [
      Text("First Item").font("title2").foregroundColor("#007AFF"),
      Text("Hidden Item").font("title2").foregroundColor("#FF3B30").hidden(),
      Text("Third Item").font("title2").foregroundColor("#34C759"),
    ]),

    "modifier.hidden.in-stack": HStack(16, undefined, [
      Color("#007AFF:#0A84FF").frame(60, 60).cornerRadius(8),
      Color("#FF3B30:#FF453A").frame(60, 60).cornerRadius(8).hidden(),
      Color("#34C759:#30D158").frame(60, 60).cornerRadius(8),
    ]),

    "modifier.hidden.conditional": VStack(16, undefined, [
      Text("All Items Visible").font("headline"),

      HStack(12, undefined, [
        Circle().fill("#FF9500").frame(40, 40),
        Circle().fill("#FF9500").frame(40, 40),
        Circle().fill("#FF9500").frame(40, 40),
      ]),

      Divider(),

      Text("Middle Hidden").font("headline"),

      HStack(12, undefined, [
        Circle().fill("#FF9500").frame(40, 40),
        Circle().fill("#FF9500").frame(40, 40).hidden(),
        Circle().fill("#FF9500").frame(40, 40),
      ]),
    ]),
  };
}
