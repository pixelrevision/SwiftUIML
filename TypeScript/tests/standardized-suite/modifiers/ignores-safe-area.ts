/**
 * IgnoresSafeArea modifier test definitions
 * Must match Swift IgnoresSafeAreaTests.swift
 */
import { Node, ZStack, VStack, Color, Spacer } from "../../../src/index";

export function generateIgnoresSafeAreaTests(): Record<string, Node> {
  return {
    "modifier.ignores-safe-area.all": ZStack("top", [
      Color("#FF0000:#FF453A").ignoresSafeArea(),
      VStack(undefined, undefined, [Color("#0000FF:#0A84FF").frame(undefined, 50), Spacer()]),
    ]),

    "modifier.ignores-safe-area.top": ZStack("top", [
      Color("#FF0000:#FF453A").frame(undefined, 100).ignoresSafeArea("top"),
      VStack(undefined, undefined, [Color("#0000FF:#0A84FF").frame(undefined, 50), Spacer()]),
    ]),

    "modifier.ignores-safe-area.bottom": ZStack("bottom", [
      VStack(undefined, undefined, [Spacer(), Color("#0000FF:#0A84FF").frame(undefined, 50)]),
      VStack(undefined, undefined, [
        Spacer(),
        Color("#FF0000:#FF453A").frame(undefined, 100).ignoresSafeArea("bottom"),
      ]),
    ]),
  };
}
