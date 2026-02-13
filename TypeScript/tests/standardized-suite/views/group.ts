/**
 * Group view test definitions
 * Must match Swift GroupTests.swift
 */
import { Node, VStack, Group, Text, List } from "../../../src/index";

export function generateGroupTests(): Record<string, Node> {
  return {
    "view.group.basic": VStack(undefined, undefined, [
      Group([Text("Item 1"), Text("Item 2"), Text("Item 3")])
        .padding(10)
        .backgroundColor("#EEEEEE:#3C3C3E"),
    ]),

    "view.group.in-list": List([
      Group([Text("Item 1"), Text("Item 2")]),
      Group([Text("Item 3"), Text("Item 4")]),
    ]),
  };
}
