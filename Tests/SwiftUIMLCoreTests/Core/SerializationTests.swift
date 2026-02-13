import XCTest
@testable import SwiftUIMLCore

class SerializationTests: XCTestCase {
  func testBasicNodeEncoding() throws {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .sortedKeys
    let node = Node(
      type: .custom("host"),
      attributes: .init(dictionaryLiteral: (
        .id, "value.1"
      )),
      children: [
        Node(type: .custom("child"))
      ])
    let encoded = try encoder.encode(node)
    let string = try XCTUnwrap(String(data: encoded, encoding: .utf8))
    XCTAssertEqual(string, """
    {"attributes":[["id","value.1"]],"children":[{"attributes":[],"type":"child"}],"type":"host"}
    """.trimmingCharacters(in: .whitespacesAndNewlines))
  }
  
  func testAttributesEncodedAs2DArray() throws {
    let node = TextNode("Hello")
      .foregroundColor("#FF0000")
      .bold()

    let encoder = JSONEncoder()
    let encoded = try encoder.encode(node)
    let json = try XCTUnwrap(try JSONSerialization.jsonObject(with: encoded) as? [String: Any])
    let attributes = try XCTUnwrap(json["attributes"] as? [[Any]])

    XCTAssertEqual(attributes.count, 3)
    XCTAssertEqual(attributes[0][0] as? String, "text")
    XCTAssertEqual(attributes[0][1] as? String, "Hello")
    XCTAssertEqual(attributes[1][0] as? String, "foregroundColor")
    XCTAssertEqual(attributes[1][1] as? String, "#FF0000")
    XCTAssertEqual(attributes[2][0] as? String, "bold")
    XCTAssertEqual(attributes[2][1] as? Bool, true)
  }
  
  func testAttributeValueTypes() throws {
    var attributes = Node.Attributes()
    attributes[.text] = .string("Hello")
    attributes[.padding] = .number(10)
    attributes[.bold] = .bool(true)
    attributes[.colors] = .array([.string("red"), .string("blue")])
    attributes[.frame] = .dict([.width: .number(100), .height: .number(50)])
    
    let encoder = JSONEncoder()
    let encoded = try encoder.encode(attributes)
    
    let decoder = JSONDecoder()
    let decoded = try decoder.decode(Node.Attributes.self, from: encoded)
    
    XCTAssertEqual(decoded[.text]?.string, "Hello")
    XCTAssertEqual(decoded[.padding]?.float, 10)
    XCTAssertEqual(decoded[.bold]?.bool, true)
    XCTAssertEqual(decoded[.colors]?.array?.count, 2)
    XCTAssertEqual(decoded[.frame]?.dict?[.width]?.float, 100)
  }
  
  func testNestedNodeWithTypeDiscriminator() throws {
    let innerNode = TextNode("Inner")
    let outerNode = Node(
      type: .button,
      attributes: [.label: .node(innerNode)]
    )

    let encoder = JSONEncoder()
    let encoded = try encoder.encode(outerNode)
    let json = try XCTUnwrap(try JSONSerialization.jsonObject(with: encoded) as? [String: Any])
    let attributes = try XCTUnwrap(json["attributes"] as? [[Any]])

    let labelPairIndex = try XCTUnwrap(attributes.firstIndex { ($0[0] as? String) == "label" })
    let labelValue = try XCTUnwrap(attributes[labelPairIndex][1] as? [String: Any])

    XCTAssertEqual(labelValue["$type"] as? String, "node")
    XCTAssertNotNil(labelValue["value"])
  }
  
  func testNestedNodeRoundTrip() throws {
    let innerNode = TextNode("Inner Text")
    let outerNode = Node(
      type: .button,
      attributes: [
        .label: .node(innerNode),
        .onTap: .string("action"),
      ]
    )
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let encoded = try encoder.encode(outerNode)
    let decoded = try decoder.decode(Node.self, from: encoded)
    
    XCTAssertEqual(decoded.type, .button)
    XCTAssertEqual(decoded.attributes[.onTap]?.string, "action")
    
    let decodedLabel = decoded.attributes[.label]?.node
    XCTAssertNotNil(decodedLabel)
    XCTAssertEqual(decodedLabel?.type, .text)
    XCTAssertEqual(decodedLabel?.attributes[.text]?.string, "Inner Text")
  }
  
  func testArrayOfNodesInAttribute() throws {
    let nodes = [
      TextNode("First"),
      TextNode("Second"),
      TextNode("Third"),
    ]
    
    let container = Node(
      type: .custom("Container"),
      attributes: [
        .value: .array(nodes.map { .node($0) })
      ]
    )
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let encoded = try encoder.encode(container)
    let decoded = try decoder.decode(Node.self, from: encoded)
    
    let decodedArray = decoded.attributes[.value]?.array
    XCTAssertEqual(decodedArray?.count, 3)
    XCTAssertEqual(decodedArray?[0].node?.attributes[.text]?.string, "First")
    XCTAssertEqual(decodedArray?[1].node?.attributes[.text]?.string, "Second")
    XCTAssertEqual(decodedArray?[2].node?.attributes[.text]?.string, "Third")
  }
  
  func testNullAttributeValue() throws {
    let node = Node(
      type: .text,
      attributes: [
        .text: .string("Hello"),
        .value: .null,
      ]
    )
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let encoded = try encoder.encode(node)
    let decoded = try decoder.decode(Node.self, from: encoded)
    
    XCTAssertEqual(decoded.attributes[.text]?.string, "Hello")
    let valueAttr = try XCTUnwrap(decoded.attributes[.value])
    if case .null = valueAttr {
      XCTAssert(true)
    }
    else {
      XCTFail("Expected null value")
    }
  }
  
  func testComplexNestedStructure() throws {
    let node = VStackNode {
      TextNode("Title").bold()
      HStackNode {
        ImageNode(systemName: "star")
        TextNode("Rating")
      }
      ButtonNode("Tap Me", onTap: "submit")
    }
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let encoded = try encoder.encode(node)
    let decoded = try decoder.decode(Node.self, from: encoded)
    
    XCTAssertEqual(decoded.type, .vStack)
    XCTAssertEqual(decoded.children?.count, 3)
    XCTAssertEqual(decoded.children?[0].type, .text)
    XCTAssertEqual(decoded.children?[1].type, .hStack)
    XCTAssertEqual(decoded.children?[1].children?.count, 2)
    XCTAssertEqual(decoded.children?[2].type, .button)
  }
  
  func testAttributeOrderPreserved() throws {
    var attributes = Node.Attributes()
    attributes[.text] = .string("Hello")
    attributes[.foregroundColor] = .string("red")
    attributes[.backgroundColor] = .string("blue")
    attributes[.padding] = .number(10)

    let encoder = JSONEncoder()
    let encoded = try encoder.encode(attributes)
    let json = try XCTUnwrap(try JSONSerialization.jsonObject(with: encoded) as? [[Any]])

    XCTAssertEqual(json[0][0] as? String, "text")
    XCTAssertEqual(json[1][0] as? String, "foregroundColor")
    XCTAssertEqual(json[2][0] as? String, "backgroundColor")
    XCTAssertEqual(json[3][0] as? String, "padding")
  }
  
  func testLayoutEncoding() throws {
    let layout = Layout(
      styles: [
        "primary": [
          .foregroundColor: .string("blue"),
          .padding: .number(10),
        ],
      ],
      content: TextNode("Hello")
    )

    let encoder = JSONEncoder()
    let encoded = try encoder.encode(layout)
    let json = try XCTUnwrap(try JSONSerialization.jsonObject(with: encoded) as? [String: Any])

    XCTAssertNotNil(json["styles"])
    XCTAssertNotNil(json["content"])

    let styles = try XCTUnwrap(json["styles"] as? [String: Any])
    let primaryStyle = try XCTUnwrap(styles["primary"] as? [[Any]])
    XCTAssertEqual(primaryStyle[0][0] as? String, "foregroundColor")
    XCTAssertEqual(primaryStyle[0][1] as? String, "blue")
  }
  
  func testLayoutRoundTrip() throws {
    let layout = Layout(
      styles: [
        "base": [
          .backgroundColor: .string("white")
        ],
        "theme": [
          .inherit: .string("base"),
          .foregroundColor: .string("black"),
        ],
      ],
      content: VStackNode {
        TextNode("Title").style("theme")
        TextNode("Body")
      }
    )
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let encoded = try encoder.encode(layout)
    let decoded = try decoder.decode(Layout.self, from: encoded)
    
    XCTAssertEqual(decoded.styles.count, 2)
    XCTAssertNotNil(decoded.styles["base"])
    XCTAssertNotNil(decoded.styles["theme"])
    XCTAssertEqual(decoded.content.type, .vStack)
    XCTAssertEqual(decoded.content.children?.count, 2)
  }
  
  func testLayoutStylesEncodedAs2DArrays() throws {
    let layout = Layout(
      styles: [
        "primary": [
          .foregroundColor: .string("red"),
          .bold: .bool(true),
          .padding: .number(8),
        ],
      ],
      content: TextNode("Test")
    )

    let encoder = JSONEncoder()
    let encoded = try encoder.encode(layout)
    let json = try XCTUnwrap(try JSONSerialization.jsonObject(with: encoded) as? [String: Any])
    let styles = try XCTUnwrap(json["styles"] as? [String: Any])
    let primaryStyle = try XCTUnwrap(styles["primary"] as? [[Any]])

    XCTAssertEqual(primaryStyle.count, 3)
    XCTAssertEqual(primaryStyle[0][0] as? String, "foregroundColor")
    XCTAssertEqual(primaryStyle[0][1] as? String, "red")
    XCTAssertEqual(primaryStyle[1][0] as? String, "bold")
    XCTAssertEqual(primaryStyle[1][1] as? Bool, true)
    XCTAssertEqual(primaryStyle[2][0] as? String, "padding")
    XCTAssertEqual(primaryStyle[2][1] as? Double, 8)
  }
  
  func testLayoutWithEmptyStyles() throws {
    let layout = Layout(
      styles: [:],
      content: TextNode("Hello")
    )
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let encoded = try encoder.encode(layout)
    let decoded = try decoder.decode(Layout.self, from: encoded)
    
    XCTAssertEqual(decoded.styles.count, 0)
    XCTAssertEqual(decoded.content.type, .text)
    XCTAssertEqual(decoded.content.attributes[.text]?.string, "Hello")
  }
  
  func testLayoutWithComplexContent() throws {
    let layout = Layout(
      styles: [
        "card": [
          .backgroundColor: .string("white"),
          .cornerRadius: .number(12),
        ],
      ],
      content: VStackNode(spacing: 8) {
        TextNode("Header").bold()
        HStackNode {
          ImageNode(systemName: "star")
          TextNode("Content")
        }
        ButtonNode("Action", onTap: "submit")
      }.style("card")
    )

    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    let encoded = try encoder.encode(layout)
    let decoded = try decoder.decode(Layout.self, from: encoded)

    XCTAssertEqual(decoded.styles.count, 1)
    XCTAssertEqual(decoded.content.type, .vStack)
    XCTAssertEqual(decoded.content.children?.count, 3)
    XCTAssertEqual(decoded.content.attributes[.style]?.string, "card")
  }

  func testLenientParsingSingleElementArray() throws {
    // Test that [["key"]] is parsed as [["key", true]]
    let json = """
    {
      "type": "Text",
      "attributes": [
        ["text", "Hello"],
        ["bold"]
      ]
    }
    """
    let data = try XCTUnwrap(json.data(using: .utf8))
    let decoder = JSONDecoder()
    let node = try decoder.decode(Node.self, from: data)

    XCTAssertEqual(node.attributes[.text]?.string, "Hello")
    XCTAssertEqual(node.attributes[.bold]?.bool, true)
  }

  func testEmptyArraysThrowsError() throws {
    // Test that empty arrays [[]] throw a decoding error
    let json = """
    {
      "type": "Text",
      "attributes": [
        ["text", "Hello"],
        [],
        ["bold", true]
      ]
    }
    """
    let data = try XCTUnwrap(json.data(using: .utf8))
    let decoder = JSONDecoder()
    XCTAssertThrowsError(try decoder.decode(Node.self, from: data)) { error in
      // Verify it's a DecodingError with the expected message
      if let decodingError = error as? DecodingError,
        case let .dataCorrupted(context) = decodingError {
        XCTAssertEqual(context.debugDescription, "Cannot decode empty array as key-value pair")
      }
      else {
        XCTFail("Expected DecodingError.dataCorrupted, got \(error)")
      }
    }
  }

  func testLenientParsingNullValue() throws {
    // Test that [["key", null]] preserves null
    let json = """
    {
      "type": "Text",
      "attributes": [
        ["text", "Hello"],
        ["value", null]
      ]
    }
    """
    let data = try XCTUnwrap(json.data(using: .utf8))
    let decoder = JSONDecoder()
    let node = try decoder.decode(Node.self, from: data)

    XCTAssertEqual(node.attributes[.text]?.string, "Hello")
    let valueAttr = try XCTUnwrap(node.attributes[.value])
    if case .null = valueAttr {
      XCTAssert(true)
    }
    else {
      XCTFail("Expected null value")
    }
  }
}
