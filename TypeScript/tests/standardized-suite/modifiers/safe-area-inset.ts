/**
 * SafeAreaInset modifier test definitions
 * Must match Swift SafeAreaInsetTests.swift
 */
import { Node, HStack, Color, Text } from "../../../src/index";

export function generateSafeAreaInsetTests(): Record<string, Node> {
  return {
    "modifier.safe-area-inset.top": Color("blue")
      .ignoresSafeArea()
      .safeAreaInset(
        "top",
        "center",
        undefined,
        HStack(undefined, undefined, [
          Text("Top Inset").foregroundColor("white").padding(10),
        ]).backgroundColor("red"),
      ),

    "modifier.safe-area-inset.bottom": Color("green")
      .ignoresSafeArea()
      .safeAreaInset(
        "bottom",
        "center",
        undefined,
        HStack(undefined, undefined, [
          Text("Bottom Inset").foregroundColor("white").padding(10),
        ]).backgroundColor("purple"),
      ),

    "modifier.safe-area-inset.multiple": Color("yellow")
      .ignoresSafeArea()
      .safeAreaInset(
        "top",
        "center",
        undefined,
        Text("Top").foregroundColor("white").padding(10).backgroundColor("red"),
      )
      .safeAreaInset(
        "bottom",
        "center",
        undefined,
        Text("Bottom").foregroundColor("white").padding(10).backgroundColor("blue"),
      ),
  };
}
