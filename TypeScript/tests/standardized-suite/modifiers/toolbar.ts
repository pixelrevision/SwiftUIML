/**
 * Toolbar modifier test definitions
 * Must match Swift ToolbarTests.swift
 */
import {
  Node,
  NavigationStack,
  VStack,
  Text,
  SystemImage,
  ViewType,
  AttributeKey,
} from "../../../src/index";

export function generateToolbarTests(): Record<string, Node> {
  // Create button nodes with children manually since TypeScript Button doesn't support children
  const addButton = new Node(ViewType.button, [[AttributeKey.onTap, "add"]], [SystemImage("plus")]);

  const editButton = new Node(
    ViewType.button,
    [[AttributeKey.onTap, "edit"]],
    [SystemImage("pencil")],
  );

  return {
    "modifier.toolbar.with-buttons": NavigationStack([
      VStack(20, "center", [Text("Content with Toolbar").font(24)]).toolbar(addButton, editButton),
    ]),
  };
}
