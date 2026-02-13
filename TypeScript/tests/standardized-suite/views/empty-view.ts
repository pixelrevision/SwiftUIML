/**
 * EmptyView view test definitions
 * Must match Swift EmptyViewTests.swift
 */
import { Node, VStack, Text, EmptyView } from "../../../src/index";

export function generateEmptyViewTests(): Record<string, Node> {
  return {
    "view.empty-view.spacing": VStack(0, "leading", [
      Text("Section 1").font("headline"),
      EmptyView().frame(undefined, 20),
      Text("Content for section 1").font("body"),
      EmptyView().frame(undefined, 30),
      Text("Section 2").font("headline"),
      EmptyView().frame(undefined, 20),
      Text("Content for section 2").font("body"),
    ]).padding(20),
  };
}
