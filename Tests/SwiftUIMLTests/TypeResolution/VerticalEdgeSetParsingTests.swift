import XCTest
import SwiftUI
@testable import SwiftUIML

final class VerticalEdgeSetParsingTests: XCTestCase {
  func testVerticalEdgeSetTop() {
    let edges = VerticalEdge.Set("top")
    XCTAssertEqual(edges, .top)
  }

  func testVerticalEdgeSetBottom() {
    let edges = VerticalEdge.Set("bottom")
    XCTAssertEqual(edges, .bottom)
  }

  func testVerticalEdgeSetAll() {
    let edges = VerticalEdge.Set("all")
    XCTAssertEqual(edges, .all)
  }

  func testVerticalEdgeSetInvalid() {
    // Invalid values default to .all
    let edges = VerticalEdge.Set("invalid")
    XCTAssertEqual(edges, .all)
  }

  func testVerticalEdgeSetEmpty() {
    // Empty string defaults to .all
    let edges = VerticalEdge.Set("")
    XCTAssertEqual(edges, .all)
  }
}
