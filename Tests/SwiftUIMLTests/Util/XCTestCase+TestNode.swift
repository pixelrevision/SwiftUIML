//
//  SnapshotHelper.swift
//  SwiftUIML
//
//  ImageRenderer-based snapshot testing for StandardizedSuite
//

import XCTest
import SwiftUI
import UIKit
import SnapshotTesting
@testable import SwiftUIML
@testable import SwiftUIMLCore

// MARK: - Test Case Management

private let testLanguageEnvKey = "SWIFTUIML_TEST_LANGUAGE"

private var loadedTestCases: [String: Node]?

private func getTestCases() -> [String: Node] {
  if let cached = loadedTestCases {
    return cached
  }

  // Only load external test cases if language is explicitly set
  guard let language = ProcessInfo.processInfo.environment[testLanguageEnvKey] else {
    loadedTestCases = [:]
    return [:]
  }

  // Check for external test cases in the language-specific directory
  let testCasesDir = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()  // Remove XCTestCase+TestNode.swift
    .deletingLastPathComponent()  // Remove Util/
    .appendingPathComponent("ExternalTestCases")
    .appendingPathComponent(language)

  if FileManager.default.fileExists(atPath: testCasesDir.path) {
    do {
      let fileUrls = try FileManager.default.contentsOfDirectory(
        at: testCasesDir,
        includingPropertiesForKeys: nil,
        options: .skipsHiddenFiles
      )

      var cases: [String: Node] = [:]
      let decoder = JSONDecoder()

      for fileUrl in fileUrls where fileUrl.pathExtension == "json" {
        let data = try Data(contentsOf: fileUrl)
        let node = try decoder.decode(Node.self, from: data)
        let testId = fileUrl.deletingPathExtension().lastPathComponent
        cases[testId] = node
      }

      print("✅ Loaded \(cases.count) external test cases from ExternalTestCases/\(language)/")
      loadedTestCases = cases
      return cases
    }
    catch {
      print("❌ Failed to load test cases from ExternalTestCases/\(language)/: \(error)")
      XCTFail("Failed to load test cases from ExternalTestCases/\(language)/: \(error)")
      return [:]
    }
  }

  print("⚠️  No external test cases found at ExternalTestCases/\(language)/")
  return [:]
}

extension XCTestCase {
  /// Test a node with NodeBuilder closure as default
  @MainActor
  func testNode(
    _ testId: String,
    size: CGSize,
    horizontalSizeClass: UIUserInterfaceSizeClass? = nil,
    precision: Float = 0.98,
    perceptualPrecision: Float = 0.95,
    useHostingController: Bool = false,
    delay: TimeInterval = 0.1,
    file: StaticString = #file,
    line: UInt = #line,
    @NodeBuilder _ defaultNode: () -> [Node]
  ) {
    let testCases = getTestCases()

    // Always build the expected/default node
    let nodes = defaultNode()
    let expectedNode: Node
    if nodes.count == 1 {
      expectedNode = nodes[0]
    }
    else {
      // Wrap multiple nodes in a VStack
      expectedNode = Node(type: .vStack, children: nodes)
    }

    let nodeToTest: Node
    if let externalNode = testCases[testId] {
      let language = ProcessInfo.processInfo.environment[testLanguageEnvKey] ?? "unknown"

      // Validate external node matches expected structure
      if externalNode != expectedNode {
        var message = "External test case '\(testId)' does not match expected structure\n\n"
        message += "Expected:\n"
        if let expectedJSON = try? JSONEncoder().encode(expectedNode),
          let expectedString = String(data: expectedJSON, encoding: .utf8) {
          message += expectedString + "\n"
        }
        message += "\nActual (from ExternalTestCases/\(language)/\(testId).json):\n"
        if let actualJSON = try? JSONEncoder().encode(externalNode),
          let actualString = String(data: actualJSON, encoding: .utf8) {
          message += actualString
        }

        // Fail the test with the diff, but continue to run snapshot test
        XCTFail(message, file: file, line: line)
      }
      nodeToTest = externalNode
    }
    else {
      // If testing external language but file doesn't exist, fail the test
      if let language = ProcessInfo.processInfo.environment[testLanguageEnvKey] {
        XCTFail(
          "External test case '\(testId).json' not found in ExternalTestCases/\(language)/",
          file: file,
          line: line
        )
      }
      // Use default from test body
      nodeToTest = expectedNode
    }

    runSnapshot(
      NodeView(nodeToTest),
      size: size,
      horizontalSizeClass: horizontalSizeClass,
      name: testId,
      precision: precision,
      perceptualPrecision: perceptualPrecision,
      useHostingController: useHostingController,
      delay: delay,
      file: file,
      line: line
    )
  }
  /// Run snapshot test using ImageRenderer
  /// Falls back to UIHostingController for views with UIKit-backed controls
  @MainActor
  func runSnapshot<T: View>(
    _ view: T,
    size: CGSize,
    horizontalSizeClass: UIUserInterfaceSizeClass? = nil,
    name: String,
    precision: Float = 0.98,
    perceptualPrecision: Float = 0.95,
    useHostingController: Bool = false,
    delay: TimeInterval = 0.1,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    // Test both light and dark modes
    for style in [UIUserInterfaceStyle.light, .dark] {
      let colorScheme: ColorScheme = style == .dark ? .dark : .light

      // Convert UIKit types to SwiftUI types
      let swiftUIHorizontalSizeClass: UserInterfaceSizeClass? = {
        guard let uiClass = horizontalSizeClass else { return nil }
        return uiClass == .compact ? .compact : .regular
      }()

      // Apply environment and frame
      let styledView = view
        .frame(width: size.width, height: size.height)
        .ignoresSafeArea()
        .preferredColorScheme(colorScheme)
        .environment(\.colorScheme, colorScheme)
        .environment(\.horizontalSizeClass, swiftUIHorizontalSizeClass)

      let image: UIImage

      if useHostingController {
        // Use UIHostingController for UIKit-backed controls
        let hostingController = UIHostingController(rootView: styledView)
        hostingController.view.bounds = CGRect(origin: .zero, size: size)
        hostingController.overrideUserInterfaceStyle = style

        let window = UIWindow(frame: CGRect(origin: .zero, size: size))
        window.rootViewController = hostingController
        window.makeKeyAndVisible()

        hostingController.view.setNeedsLayout()
        hostingController.view.layoutIfNeeded()

        // Wait for view to commit to render server
        RunLoop.current.run(until: Date(timeIntervalSinceNow: delay))

        let renderer = UIGraphicsImageRenderer(size: size)
        let renderedImage = renderer.image { context in
          hostingController.view.layer.render(in: context.cgContext)
        }

        image = renderedImage
      }
      else {
        // Use ImageRenderer for pure SwiftUI views
        let renderer = ImageRenderer(content: styledView)
        renderer.scale = 3.0

        guard let renderedImage = renderer.uiImage else {
          XCTFail("Failed to render image", file: file, line: line)
          continue
        }

        image = renderedImage
      }

      // Build filename: widthxheight-colorScheme
      let filename = "\(Int(size.width))x\(Int(size.height))-\(style.stringValue)"

      // Assert snapshot
      let snapshotDir = snapshotDirectory(for: file)
      let failure = verifySnapshot(
        of: image,
        as: .image(precision: precision, perceptualPrecision: perceptualPrecision),
        named: filename,
        record: false,
        snapshotDirectory: snapshotDir,
        file: file,
        testName: name,
        line: line
      )
      if let message = failure {
        XCTFail(message, file: file, line: line)
      }
    }
  }

  private func snapshotDirectory(for file: StaticString) -> String {
    let fileUrl = URL(fileURLWithPath: "\(file)", isDirectory: false)
    let testsDir = fileUrl
      .deletingLastPathComponent()
      .deletingLastPathComponent()

    let testCaseName = fileUrl
      .deletingPathExtension()
      .lastPathComponent

    return testsDir
      .appendingPathComponent("_Snapshots")
      .appendingPathComponent(testCaseName)
      .path
  }
}

// MARK: - Helper Extensions

extension UIUserInterfaceStyle {
  var stringValue: String {
    switch self {
    case .dark: return "dark"
    case .light: return "light"
    default: return "light"
    }
  }
}
