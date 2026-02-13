/**
 * TextField view test definitions
 * Must match Swift TextFieldTests.swift
 */
import { Node, VStack, TextField, Color } from "../../../src/index";

export function generateTextFieldTests(): Record<string, Node> {
  return {
    "view.text-field.configurations": VStack(20, "leading", [
      // Basic text field with placeholder
      TextField("Enter your name"),

      // Text field with initial value
      TextField("Email", "user@example.com"),

      // Text field with styling
      TextField("Search...").padding(8).background(Color("#F0F0F0")).cornerRadius(6),

      // Text field with border
      TextField("Username").padding(8).border("#007AFF", 1).cornerRadius(6),

      // Text field with custom font
      TextField("Password").font("body").foregroundColor("#333333"),
    ]).padding(20),
  };
}
