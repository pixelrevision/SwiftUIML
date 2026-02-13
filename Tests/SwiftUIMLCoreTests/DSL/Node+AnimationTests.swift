import XCTest
@testable import SwiftUIMLCore

final class NodeAnimationTests: XCTestCase {
  // MARK: - Base Animations

  func testEaseInAnimation() {
    let animation = AnimationValue.easeIn(duration: 0.5)

    XCTAssertEqual(animation.type, .easeIn)
    XCTAssertEqual(animation.parameters[AttributeKey.duration.rawValue]?.float, 0.5)
    XCTAssertNil(animation.next)
  }

  func testEaseOutAnimation() {
    let animation = AnimationValue.easeOut(duration: 0.3)

    XCTAssertEqual(animation.type, .easeOut)
    XCTAssertEqual(animation.parameters[AttributeKey.duration.rawValue]?.float, 0.3)
  }

  func testEaseInOutAnimation() {
    let animation = AnimationValue.easeInOut(duration: 0.4)

    XCTAssertEqual(animation.type, .easeInOut)
    XCTAssertEqual(animation.parameters[AttributeKey.duration.rawValue]?.float, 0.4)
  }

  func testLinearAnimation() {
    let animation = AnimationValue.linear(duration: 0.2)

    XCTAssertEqual(animation.type, .linear)
    XCTAssertEqual(animation.parameters[AttributeKey.duration.rawValue]?.float, 0.2)
  }

  func testSpringAnimation() {
    let animation = AnimationValue.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0.1)

    XCTAssertEqual(animation.type, .spring)
    XCTAssertEqual(animation.parameters[AttributeKey.response.rawValue]?.float, 0.55)
    XCTAssertEqual(animation.parameters[AttributeKey.dampingFraction.rawValue]?.float, 0.825)
    XCTAssertEqual(animation.parameters[AttributeKey.blendDuration.rawValue]?.float, 0.1)
  }

  func testBouncyAnimation() {
    let animation = AnimationValue.bouncy(duration: 0.6)

    XCTAssertEqual(animation.type, .bouncy)
    XCTAssertEqual(animation.parameters[AttributeKey.duration.rawValue]?.float, 0.6)
  }

  func testSmoothAnimation() {
    let animation = AnimationValue.smooth(duration: 0.45)

    XCTAssertEqual(animation.type, .smooth)
    XCTAssertEqual(animation.parameters[AttributeKey.duration.rawValue]?.float, 0.45)
  }

  func testSnappyAnimation() {
    let animation = AnimationValue.snappy(duration: 0.25)

    XCTAssertEqual(animation.type, .snappy)
    XCTAssertEqual(animation.parameters[AttributeKey.duration.rawValue]?.float, 0.25)
  }

  // MARK: - Animation Modifiers

  func testDelayModifier() {
    let animation = AnimationValue.delay(0.1)

    XCTAssertEqual(animation.type, .delay)
    XCTAssertEqual(animation.parameters[AttributeKey.delay.rawValue]?.float, 0.1)
  }

  func testSpeedModifier() {
    let animation = AnimationValue.speed(2.0)

    XCTAssertEqual(animation.type, .speed)
    XCTAssertEqual(animation.parameters[AttributeKey.speed.rawValue]?.float, 2.0)
  }

  func testRepeatCountModifier() {
    let animation = AnimationValue.repeatCount(3, autoreverses: true)

    XCTAssertEqual(animation.type, .repeatCount)
    XCTAssertEqual(animation.parameters[AttributeKey.count.rawValue]?.int, 3)
    XCTAssertEqual(animation.parameters[AttributeKey.autoreverses.rawValue]?.bool, true)
  }

  func testRepeatForeverModifier() {
    let animation = AnimationValue.repeatForever(autoreverses: false)

    XCTAssertEqual(animation.type, .repeatForever)
    XCTAssertEqual(animation.parameters[AttributeKey.autoreverses.rawValue]?.bool, false)
  }

  // MARK: - Chaining

  func testChainWithNext() throws {
    let animation = AnimationValue.easeIn().delay(0.1)

    XCTAssertEqual(animation.type, .easeIn)
    let next = try XCTUnwrap(animation.next)
    XCTAssertEqual(next.type, .delay)
    XCTAssertEqual(next.parameters[AttributeKey.delay.rawValue]?.float, 0.1)
  }

  func testMultipleChains() throws {
    let animation = AnimationValue.easeOut(duration: 0.5)
      .delay(0.1)
      .speed(2.0)
      .repeatCount(3, autoreverses: true)

    XCTAssertEqual(animation.type, .easeOut)
    XCTAssertEqual(animation.parameters[AttributeKey.duration.rawValue]?.float, 0.5)

    // Check first next
    let delayNext = try XCTUnwrap(animation.next)
    XCTAssertEqual(delayNext.type, .delay)
    XCTAssertEqual(delayNext.parameters[AttributeKey.delay.rawValue]?.float, 0.1)

    // Check second next
    let speedNext = try XCTUnwrap(delayNext.next)
    XCTAssertEqual(speedNext.type, .speed)
    XCTAssertEqual(speedNext.parameters[AttributeKey.speed.rawValue]?.float, 2.0)

    // Check third next
    let repeatNext = try XCTUnwrap(speedNext.next)
    XCTAssertEqual(repeatNext.type, .repeatCount)
    XCTAssertEqual(repeatNext.parameters[AttributeKey.count.rawValue]?.int, 3)
    XCTAssertEqual(repeatNext.parameters[AttributeKey.autoreverses.rawValue]?.bool, true)
  }

  func testChainStartingWithModifier() {
    let animation = AnimationValue.delay(0.2).easeOut()

    XCTAssertEqual(animation.type, .delay)
    XCTAssertEqual(animation.parameters[AttributeKey.delay.rawValue]?.float, 0.2)
    XCTAssertEqual(animation.next?.type, .easeOut)
  }

  // MARK: - Node Modifier

  func testNodeAnimationModifier() throws {
    let node = TextNode("Hello")
      .foregroundColor("red")
      .animation(.easeIn(duration: 0.5), attribute: .foregroundColor)

    let animationDict = try XCTUnwrap(node.attributes[.animation]?.dict)
    XCTAssertEqual(animationDict[.attribute]?.string, "foregroundColor")
    XCTAssertEqual(animationDict[.type]?.string, AnimationType.easeIn.rawValue)
    XCTAssertEqual(animationDict[.duration]?.float, 0.5)
  }

  func testNodeAnimationModifierWithString() {
    let node = TextNode("Hello")
      .animation(.easeOut(), attribute: "opacity")

    let animationDict = node.attributes[.animation]?.dict
    XCTAssertEqual(animationDict?[.attribute]?.string, "opacity")
    XCTAssertEqual(animationDict?[.type]?.string, AnimationType.easeOut.rawValue)
  }

  func testNodeAnimationWithChain() throws {
    let node = TextNode("Hello")
      .animation(.delay(0.1).easeOut(duration: 0.3), attribute: .foregroundColor)

    let animationDict = try XCTUnwrap(node.attributes[.animation]?.dict)
    XCTAssertEqual(animationDict[.attribute]?.string, "foregroundColor")
    XCTAssertEqual(animationDict[.type]?.string, AnimationType.delay.rawValue)
    XCTAssertEqual(animationDict[.delay]?.float, 0.1)

    // Check the next animation in the chain
    let nextDict = try XCTUnwrap(animationDict[.next]?.dict)
    XCTAssertEqual(nextDict[.type]?.string, AnimationType.easeOut.rawValue)
    XCTAssertEqual(nextDict[.duration]?.float, 0.3)
  }

  func testComplexAnimationChain() throws {
    let animation = AnimationValue.spring(response: 0.6, dampingFraction: 0.8)
      .delay(0.2)
      .speed(1.5)

    let node = TextNode("Animated")
      .animation(animation, attribute: "frame")

    let animationDict = try XCTUnwrap(node.attributes[.animation]?.dict)
    XCTAssertEqual(animationDict[.attribute]?.string, "frame")
    XCTAssertEqual(animationDict[.type]?.string, AnimationType.spring.rawValue)
    XCTAssertEqual(animationDict[.response]?.float, 0.6)
    XCTAssertEqual(animationDict[.dampingFraction]?.float, 0.8)

    let delayNext = try XCTUnwrap(animationDict[.next]?.dict)
    XCTAssertEqual(delayNext[.type]?.string, AnimationType.delay.rawValue)
    XCTAssertEqual(delayNext[.delay]?.float, 0.2)

    let speedNext = try XCTUnwrap(delayNext[.next]?.dict)
    XCTAssertEqual(speedNext[.type]?.string, AnimationType.speed.rawValue)
    XCTAssertEqual(speedNext[.speed]?.float, 1.5)
  }

  // MARK: - JSON Serialization

  func testNodeWithAnimationSerialization() throws {
    let node = TextNode("Hello")
      .foregroundColor("red")
      .animation(.easeIn(duration: 0.5).delay(0.1), attribute: .foregroundColor)

    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let data = try encoder.encode(node)

    let decoder = JSONDecoder()
    let decoded = try decoder.decode(Node.self, from: data)

    XCTAssertEqual(decoded.type, .text)
    XCTAssertEqual(decoded.attributes[.text]?.string, "Hello")
    XCTAssertEqual(decoded.attributes[.foregroundColor]?.string, "red")

    let animationDict = try XCTUnwrap(decoded.attributes[.animation]?.dict)
    XCTAssertEqual(animationDict[.attribute]?.string, "foregroundColor")
    XCTAssertEqual(animationDict[.type]?.string, AnimationType.easeIn.rawValue)
    XCTAssertEqual(animationDict[.duration]?.float, 0.5)

    let nextDict = try XCTUnwrap(animationDict[.next]?.dict)
    XCTAssertEqual(nextDict[.type]?.string, AnimationType.delay.rawValue)
    XCTAssertEqual(nextDict[.delay]?.float, 0.1)
  }

  // MARK: - Default Values

  func testDefaultDuration() {
    let animation = AnimationValue.easeIn()
    XCTAssertEqual(animation.parameters[AttributeKey.duration.rawValue]?.float, 0.35)
  }

  func testDefaultSpringParameters() {
    let animation = AnimationValue.spring()
    XCTAssertEqual(animation.parameters[AttributeKey.response.rawValue]?.float, 0.55)
    XCTAssertEqual(animation.parameters[AttributeKey.dampingFraction.rawValue]?.float, 0.825)
    XCTAssertEqual(animation.parameters[AttributeKey.blendDuration.rawValue]?.float, 0.0)
  }

  func testDefaultRepeatCountAutoreverses() {
    let animation = AnimationValue.repeatCount(3)
    XCTAssertEqual(animation.parameters[AttributeKey.autoreverses.rawValue]?.bool, false)
  }
}
