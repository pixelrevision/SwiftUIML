/**
 * TextEditor view test definitions
 * Must match Swift TextEditorTests.swift
 */
import { Node, TextEditor, Color } from "../../../src/index";

export function generateTextEditorTests(): Record<string, Node> {
  return {
    "view.text-editor.basic": TextEditor(
      "This is a multi-line text editor.\n\nYou can type multiple lines of text here.",
    )
      .frame(300, 150)
      .padding(10)
      .background(Color("#F5F5F5"))
      .cornerRadius(8)
      .padding(20),
  };
}
