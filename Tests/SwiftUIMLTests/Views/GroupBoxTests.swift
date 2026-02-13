//
//  GroupBoxTests.swift
//  SwiftUIML
//
//  GroupBox view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class GroupBoxTests: XCTestCase {
  @MainActor
  func testGroupBoxConfigurations() {
    testNode(TestCase.view.groupBox.configurations, size: CGSize(width: 350, height: 700), useHostingController: true) {
      VStackNode(spacing: 20) {
        // Basic GroupBox with string label
        GroupBoxNode("User Information") {
          HStackNode(spacing: 8) {
            TextNode("Name:")
              .font(.subheadline)
              .foregroundColor("#666666:#999999")
            TextNode("John Doe")
              .font(.body)
          }
          HStackNode(spacing: 8) {
            TextNode("Email:")
              .font(.subheadline)
              .foregroundColor("#666666:#999999")
            TextNode("john@example.com")
              .font(.body)
          }
          HStackNode(spacing: 8) {
            TextNode("Role:")
              .font(.subheadline)
              .foregroundColor("#666666:#999999")
            TextNode("Developer")
              .font(.body)
          }
        }

        // GroupBox without label
        GroupBoxNode {
          TextNode("This is a group box without a label")
            .font(.body)
          TextNode("It still has the styled container")
            .font(.caption)
            .foregroundColor("#999999:#666666")
        }

        // GroupBox with custom label node
        GroupBoxNode(
          label: HStackNode(spacing: 6) {
            ImageNode(systemName: "star.fill")
              .foregroundColor("#FFD700:#FFD700")
            TextNode("Premium Features")
              .font(.headline)
              .foregroundColor("#FFD700:#FFD700")
          }
        ) {
          VStackNode(spacing: 4, alignment: .leading) {
            TextNode("• Unlimited storage")
              .font(.body)
            TextNode("• Priority support")
              .font(.body)
            TextNode("• Advanced analytics")
              .font(.body)
          }
        }

        // Nested GroupBox
        GroupBoxNode("Settings") {
          VStackNode(spacing: 12) {
            GroupBoxNode("Display") {
              ToggleNode("Dark Mode", isOn: true)
              ToggleNode("Show Notifications", isOn: false)
            }

            GroupBoxNode("Privacy") {
              ToggleNode("Location Services", isOn: true)
              ToggleNode("Analytics", isOn: false)
            }
          }
        }
      }
      .padding(20)
    }
  }
}
