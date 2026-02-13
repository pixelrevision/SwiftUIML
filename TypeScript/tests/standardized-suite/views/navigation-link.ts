/**
 * NavigationLink view test definitions
 * Must match Swift NavigationLinkTests.swift
 */
import { Node, NavigationStack, VStack, NavigationLink } from "../../../src/index";

export function generateNavigationLinkTests(): Record<string, Node> {
  return {
    "view.navigation-link.basic": NavigationStack([
      VStack(16, undefined, [NavigationLink("profile", "Go to Profile").padding()]).padding(),
    ]),
  };
}
