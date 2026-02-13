/**
 * LazyVGrid view test definitions
 * Must match Swift LazyVGridTests.swift
 */
import { Node, ScrollView, LazyVGrid, RoundedRectangle, Color, Text } from "../../../src/index";

export function generateLazyVGridTests(): Record<string, Node> {
  return {
    "view.lazyvgrid.basic": ScrollView("vertical", [
      LazyVGrid(
        3,
        "center",
        10,
        Array.from({ length: 12 }, (_, i) =>
          RoundedRectangle(8)
            .fill(Color("#007AFF:#0A84FF"))
            .frame(undefined, 80)
            .overlay(Text(`Item ${i}`).foregroundColor("#FFFFFF:#000000").font(16, "semibold")),
        ),
      ).padding(16),
    ]),

    "view.lazyvgrid.alignment": ScrollView("vertical", [
      LazyVGrid(
        2,
        "leading",
        12,
        Array.from({ length: 6 }, (_, i) =>
          Text(`Item ${i}`).padding(12).background(Color("#FF9500:#FF9F0A")).cornerRadius(8),
        ),
      ).padding(16),
    ]),
  };
}
