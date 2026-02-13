/**
 * Label view test definitions
 * Must match Swift LabelTests.swift
 */
import { Node, Label, List, VStack } from "../../../src/index";

export function generateLabelTests(): Record<string, Node> {
  return {
    "view.label.basic": Label("Home", "house"),

    "view.label.styled": VStack(12, "leading", [
      Label("Settings", "gear"),
      Label("Profile", "person.circle").font("title2").foregroundColor("#007AFF:#0A84FF"),
      Label("Favorites", "star.fill").font("title3").bold(),
    ]).padding(20),

    "view.label.in-list": List([
      Label("Home", "house"),
      Label("Search", "magnifyingglass"),
      Label("Favorites", "star"),
      Label("Settings", "gear"),
    ]),
  };
}
