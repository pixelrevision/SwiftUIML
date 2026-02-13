/**
 * List view test definitions
 * Must match Swift ListTests.swift
 */
import { Node, List, Text } from "../../../src/index";

export function generateListTests(): Record<string, Node> {
  return {
    "view.list.basic": List(Array.from({ length: 3 }, (_, i) => Text(`Item ${i + 1}`))),
  };
}
