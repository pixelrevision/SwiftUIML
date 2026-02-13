/**
 * Color view test definitions
 * Must match Swift ColorTests.swift
 */
import { Node, Color, Text, Grid, GridRow } from "../../../src/index";

export function generateColorTests(): Record<string, Node> {
  return {
    "view.color.solid": Color("#007AFF"),

    "view.color.alpha": Color("#FF0000").opacity(0.5),

    "view.color.conditional": Color("#007AFF:#64D2FF"),

    "view.color.conditional-alpha": Color("#FF375F80:#FF669080"),

    "view.color.system-colors": (() => {
      const allColors = [
        // Basic Colors
        "red",
        "blue",
        "green",
        "orange",
        "yellow",
        "purple",
        "pink",
        "black",
        "white",
        "gray",
        "primary",
        "secondary",
        "clear",
        // Label Colors
        "label",
        "secondaryLabel",
        "tertiaryLabel",
        "quaternaryLabel",
        // Background Colors
        "systemBackground",
        "secondarySystemBackground",
        "tertiarySystemBackground",
        // Grouped Background Colors
        "systemGroupedBackground",
        "secondarySystemGroupedBackground",
        "tertiarySystemGroupedBackground",
        // Fill Colors
        "systemFill",
        "secondarySystemFill",
        "tertiarySystemFill",
        "quaternarySystemFill",
        // Separator Colors
        "separator",
        "opaqueSeparator",
        // Link Color
        "link",
        // System Colors
        "systemRed",
        "systemBlue",
        "systemGreen",
        "systemOrange",
        "systemYellow",
        "systemPink",
        "systemPurple",
        "systemTeal",
        "systemIndigo",
        "systemBrown",
        "systemMint",
        "systemCyan",
        // System Grays
        "systemGray",
        "systemGray2",
        "systemGray3",
        "systemGray4",
        "systemGray5",
        "systemGray6",
      ];

      // Create rows of 3 colors each
      const rows: Node[] = [];
      for (let i = 0; i < allColors.length; i += 3) {
        const rowColors = allColors.slice(i, i + 3);
        const rowChildren: Node[] = rowColors.map((colorName) =>
          Text(colorName)
            .font("caption2")
            .foregroundColor("label")
            .padding(8)
            .frame(undefined, undefined, Infinity, undefined, undefined, undefined, "leading")
            .background(Color(colorName)),
        );
        rows.push(GridRow(undefined, rowChildren));
      }

      return Grid(undefined, 2, 2, rows).padding(8);
    })(),
  };
}
