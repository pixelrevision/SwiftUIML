import XCTest
@testable import SwiftUIMLCore

class MessageWrappingTests: XCTestCase {
  // MARK: - Wrapping raw dict messages

  func testWrapsRawDictMessage() {
    let payload: AttributeValue = [
      .custom("path"): "/test",
    ]

    let wrapped = wrapMessage(payload, addingToContext: [
      .nodeId: "node-123",
    ])

    XCTAssertNotNil(wrapped.dict)
    XCTAssertEqual(wrapped.dict?[.context]?.dict?[.nodeId]?.string, "node-123")

    let message = wrapped.dict?[.message]?.dict
    XCTAssertNotNil(message)
    XCTAssertEqual(message?[.custom("path")]?.string, "/test")
  }

  func testWrapsRawDictWithMultipleContextKeys() {
    let payload: AttributeValue = [
      .custom("action"): "tap",
    ]

    let wrapped = wrapMessage(payload, addingToContext: [
      .nodeId: "node-456",
      .presentedId: "sheet-789",
    ])

    let context = wrapped.dict?[.context]?.dict
    XCTAssertEqual(context?[.nodeId]?.string, "node-456")
    XCTAssertEqual(context?[.presentedId]?.string, "sheet-789")
  }

  // MARK: - Wrapping already-wrapped messages

  func testMergesContextForAlreadyWrappedMessage() {
    let payload: AttributeValue = [
      .context: [.nodeId: "node-123"],
      .message: [.custom("path"): "/test"],
    ]

    let wrapped = wrapMessage(payload, addingToContext: [
      .presentedId: "sheet-456",
    ])

    let context = wrapped.dict?[.context]?.dict
    XCTAssertEqual(context?[.nodeId]?.string, "node-123")
    XCTAssertEqual(context?[.presentedId]?.string, "sheet-456")

    let message = wrapped.dict?[.message]?.dict
    XCTAssertEqual(message?[.custom("path")]?.string, "/test")
  }

  func testDoesNotOverwriteExistingContextKeys() {
    let payload: AttributeValue = [
      .context: [.nodeId: "original-node"],
      .message: [.custom("action"): "tap"],
    ]

    let wrapped = wrapMessage(payload, addingToContext: [
      .nodeId: "new-node",  // Should not overwrite
      .presentedId: "sheet-123",
    ])

    let context = wrapped.dict?[.context]?.dict
    XCTAssertEqual(context?[.nodeId]?.string, "original-node")  // Original preserved
    XCTAssertEqual(context?[.presentedId]?.string, "sheet-123")
  }

  // MARK: - Wrapping non-dict payloads

  func testWrapsStringPayload() {
    let payload: AttributeValue = "simple-message"

    let wrapped = wrapMessage(payload, addingToContext: [
      .nodeId: "node-789",
    ])

    XCTAssertEqual(wrapped.dict?[.context]?.dict?[.nodeId]?.string, "node-789")
    XCTAssertEqual(wrapped.dict?[.message]?.string, "simple-message")
  }

  func testWrapsNumberPayload() {
    let payload: AttributeValue = .number(42)

    let wrapped = wrapMessage(payload, addingToContext: [
      .nodeId: "node-999",
    ])

    if case .number(let value) = wrapped.dict?[.message] {
      XCTAssertEqual(value, 42)
    }
    else {
      XCTFail("Expected number message")
    }
  }

  func testWrapsBoolPayload() {
    let payload: AttributeValue = .bool(true)

    let wrapped = wrapMessage(payload, addingToContext: [
      .nodeId: "node-111",
    ])

    if case .bool(let value) = wrapped.dict?[.message] {
      XCTAssertTrue(value)
    }
    else {
      XCTFail("Expected bool message")
    }
  }

  // MARK: - Edge cases

  func testWrapsEmptyDict() {
    let payload: AttributeValue = [:]

    let wrapped = wrapMessage(payload, addingToContext: [
      .nodeId: "node-empty",
    ])

    XCTAssertNotNil(wrapped.dict?[.message])
    XCTAssertEqual(wrapped.dict?[.context]?.dict?[.nodeId]?.string, "node-empty")
  }

  func testWrapsWithEmptyContext() {
    let payload: AttributeValue = [
      .custom("data"): "value",
    ]

    let wrapped = wrapMessage(payload, addingToContext: [:])

    // Should still wrap the message, just with no context
    XCTAssertNotNil(wrapped.dict?[.message])
    XCTAssertNil(wrapped.dict?[.context])
  }

  func testPreservesComplexMessageStructure() {
    let payload: AttributeValue = [
      .custom("user"): [
        .custom("id"): "123",
        .custom("name"): "Alice",
      ],
      .custom("items"): [
        .string("item1"),
        .string("item2"),
      ],
    ]

    let wrapped = wrapMessage(payload, addingToContext: [
      .nodeId: "node-complex",
    ])

    let message = wrapped.dict?[.message]?.dict
    XCTAssertEqual(message?[.custom("user")]?.dict?[.custom("id")]?.string, "123")
    XCTAssertEqual(message?[.custom("items")]?.array?.count, 2)
  }

  // MARK: - Integration test

  func testMultipleWrappingLayers() {
    // Simulate: Button -> NodeView -> SheetWrapper -> NodeView
    var payload: AttributeValue = [.custom("path"): "/test"]

    // First NodeView wraps it
    payload = wrapMessage(payload, addingToContext: [.nodeId: "button-id"])

    // SheetWrapper adds to context
    payload = wrapMessage(payload, addingToContext: [.presentedId: "sheet-id"])

    // Parent NodeView adds to context
    payload = wrapMessage(payload, addingToContext: [.nodeId: "page-id"])

    // Verify structure
    let context = payload.dict?[.context]?.dict
    XCTAssertEqual(context?[.nodeId]?.string, "button-id")  // First nodeId preserved
    XCTAssertEqual(context?[.presentedId]?.string, "sheet-id")

    let message = payload.dict?[.message]?.dict
    XCTAssertEqual(message?[.custom("path")]?.string, "/test")
  }
}
