/**
 * ControlGroup view test definitions
 * Must match Swift ControlGroupTests.swift
 */
import { Node, ControlGroup, Button } from "../../../src/index";

export function generateControlGroupTests(): Record<string, Node> {
  return {
    "view.control-group.basic": ControlGroup([
      Button("Bold", "bold"),
      Button("Italic", "italic"),
      Button("Underline", "underline"),
    ])
      .buttonStyle("bordered")
      .padding(20),
  };
}
