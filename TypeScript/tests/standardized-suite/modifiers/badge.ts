/**
 * Badge modifier test definitions
 * Must match Swift BadgeTests.swift
 */
import { Node, List, Text } from "../../../src/index";

export function generateBadgeTests(): Record<string, Node> {
  return {
    "modifier.badge.string": List([
      Text("Inbox").badge("99+"),
      Text("Drafts").badge("New"),
      Text("Sent"),
      Text("Archive").badge("!"),
    ]).listStyle("insetGrouped"),

    "modifier.badge.integer": List([
      Text("Messages").badge(42),
      Text("Notifications").badge(3),
      Text("Updates").badge(0),
      Text("Settings"),
    ]).listStyle("insetGrouped"),

    "modifier.badge.mixed": List([
      Text("High Priority").badge("!"),
      Text("Inbox").badge(15),
      Text("Drafts").badge("Draft"),
      Text("Archive"),
    ]).listStyle("insetGrouped"),
  };
}
