/**
 * TabView view test definitions
 * Must match Swift TabViewTests.swift
 */
import { Node, TabView, VStack, Text } from "../../../src/index";

export function generateTabViewTests(): Record<string, Node> {
  return {
    "view.tab-view.basic": TabView([
      VStack(16, undefined, [Text("Tab 1 Contents")])
        .tabItem({ systemName: "house.fill", text: "Home" })
        .tag("home"),
      VStack(16, undefined, [Text("Tab 2 Contents")])
        .tabItem({ systemName: "magnifyingglass", text: "Search" })
        .tag("search"),
      VStack(16, undefined, [Text("Tab 3 Contents")])
        .tabItem({ systemName: "person.fill", text: "Profile" })
        .tag("profile"),
    ]).tint("red"),
  };
}
