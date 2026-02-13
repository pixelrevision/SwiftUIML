/**
 * ProgressViewStyle modifier test definitions
 * Must match Swift ProgressViewStyleTests.swift
 */
import { Node, VStack, ProgressView } from "../../../src/index";

export function generateProgressViewStyleTests(): Record<string, Node> {
  return {
    "modifier.progress-view-style.variations": VStack(20, undefined, [
      ProgressView().progressViewStyle("automatic"),
      ProgressView().progressViewStyle("linear"),
      ProgressView().progressViewStyle("circular"),
    ]).padding(20),
  };
}
