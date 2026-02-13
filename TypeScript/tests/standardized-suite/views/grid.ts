/**
 * Grid view test definitions
 * Must match Swift GridTests.swift
 */
import { Node, Grid, GridRow, Color } from "../../../src/index";

export function generateGridTests(): Record<string, Node> {
  return {
    "view.grid.basic": Grid("center", 2, 2, [
      GridRow("center", [
        Color("#FF0000:#FF3333"),
        Color("#00FF00:#33FF33"),
        Color("#0000FF:#3333FF"),
      ]),
      GridRow("center", [
        Color("#FFFF00:#FFFF33"),
        Color("#FF00FF:#FF33FF"),
        Color("#00FFFF:#33FFFF"),
      ]),
    ]),

    "view.grid.variable-columns": Grid("center", 2, 2, [
      GridRow("center", [
        Color("#FF0000:#FF3333"),
        Color("#00FF00:#33FF33"),
        Color("#0000FF:#3333FF"),
      ]),
      GridRow("center", [Color("#FFFF00:#FFFF33"), Color("#FF00FF:#FF33FF")]),
      GridRow("center", [Color("#FFFF00:#FFFF33")]),
    ]),

    "view.grid.cell-columns": Grid("center", 2, 2, [
      GridRow("center", [
        Color("#FF0000:#FF3333").frame(undefined, 30),
        Color("#00FF00:#33FF33").frame(undefined, 30),
        Color("#0000FF:#3333FF").frame(undefined, 30),
      ]),
      GridRow("center", [
        Color("#FFFF00:#FFFF33").frame(undefined, 30).gridCellColumns(2),
        Color("#FF00FF:#FF33FF").frame(undefined, 30),
      ]),
      GridRow("center", [Color("#00FFFF:#33FFFF").frame(undefined, 30).gridCellColumns(3)]),
    ]),
  };
}
