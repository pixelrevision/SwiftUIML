/**
 * DisclosureGroup view test definitions
 * Must match Swift DisclosureGroupTests.swift
 */
import {
  Node,
  Form,
  Section,
  DisclosureGroup,
  Text,
  Toggle,
  Slider,
  Picker,
  Stepper,
} from "../../../src/index";

export function generateDisclosureGroupTests(): Record<string, Node> {
  return {
    "view.disclosure-group.configurations": Form([
      Section([
        // Basic DisclosureGroup (collapsed by default)
        DisclosureGroup("Basic Details", [
          Text("This is basic content"),
          Text("It can contain multiple items"),
        ]),

        // DisclosureGroup expanded by default
        DisclosureGroup(
          "Settings",
          [Toggle("Dark Mode", true), Toggle("Notifications"), Slider(0.7)],
          true,
        ),

        // Nested DisclosureGroups
        DisclosureGroup("Advanced Options", [
          DisclosureGroup("Network", [Text("WiFi: Connected"), Text("Cellular: Enabled")], true),
          DisclosureGroup("Privacy", [Text("Location Services: On"), Text("Analytics: Off")]),
        ]),

        // DisclosureGroup with event handler
        DisclosureGroup(
          "Preferences",
          [
            Picker(
              "Theme",
              [Text("Light").tag("light"), Text("Dark").tag("dark"), Text("Auto").tag("auto")],
              "light",
            ),
            Stepper("Font Size", 14.0, 10.0, 24.0, 2.0),
          ],
          false,
        ).onExpandedChange("preferencesExpanded"),
      ]),
    ]),
  };
}
