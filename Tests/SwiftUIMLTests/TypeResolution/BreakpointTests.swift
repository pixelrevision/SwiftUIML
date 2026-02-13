import XCTest
@testable import SwiftUIML

class BreakpointTests: XCTestCase {
  func testNamedBreakpointXS() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "xs"))
    // xs should match all sizes (>= 0)
    XCTAssertTrue(pattern.matches(size: CGSize(width: 0, height: 0)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 320, height: 568)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 1920, height: 1080)))
  }
  
  func testNamedBreakpointSM() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "sm"))
    // sm = width >= 375
    XCTAssertFalse(pattern.matches(size: CGSize(width: 320, height: 568)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 375, height: 568)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 400, height: 600)))
  }
  
  func testNamedBreakpointMD() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "md"))
    
    // md = width >= 768
    XCTAssertFalse(pattern.matches(size: CGSize(width: 767, height: 1024)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 768, height: 1024)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 800, height: 600)))
  }
  
  func testNamedBreakpointLG() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "lg"))
    
    // lg = width >= 1024
    XCTAssertFalse(pattern.matches(size: CGSize(width: 1023, height: 1366)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 1024, height: 768)))
  }
  
  func testNamedBreakpointXL() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "xl"))
    
    // xl = width >= 1366
    XCTAssertFalse(pattern.matches(size: CGSize(width: 1365, height: 1024)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 1366, height: 768)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 1920, height: 1080)))
  }
  
  func testCustomWidthGreaterThanOrEqual() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "w>=800"))
    
    XCTAssertFalse(pattern.matches(size: CGSize(width: 799, height: 600)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 800, height: 600)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 1000, height: 600)))
  }
  
  func testCustomWidthGreaterThan() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "w>600"))
    
    XCTAssertFalse(pattern.matches(size: CGSize(width: 600, height: 400)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 601, height: 400)))
  }
  
  func testCustomWidthLessThanOrEqual() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "w<=768"))
    
    XCTAssertTrue(pattern.matches(size: CGSize(width: 768, height: 600)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 700, height: 600)))
    XCTAssertFalse(pattern.matches(size: CGSize(width: 769, height: 600)))
  }
  
  func testCustomWidthLessThan() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "w<600"))
    
    XCTAssertTrue(pattern.matches(size: CGSize(width: 599, height: 800)))
    XCTAssertFalse(pattern.matches(size: CGSize(width: 600, height: 800)))
  }
  
  func testCustomHeightGreaterThanOrEqual() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "h>=1024"))
    
    XCTAssertFalse(pattern.matches(size: CGSize(width: 768, height: 1023)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 768, height: 1024)))
    XCTAssertTrue(pattern.matches(size: CGSize(width: 768, height: 1366)))
  }
  
  func testCustomHeightLessThan() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "h<600"))
    
    XCTAssertTrue(pattern.matches(size: CGSize(width: 375, height: 599)))
    XCTAssertFalse(pattern.matches(size: CGSize(width: 375, height: 600)))
  }
  
  func testCombinedWidthAndHeight() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: "w>=768,h>=1024"))
    
    // Both conditions must match
    XCTAssertFalse(pattern.matches(size: CGSize(width: 767, height: 1024)))  // Width too small
    XCTAssertFalse(pattern.matches(size: CGSize(width: 768, height: 1023)))  // Height too small
    XCTAssertTrue(pattern.matches(size: CGSize(width: 768, height: 1024)))   // Both match
    XCTAssertTrue(pattern.matches(size: CGSize(width: 1024, height: 1366)))  // Both match
  }
  
  func testCombinedWithSpaces() throws {
    let pattern = try XCTUnwrap(BreakpointPattern(parsing: " w>=768 , h>=1024 "))
    
    XCTAssertTrue(pattern.matches(size: CGSize(width: 800, height: 1200)))
  }
  
  func testInvalidPattern() {
    XCTAssertNil(BreakpointPattern(parsing: "invalid"))
    XCTAssertNil(BreakpointPattern(parsing: "x>=800"))  // Invalid dimension
    XCTAssertNil(BreakpointPattern(parsing: "w>=abc"))  // Invalid number
    XCTAssertNil(BreakpointPattern(parsing: "w~800"))   // Invalid operator
  }
  
  func testEmptyPattern() {
    XCTAssertNil(BreakpointPattern(parsing: ""))
  }
  
  func testWhitespacePattern() {
    XCTAssertNil(BreakpointPattern(parsing: "   "))
  }

  func testResponsiveOrderPreserved() {
    // Test with multiple breakpoints to verify KeyValuePairs insertion order is maintained
    let node = TextNode("Test").responsive([
      .w(0): [.padding: .number(2)],
      .w(100): [.padding: .number(4)],
      .w(200): [.padding: .number(6)],
      .w(300): [.padding: .number(8)],
      .sm: [.font: "caption"],
      .md: [.font: "body"],
      .lg: [.font: "title"],
    ])

    guard let array = node.attributes[.responsive]?.array else {
      XCTFail("Expected responsive array")
      return
    }

    XCTAssertEqual(array.count, 7)

    // Verify order matches KeyValuePairs literal order
    let expectedPatterns = ["w>=0", "w>=100", "w>=200", "w>=300", "sm", "md", "lg"]

    for (index, expectedPattern) in expectedPatterns.enumerated() {
      guard let breakpointDict = array[index].dict else {
        XCTFail("Expected dict at index \(index)")
        continue
      }

      let actualPattern = breakpointDict[.init("pattern")]?.string
      XCTAssertEqual(
        actualPattern,
        expectedPattern,
        "Breakpoint at index \(index) should be '\(expectedPattern)' but got '\(actualPattern ?? "nil")'"
      )
    }
  }
}
