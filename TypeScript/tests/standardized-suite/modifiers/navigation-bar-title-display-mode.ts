/**
 * navigationBarTitleDisplayMode modifier test definitions
 * Must match Swift NavigationBarTitleDisplayModeModifierTests.swift
 */
import { Node, NavigationStack, VStack, Text } from "../../../src/index";

export function generateNavigationBarTitleDisplayModeTests(): Record<string, Node> {
  return {
    "modifier.navigation-bar-title-display-mode.inline": NavigationStack([
      VStack(16, undefined, [
        Text("Content Area").font("body"),
        Text("Title shown inline").font("caption").foregroundColor("#8E8E93:#8E8E93"),
      ])
        .padding()
        .navigationBarTitleDisplayMode("inline"),
    ]).navigationTitle("Inline Title"),

    "modifier.navigation-bar-title-display-mode.large": NavigationStack([
      VStack(16, undefined, [
        Text("Content Area").font("body"),
        Text("Title shown large").font("caption").foregroundColor("#8E8E93:#8E8E93"),
      ])
        .padding()
        .navigationBarTitleDisplayMode("large"),
    ]).navigationTitle("Large Title"),

    "modifier.navigation-bar-title-display-mode.automatic": NavigationStack([
      VStack(16, undefined, [
        Text("Content Area").font("body"),
        Text("Title display is automatic").font("caption").foregroundColor("#8E8E93:#8E8E93"),
      ])
        .padding()
        .navigationBarTitleDisplayMode("automatic"),
    ]).navigationTitle("Automatic Title"),
  };
}
