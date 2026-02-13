/**
 * AngularGradient view test definitions
 * Must match Swift AngularGradientTests.swift
 */
import { Node, AngularGradient } from "../../../src/index";

export function generateAngularGradientTests(): Record<string, Node> {
  return {
    "view.angulargradient.basic": AngularGradient(["#FF0000", "#00FF00", "#0000FF", "#FF0000"]),

    "view.angulargradient.conditional": AngularGradient(["#FFFFFF:#000000", "#CCCCCC:#5C5B5B"]),

    "view.angulargradient.top-leading": AngularGradient(
      ["#FF0000", "#00FF00", "#0000FF", "#FF0000"],
      "topLeading",
      0,
      90,
    ),

    "view.angulargradient.bottom-trailing": AngularGradient(
      ["#FF0000", "#00FF00", "#0000FF", "#FF0000"],
      "bottomTrailing",
    ),

    "view.angulargradient.alpha": AngularGradient([
      "#FF000080",
      "#00FF0080",
      "#0000FF80",
      "#FF000080",
    ]),
  };
}
