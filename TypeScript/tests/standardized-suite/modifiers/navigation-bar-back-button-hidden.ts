/**
 * navigationBarBackButtonHidden modifier test definitions
 * Must match Swift NavigationBarBackButtonHiddenTests.swift
 */
import { Node, NavigationStack, VStack, Text } from "../../../src/index";

export function generateNavigationBarBackButtonHiddenTests(): Record<string, Node> {
  return {
    "modifier.navigation-bar-back-button-hidden.true": NavigationStack([
      VStack(16, undefined, [Text("Home Screen").font("body")])
        .padding()
        .navigationDestination(
          "detail",
          VStack(16, undefined, [
            Text("Detail View").font("title"),
            Text("Back button is hidden").font("caption").foregroundColor("#8E8E93:#8E8E93"),
          ])
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Details"),
          undefined,
          true,
        ),
    ]).navigationTitle("Home"),

    "modifier.navigation-bar-back-button-hidden.false": NavigationStack([
      VStack(16, undefined, [Text("Home Screen").font("body")])
        .padding()
        .navigationDestination(
          "detail",
          VStack(16, undefined, [
            Text("Detail View").font("title"),
            Text("Back button is visible").font("caption").foregroundColor("#8E8E93:#8E8E93"),
          ])
            .padding()
            .navigationBarBackButtonHidden(false)
            .navigationTitle("Details"),
          undefined,
          true,
        ),
    ]).navigationTitle("Home"),
  };
}
