/**
 * LazyHGrid view test definitions
 * Must match Swift LazyHGridTests.swift
 */
import { Node, ScrollView, LazyHGrid, RoundedRectangle, Color, Text } from "../../../src/index";

export function generateLazyHGridTests(): Record<string, Node> {
  return {
    "view.lazyhgrid.basic": ScrollView("horizontal", [
      LazyHGrid(
        2,
        "center",
        10,
        Array.from({ length: 12 }, (_, i) =>
          RoundedRectangle(8)
            .fill(Color("#34C759:#30D158"))
            .frame(120, 80)
            .overlay(Text(`Item ${i}`).foregroundColor("#FFFFFF:#000000").font(16, "semibold")),
        ),
      ).padding(16),
    ]),

    "view.lazyhgrid.alignment": ScrollView("horizontal", [
      LazyHGrid(
        3,
        "top",
        8,
        Array.from({ length: 9 }, (_, i) =>
          Text(`Item ${i}`).padding(12).background(Color("#FF9500:#FF9F0A")).cornerRadius(8),
        ),
      ).padding(16),
    ]),
  };
}
