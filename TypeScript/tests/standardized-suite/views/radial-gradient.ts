/**
 * RadialGradient view test definitions
 * Must match Swift RadialGradientTests.swift
 */
import { Node, RadialGradient } from "../../../src/index";

export function generateRadialGradientTests(): Record<string, Node> {
  return {
    "view.radialgradient.basic": RadialGradient(["#FF0000", "#00FF00", "#0000FF", "#FF0000"]),

    "view.radialgradient.conditional": RadialGradient(["#FFFFFF:#000000", "#CCCCCC:#5C5B5B"]),

    "view.radialgradient.top-leading": RadialGradient(
      ["#FF0000", "#00FF00", "#0000FF", "#FF0000"],
      "topLeading",
    ),

    "view.radialgradient.bottom-trailing": RadialGradient(
      ["#FF0000", "#00FF00", "#0000FF", "#FF0000"],
      "bottomTrailing",
    ),

    "view.radialgradient.alpha": RadialGradient([
      "#FF000080",
      "#00FF0080",
      "#0000FF80",
      "#FF000080",
    ]),
  };
}
