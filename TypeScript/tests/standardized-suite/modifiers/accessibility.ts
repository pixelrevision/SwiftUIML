/**
 * Accessibility modifier test definitions
 * Must match Swift AccessibilityTests.swift
 */
import { Node, VStack, HStack, Text, Button, Image, Circle } from "../../../src/index";
import { TEST_BUNDLE_ID } from "../constants";

export function generateAccessibilityTests(): Record<string, Node> {
  return {
    "modifier.accessibility.label": VStack(12, undefined, [
      Image("star.fill", TEST_BUNDLE_ID).accessibilityLabel("Favorite star"),
      Text("Image with label").font(12),
    ]),

    "modifier.accessibility.hint": VStack(12, undefined, [
      Button("Save", "save").accessibilityHint("Saves the current document"),
      Text("Button with hint").font(12),
    ]),

    "modifier.accessibility.value": VStack(12, undefined, [
      Text("50%").accessibilityValue("50 percent"),
      Text("Text with value").font(12),
    ]),

    "modifier.accessibility.identifier": VStack(12, undefined, [
      Button("Submit", "submit").accessibilityIdentifier("submitButton"),
      Text("Button with identifier").font(12),
    ]),

    "modifier.accessibility.hidden-true": VStack(12, undefined, [
      Image("decorative", TEST_BUNDLE_ID).accessibilityHidden(true),
      Text("Image hidden from a11y").font(12),
    ]),

    "modifier.accessibility.hidden-false": VStack(12, undefined, [
      Text("Visible").accessibilityHidden(false),
      Text("Text visible in a11y").font(12),
    ]),

    "modifier.accessibility.traits-single": VStack(12, undefined, [
      Text("Heading").font(20).bold().accessibilityTraits("isHeader"),
      Text("Single trait (isHeader)").font(12),
    ]),

    "modifier.accessibility.traits-multiple": VStack(12, undefined, [
      Button("Play", "play").accessibilityTraits(["isButton", "startsMediaSession"]),
      Text("Multiple traits").font(12),
    ]),

    "modifier.accessibility.remove-traits-single": VStack(12, undefined, [
      Text("Not a button").accessibilityRemoveTraits("isButton"),
      Text("Single trait removed").font(12),
    ]),

    "modifier.accessibility.remove-traits-multiple": VStack(12, undefined, [
      Image("photo", TEST_BUNDLE_ID).accessibilityRemoveTraits(["isButton", "isHeader"]),
      Text("Multiple traits removed").font(12),
    ]),

    "modifier.accessibility.sort-priority": HStack(16, undefined, [
      VStack(8, undefined, [
        Text("Low Priority").accessibilitySortPriority(1),
        Text("Priority: 1").font(10),
      ]),
      VStack(8, undefined, [
        Text("High Priority").accessibilitySortPriority(100),
        Text("Priority: 100").font(10),
      ]),
    ]),

    "modifier.accessibility.element-contain": VStack(12, undefined, [
      VStack(8, undefined, [Text("Title"), Text("Subtitle")]).accessibilityElement("contain"),
      Text("Children: contain").font(12),
    ]),

    "modifier.accessibility.element-ignore": VStack(12, undefined, [
      VStack(8, undefined, [Text("Decorative")]).accessibilityElement("ignore"),
      Text("Children: ignore").font(12),
    ]),

    "modifier.accessibility.element-combine": VStack(12, undefined, [
      HStack(8, undefined, [Text("First"), Text("Second")]).accessibilityElement("combine"),
      Text("Children: combine").font(12),
    ]),

    "modifier.accessibility.input-labels": VStack(12, undefined, [
      Button("OK", "confirm").accessibilityInputLabels(["Okay", "Accept", "Confirm"]),
      Text("Button with input labels").font(12),
    ]),

    "modifier.accessibility.action": VStack(12, undefined, [
      Text("Refresh").accessibilityAction("Reload", "refresh"),
      Text("Text with custom action").font(12),
    ]),

    "modifier.accessibility.combined": VStack(12, undefined, [
      Text("Important Item")
        .accessibilityLabel("Critical Item")
        .accessibilityHint("Requires immediate attention")
        .accessibilityTraits(["isButton", "isHeader"])
        .accessibilitySortPriority(10)
        .accessibilityInputLabels(["Essential", "Priority"]),
      Text("Multiple modifiers").font(12),
    ]),
  };
}
