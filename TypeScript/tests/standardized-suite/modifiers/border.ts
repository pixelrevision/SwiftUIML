/**
 * Border modifier test definitions
 * Must match Swift BorderTests.swift
 */
import { Node, Text } from "../../../src/index";

export function generateBorderTests(): Record<string, Node> {
  return {
    "modifier.border.thin": Text("Border").padding(8).border("#007AFF:#0A84FF", 1),

    "modifier.border.thick": Text("Border").padding(8).border("#34C759:#30D158", 4),

    "modifier.border.colored": Text("Border").padding(8).border("#FF3B30:#FF9500", 2),
  };
}
