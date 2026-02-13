//
//  AccessibilityTests.swift
//  SwiftUIML
//
//  Accessibility modifier rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class AccessibilityTests: XCTestCase {
  @MainActor
  func testAccessibilityLabel() {
    testNode(TestCase.modifier.accessibility.label, size: CGSize(width: 200, height: 100)) {
      VStackNode(spacing: 12) {
        ImageNode(name: "star.fill", bundle: "swiftuiml.SwiftUIMLTests.resources")
          .accessibilityLabel("Favorite star")

        TextNode("Image with label")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityHint() {
    testNode(TestCase.modifier.accessibility.hint, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        ButtonNode("Save", onTap: "save")
          .accessibilityHint("Saves the current document")

        TextNode("Button with hint")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityValue() {
    testNode(TestCase.modifier.accessibility.value, size: CGSize(width: 200, height: 100)) {
      VStackNode(spacing: 12) {
        TextNode("50%")
          .accessibilityValue("50 percent")

        TextNode("Text with value")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityIdentifier() {
    testNode(TestCase.modifier.accessibility.identifier, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        ButtonNode("Submit", onTap: "submit")
          .accessibilityIdentifier("submitButton")

        TextNode("Button with identifier")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityHiddenTrue() {
    testNode(TestCase.modifier.accessibility.hiddenTrue, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        ImageNode(name: "decorative", bundle: "swiftuiml.SwiftUIMLTests.resources")
          .accessibilityHidden(true)

        TextNode("Image hidden from a11y")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityHiddenFalse() {
    testNode(TestCase.modifier.accessibility.hiddenFalse, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        TextNode("Visible")
          .accessibilityHidden(false)

        TextNode("Text visible in a11y")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityTraitsSingle() {
    testNode(TestCase.modifier.accessibility.traitsSingle, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        TextNode("Heading")
          .font(size: 20)
          .bold()
          .accessibilityTraits("isHeader")

        TextNode("Single trait (isHeader)")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityTraitsMultiple() {
    testNode(TestCase.modifier.accessibility.traitsMultiple, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        ButtonNode("Play", onTap: "play")
          .accessibilityTraits(["isButton", "startsMediaSession"])

        TextNode("Multiple traits")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityRemoveTraitsSingle() {
    testNode(TestCase.modifier.accessibility.removeTraitsSingle, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        TextNode("Not a button")
          .accessibilityRemoveTraits("isButton")

        TextNode("Single trait removed")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityRemoveTraitsMultiple() {
    testNode(TestCase.modifier.accessibility.removeTraitsMultiple, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        ImageNode(name: "photo", bundle: "swiftuiml.SwiftUIMLTests.resources")
          .accessibilityRemoveTraits(["isButton", "isHeader"])

        TextNode("Multiple traits removed")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilitySortPriority() {
    testNode(TestCase.modifier.accessibility.sortPriority, size: CGSize(width: 300, height: 100)) {
      HStackNode(spacing: 16) {
        VStackNode(spacing: 8) {
          TextNode("Low Priority")
            .accessibilitySortPriority(1)

          TextNode("Priority: 1")
            .font(size: 10)
        }

        VStackNode(spacing: 8) {
          TextNode("High Priority")
            .accessibilitySortPriority(100)

          TextNode("Priority: 100")
            .font(size: 10)
        }
      }
    }
  }

  @MainActor
  func testAccessibilityElementContain() {
    testNode(TestCase.modifier.accessibility.elementContain, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        VStackNode(spacing: 8) {
          TextNode("Title")
          TextNode("Subtitle")
        }
        .accessibilityElement(children: .contain)

        TextNode("Children: contain")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityElementIgnore() {
    testNode(TestCase.modifier.accessibility.elementIgnore, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        VStackNode(spacing: 8) {
          TextNode("Decorative")
        }
        .accessibilityElement(children: .ignore)

        TextNode("Children: ignore")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityElementCombine() {
    testNode(TestCase.modifier.accessibility.elementCombine, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        HStackNode(spacing: 8) {
          TextNode("First")
          TextNode("Second")
        }
        .accessibilityElement(children: .combine)

        TextNode("Children: combine")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityInputLabels() {
    testNode(TestCase.modifier.accessibility.inputLabels, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        ButtonNode("OK", onTap: "confirm")
          .accessibilityInputLabels(["Okay", "Accept", "Confirm"])

        TextNode("Button with input labels")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityAction() {
    testNode(TestCase.modifier.accessibility.action, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        TextNode("Refresh")
          .accessibilityAction(named: "Reload", message: "refresh")

        TextNode("Text with custom action")
          .font(size: 12)
      }
    }
  }

  @MainActor
  func testAccessibilityCombined() {
    testNode(TestCase.modifier.accessibility.combined, size: CGSize(width: 250, height: 100)) {
      VStackNode(spacing: 12) {
        TextNode("Important Item")
          .accessibilityLabel("Critical Item")
          .accessibilityHint("Requires immediate attention")
          .accessibilityTraits(["isButton", "isHeader"])
          .accessibilitySortPriority(10)
          .accessibilityInputLabels(["Essential", "Priority"])

        TextNode("Multiple modifiers")
          .font(size: 12)
      }
    }
  }
}
