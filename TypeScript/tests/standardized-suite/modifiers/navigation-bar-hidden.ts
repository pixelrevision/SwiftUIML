/**
 * navigationBarHidden modifier test definitions
 * Must match Swift NavigationBarHiddenTests.swift
 */
import { Node, NavigationStack, VStack, Text } from "../../../src/index";

export function generateNavigationBarHiddenTests(): Record<string, Node> {
  return {
    "modifier.navigation-bar-hidden.true": NavigationStack([
      VStack(16, undefined, [
        Text("Full Screen Content").font("title"),
        Text("Navigation bar is hidden").font("caption").foregroundColor("#8E8E93:#8E8E93"),
      ])
        .padding()
        .navigationBarHidden(true),
    ]).navigationTitle("Hidden Nav Bar"),

    "modifier.navigation-bar-hidden.false": NavigationStack([
      VStack(16, undefined, [
        Text("Normal Content").font("title"),
        Text("Navigation bar is visible").font("caption").foregroundColor("#8E8E93:#8E8E93"),
      ])
        .padding()
        .navigationBarHidden(false),
    ]).navigationTitle("Visible Nav Bar"),
  };
}
