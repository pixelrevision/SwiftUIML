/**
 * Picker view test definitions
 * Must match Swift PickerTests.swift
 */
import { Node, Form, Section, Picker, Text } from "../../../src/index";

export function generatePickerTests(): Record<string, Node> {
  return {
    "view.picker.configurations": Form([
      Section([
        // In a Form, Picker labels are prominently displayed
        Picker("Fruit", [
          Text("Apple").tag("apple"),
          Text("Banana").tag("banana"),
          Text("Orange").tag("orange"),
        ]),

        Picker(
          "Color",
          [Text("Red").tag("red"), Text("Green").tag("green"), Text("Blue").tag("blue")],
          "red",
        ),

        Picker(
          "Size",
          [
            Text("Small").tag("small"),
            Text("Medium").tag("medium"),
            Text("Large").tag("large"),
            Text("Extra Large").tag("xlarge"),
          ],
          "medium",
        ),

        Picker(
          "Theme",
          [Text("Light").tag("light"), Text("Dark").tag("dark"), Text("Auto").tag("auto")],
          "light",
        ).onPickerChange("themeChanged"),
      ]),
    ]),
  };
}
