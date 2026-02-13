/**
 * Bold modifier test definitions
 * Must match Swift BoldTests.swift
 */
import { Node, Text } from "../../../src/index";

export function generateBoldTests(): Record<string, Node> {
  return {
    "modifier.bold.text": Text("Bold").bold(),

    "modifier.bold.with-color": Text("Bold").bold().foregroundColor("#007AFF:#0A84FF"),
  };
}
