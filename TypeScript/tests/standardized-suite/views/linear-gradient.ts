/**
 * LinearGradient view test definitions
 * Must match Swift LinearGradientTests.swift
 */
import { Node, LinearGradient } from "../../../src/index";

export function generateLinearGradientTests(): Record<string, Node> {
  return {
    "view.lineargradient.basic": LinearGradient(["#FF0000", "#00FF00", "#0000FF", "#FF0000"]),

    "view.lineargradient.conditional": LinearGradient(["#FFFFFF:#000000", "#CCCCCC:#5C5B5B"]),

    "view.lineargradient.leading-trailing": LinearGradient(
      ["#FF0000", "#00FF00", "#0000FF", "#FF0000"],
      "leading",
      "trailing",
    ),

    "view.lineargradient.alpha": LinearGradient([
      "#FF000080",
      "#00FF0080",
      "#0000FF80",
      "#FF000080",
    ]),
  };
}
