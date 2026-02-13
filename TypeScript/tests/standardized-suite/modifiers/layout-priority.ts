/**
 * LayoutPriority modifier test definitions
 * Must match Swift LayoutPriorityTests.swift
 */
import { Node, HStack, VStack, Text } from "../../../src/index";

export function generateLayoutPriorityTests(): Record<string, Node> {
  return {
    "modifier.layout-priority.in-hstack": HStack(10, undefined, [
      Text("Low Priority (0)").font(16).padding(10).backgroundColor("red").layoutPriority(0),
      Text("High Priority (1)").font(16).padding(10).backgroundColor("green").layoutPriority(1),
      Text("Normal Priority").font(16).padding(10).backgroundColor("blue"),
    ]).frame(300, undefined),

    "modifier.layout-priority.comparison": VStack(20, undefined, [
      HStack(5, undefined, [
        Text("Equal").font(14).padding(8).backgroundColor("gray"),
        Text("Equal").font(14).padding(8).backgroundColor("gray"),
        Text("Equal").font(14).padding(8).backgroundColor("gray"),
      ]).frame(200, undefined),
      HStack(5, undefined, [
        Text("Low").font(14).padding(8).backgroundColor("red").layoutPriority(0),
        Text("High").font(14).padding(8).backgroundColor("green").layoutPriority(1),
        Text("Low").font(14).padding(8).backgroundColor("red").layoutPriority(0),
      ]).frame(200, undefined),
    ]),

    "modifier.layout-priority.text-truncation": HStack(10, undefined, [
      Text("This text has high priority and should not truncate")
        .font(16)
        .layoutPriority(1)
        .foregroundColor("green"),
      Text("This text has low priority and may truncate")
        .font(16)
        .layoutPriority(0)
        .foregroundColor("red"),
    ]).frame(300, undefined),
  };
}
