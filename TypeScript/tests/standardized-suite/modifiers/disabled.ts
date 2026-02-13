/**
 * Disabled modifier test definitions
 * Must match Swift DisabledTests.swift
 */
import { Node, VStack, HStack, Button, Text, Divider } from "../../../src/index";

export function generateDisabledTests(): Record<string, Node> {
  return {
    "modifier.disabled.button": VStack(16, undefined, [
      Button("Enabled Button", "tap").buttonStyle("borderedProminent"),

      Button("Disabled Button", "tap").buttonStyle("borderedProminent").disabled(true),
    ]),

    "modifier.disabled.text": VStack(16, undefined, [
      Text("Enabled Text").font("title2").foregroundColor("#007AFF"),

      Text("Disabled Text").font("title2").foregroundColor("#007AFF").disabled(true),
    ]),

    "modifier.disabled.multiple-controls": VStack(16, undefined, [
      Text("Form Controls").font("headline"),

      HStack(12, undefined, [
        Button("Save", "save").buttonStyle("bordered"),
        Button("Cancel", "cancel").buttonStyle("bordered"),
      ]),

      Divider(),

      Text("Disabled State").font("headline"),

      HStack(12, undefined, [
        Button("Save", "save").buttonStyle("bordered").disabled(true),
        Button("Cancel", "cancel").buttonStyle("bordered").disabled(true),
      ]),
    ]).padding(20),

    "modifier.disabled.with-color": VStack(16, undefined, [
      VStack(8, undefined, [
        Text("Red Button - Enabled").font("caption"),
        Button("Delete", "delete").buttonStyle("borderedProminent").tint("#FF3B30"),
      ]),

      VStack(8, undefined, [
        Text("Red Button - Disabled").font("caption"),
        Button("Delete", "delete").buttonStyle("borderedProminent").tint("#FF3B30").disabled(true),
      ]),
    ]),
  };
}
