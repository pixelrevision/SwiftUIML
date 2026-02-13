/**
 * PickerStyle modifier test definitions
 * Must match Swift PickerStyleTests.swift
 */
import { Node, VStack, Picker, Text } from "../../../src/index";

export function generatePickerStyleTests(): Record<string, Node> {
  return {
    "modifier.picker-style.variations": VStack(20, undefined, [
      Picker(
        "Menu",
        [Text("Option A").tag("a"), Text("Option B").tag("b"), Text("Option C").tag("c")],
        "a",
      ).pickerStyle("menu"),
      Picker(
        "Segmented",
        [Text("Option A").tag("a"), Text("Option B").tag("b"), Text("Option C").tag("c")],
        "a",
      ).pickerStyle("segmented"),
      Picker(
        "Wheel",
        [Text("Option A").tag("a"), Text("Option B").tag("b"), Text("Option C").tag("c")],
        "b",
      )
        .pickerStyle("wheel")
        .frame(undefined, 150),
    ]).padding(20),
  };
}
