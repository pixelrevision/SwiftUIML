/**
 * ProgressView view test definitions
 * Must match Swift ProgressViewTests.swift
 */
import { Node, ViewType, AttributeKey } from "../../../src/index";

// Helper to create ProgressView matching Swift's attribute order
function ProgressViewWithLabel(label: string, value: number, total: number): Node {
  return new Node(ViewType.progressView, [
    [AttributeKey.value, value],
    [AttributeKey.total, total],
    [AttributeKey.label, label],
  ]);
}

export function generateProgressViewTests(): Record<string, Node> {
  return {
    "view.progress-view.percentage-based": ProgressViewWithLabel("Progress", 0.65, 1.0).tint(
      "#FF375F",
    ),
  };
}
