/**
 * LabelsHidden modifier test definitions
 * Must match Swift LabelsHiddenTests.swift
 */
import { Node, VStack, ProgressView } from "../../../src/index";

export function generateLabelsHiddenTests(): Record<string, Node> {
  return {
    "modifier.labels-hidden.comparison": VStack(20, undefined, [
      ProgressView("A label").progressViewStyle("linear"),
      ProgressView("A label").progressViewStyle("linear").labelsHidden(),
    ]).padding(20),
  };
}
