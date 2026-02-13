/**
 * navigationTitle modifier test definitions
 * Must match Swift NavigationTitleTests.swift
 */
import { Node, NavigationStack, VStack, Text } from "../../../src/index";

export function generateNavigationTitleTests(): Record<string, Node> {
  return {
    "modifier.navigation-title.string": NavigationStack([
      VStack(16, undefined, [
        Text("Main Content").font("title"),
        Text("This view has a navigation title").foregroundColor("#8E8E93:#8E8E93"),
      ]).padding(),
    ]).navigationTitle("Settings"),

    "modifier.navigation-title.long": NavigationStack([
      VStack(16, undefined, [Text("Content Area").font("body")]).padding(),
    ]).navigationTitle("This is a Very Long Navigation Title"),

    "modifier.navigation-title.empty": NavigationStack([
      VStack(16, undefined, [Text("Content with Empty Title").font("body")]).padding(),
    ]).navigationTitle(""),
  };
}
