/**
 * ListRow modifier test definitions
 * Must match Swift ListRowTests.swift
 */
import { Node, List, Text, Color } from "../../../src/index";

export function generateListRowTests(): Record<string, Node> {
  return {
    "modifier.list-row.background": List([
      Text("Row 1").listRowBackground(Color("#FF3B30:#FF453A")),
      Text("Row 2").listRowBackground(Color("#34C759:#30D158")),
      Text("Row 3").listRowBackground(Color("#007AFF:#0A84FF")),
    ])
      .listStyle("insetGrouped")
      .frame(300, 250),

    "modifier.list-row.insets": List([
      Text("Default").listRowBackground(Color("#E5E5EA:#636366")),
      Text("Custom (40L, 20T/B)")
        .listRowBackground(Color("#D1D1D6:#48484A"))
        .listRowInsets(20, 40, 20, 40),
      Text("Zero").listRowBackground(Color("#AEAEB2:#3A3A3C")).listRowInsets(0, 0, 0, 0),
    ])
      .listStyle("insetGrouped")
      .frame(300, 250),

    "modifier.list-row.separator": List([
      Text("Automatic").listRowSeparator("automatic"),
      Text("Visible").listRowSeparator("visible"),
      Text("Hidden").listRowSeparator("hidden"),
      Text("Normal"),
    ])
      .listStyle("insetGrouped")
      .frame(300, 250),
  };
}
