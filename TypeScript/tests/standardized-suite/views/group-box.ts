/**
 * GroupBox view test definitions
 * Must match Swift GroupBoxTests.swift
 */
import { Node, VStack, HStack, GroupBox, Text, ImageSystemName, Toggle } from "../../../src/index";

export function generateGroupBoxTests(): Record<string, Node> {
  return {
    "view.group-box.configurations": VStack(20, undefined, [
      // Basic GroupBox with string label
      GroupBox("User Information", [
        HStack(8, undefined, [
          Text("Name:").font("subheadline").foregroundColor("#666666:#999999"),
          Text("John Doe").font("body"),
        ]),
        HStack(8, undefined, [
          Text("Email:").font("subheadline").foregroundColor("#666666:#999999"),
          Text("john@example.com").font("body"),
        ]),
        HStack(8, undefined, [
          Text("Role:").font("subheadline").foregroundColor("#666666:#999999"),
          Text("Developer").font("body"),
        ]),
      ]),

      // GroupBox without label
      GroupBox([
        Text("This is a group box without a label").font("body"),
        Text("It still has the styled container")
          .font("caption")
          .foregroundColor("#999999:#666666"),
      ]),

      // GroupBox with custom label node
      GroupBox(
        {
          label: HStack(6, undefined, [
            ImageSystemName("star.fill").foregroundColor("#FFD700:#FFD700"),
            Text("Premium Features").font("headline").foregroundColor("#FFD700:#FFD700"),
          ]),
        },
        [
          VStack(4, "leading", [
            Text("• Unlimited storage").font("body"),
            Text("• Priority support").font("body"),
            Text("• Advanced analytics").font("body"),
          ]),
        ],
      ),

      // Nested GroupBox
      GroupBox("Settings", [
        VStack(12, undefined, [
          GroupBox("Display", [Toggle("Dark Mode", true), Toggle("Show Notifications")]),
          GroupBox("Privacy", [Toggle("Location Services", true), Toggle("Analytics")]),
        ]),
      ]),
    ]).padding(20),
  };
}
