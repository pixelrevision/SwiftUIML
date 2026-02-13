/**
 * Form view test definitions
 * Must match Swift FormTests.swift
 */
import { Node, Form, Section, Picker, Text, Toggle, TextField } from "../../../src/index";

export function generateFormTests(): Record<string, Node> {
  return {
    "view.form.mixed-controls": Form([
      Section([
        // Pickers in Form show labels prominently
        Picker(
          "Fruit",
          [Text("Apple").tag("apple"), Text("Banana").tag("banana"), Text("Orange").tag("orange")],
          "apple",
        ),
        Picker(
          "Color",
          [Text("Red").tag("red"), Text("Green").tag("green"), Text("Blue").tag("blue")],
          "red",
        ),
      ]),

      Section([Toggle("Dark Mode", true), Toggle("Notifications")]),

      Section([TextField("Username", "john_doe"), TextField("Email", "john@example.com")]),
    ]),
  };
}
