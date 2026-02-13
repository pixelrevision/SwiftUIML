/**
 * ControlSize modifier test definitions
 * Must match Swift ControlSizeTests.swift
 */
import { Node, VStack, Button } from "../../../src/index";

export function generateControlSizeTests(): Record<string, Node> {
  return {
    "modifier.control-size.variations": VStack(20, undefined, [
      Button("Mini", "test").buttonStyle("bordered").controlSize("mini"),

      Button("Small", "test").buttonStyle("bordered").controlSize("small"),

      Button("Regular", "test").buttonStyle("bordered").controlSize("regular"),

      Button("Large", "test").buttonStyle("bordered").controlSize("large"),

      Button("Extra Large", "test").buttonStyle("bordered").controlSize("extraLarge"),
    ]).padding(20),
  };
}
