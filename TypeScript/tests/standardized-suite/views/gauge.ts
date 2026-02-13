/**
 * Gauge view test definitions
 * Must match Swift GaugeTests.swift
 */
import { Node, VStack, Text, AttributeKey, ViewType } from "../../../src/index";

// Helper to create Gauge with label node (matches Swift's GaugeNode(value:label:))
function GaugeWithLabelNode(
  label: Node,
  value: number,
  minimumValue: number = 0,
  maximumValue: number = 1,
): Node {
  return new Node(ViewType.gauge, [
    [AttributeKey.label, label],
    [AttributeKey.value, value],
    [AttributeKey.minimumValue, minimumValue],
    [AttributeKey.maximumValue, maximumValue],
  ]);
}

// Helper to create Gauge with string label (matches Swift's GaugeNode(_:value:))
function GaugeWithStringLabel(
  label: string,
  value: number,
  minimumValue: number = 0,
  maximumValue: number = 1,
): Node {
  return new Node(ViewType.gauge, [
    [AttributeKey.label, label],
    [AttributeKey.value, value],
    [AttributeKey.minimumValue, minimumValue],
    [AttributeKey.maximumValue, maximumValue],
  ]);
}

export function generateGaugeTests(): Record<string, Node> {
  return {
    "view.gauge.variations": VStack(20, undefined, [
      GaugeWithLabelNode(Text("Speed").foregroundColor("orange"), 0.7)
        .minimumValueLabel(Text("Min: 0").foregroundColor("red"))
        .maximumValueLabel(Text("Max: 1").foregroundColor("green"))
        .currentValueLabel(Text("Current: 0.7").foregroundColor("blue")),

      GaugeWithStringLabel("Temperature", 75, 0, 100),

      GaugeWithStringLabel("Battery", 0.45).tint("green"),

      GaugeWithStringLabel("Progress", 0.15),

      GaugeWithStringLabel("Completion", 0.95).tint("red"),
    ]).padding(20),
  };
}
