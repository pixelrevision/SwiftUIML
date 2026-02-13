/**
 * FontWeight modifier test definitions
 * Must match Swift FontWeightTests.swift
 */
import { Node, VStack, Text } from "../../../src/index";

export function generateFontWeightTests(): Record<string, Node> {
  return {
    "modifier.font-weight.light": Text("Light").fontWeight("light"),

    "modifier.font-weight.regular": Text("Regular").fontWeight("regular"),

    "modifier.font-weight.semibold": Text("Semibold").fontWeight("semibold"),

    "modifier.font-weight.bold": Text("Bold").fontWeight("bold"),

    "modifier.font-weight.heavy": Text("Heavy").fontWeight("heavy"),

    "modifier.font-weight.comparison": VStack(4, undefined, [
      Text("Light").fontWeight("light"),
      Text("Regular").fontWeight("regular"),
      Text("Semibold").fontWeight("semibold"),
      Text("Bold").fontWeight("bold"),
      Text("Heavy").fontWeight("heavy"),
    ]),
  };
}
