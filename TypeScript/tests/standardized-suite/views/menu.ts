/**
 * Menu view test definitions
 * Must match Swift MenuTests.swift
 */
import { Node, VStack, Menu, Button } from "../../../src/index";

export function generateMenuTests(): Record<string, Node> {
  return {
    "view.menu.basic": VStack(16, undefined, [
      Menu("Actions", Button("Paste", "paste"), Button("Delete", "delete")),

      Menu(
        "Share",
        Button("Email", "email"),
        Button("Messages", "messages"),
        Button("AirDrop", "airdrop"),
      ),
    ]).padding(),
  };
}
