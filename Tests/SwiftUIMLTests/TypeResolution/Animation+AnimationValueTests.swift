import XCTest
import SwiftUI
@testable import SwiftUIML
@testable import SwiftUIMLCore

class AnimationFromAnimationValueTests: XCTestCase {
  // MARK: - Base Animations with Parameter Verification

  func testEaseInConversion() {
    let animationValue = AnimationValue.easeIn(duration: 0.5)
    let attributeValue = animationValue.toAttributeValue()

    // Verify the attribute value structure
    XCTAssertNotNil(attributeValue.dict, "Should be a dictionary")
    XCTAssertEqual(attributeValue.dict?[.type]?.string, "easeIn")
    XCTAssertEqual(attributeValue.dict?[.duration]?.cgFloat, 0.5)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert easeIn animation")
  }

  func testEaseOutConversion() {
    let animationValue = AnimationValue.easeOut(duration: 0.3)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "easeOut")
    XCTAssertEqual(attributeValue.dict?[.duration]?.cgFloat, 0.3)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert easeOut animation")
  }

  func testEaseInOutConversion() {
    let animationValue = AnimationValue.easeInOut(duration: 0.4)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "easeInOut")
    XCTAssertEqual(attributeValue.dict?[.duration]?.cgFloat, 0.4)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert easeInOut animation")
  }

  func testLinearConversion() {
    let animationValue = AnimationValue.linear(duration: 0.2)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "linear")
    XCTAssertEqual(attributeValue.dict?[.duration]?.cgFloat, 0.2)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert linear animation")
  }

  func testSpringConversion() {
    let animationValue = AnimationValue.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0.1)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "spring")
    XCTAssertEqual(attributeValue.dict?[.response]?.cgFloat, 0.55)
    XCTAssertEqual(attributeValue.dict?[.dampingFraction]?.cgFloat, 0.825)
    XCTAssertEqual(attributeValue.dict?[.blendDuration]?.cgFloat, 0.1)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert spring animation")
  }

  func testBouncyConversion() {
    let animationValue = AnimationValue.bouncy(duration: 0.6)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "bouncy")
    XCTAssertEqual(attributeValue.dict?[.duration]?.cgFloat, 0.6)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert bouncy animation")
  }

  func testSmoothConversion() {
    let animationValue = AnimationValue.smooth(duration: 0.45)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "smooth")
    XCTAssertEqual(attributeValue.dict?[.duration]?.cgFloat, 0.45)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert smooth animation")
  }

  func testSnappyConversion() {
    let animationValue = AnimationValue.snappy(duration: 0.25)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "snappy")
    XCTAssertEqual(attributeValue.dict?[.duration]?.cgFloat, 0.25)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert snappy animation")
  }

  // MARK: - Default Parameters

  func testDefaultDuration() {
    let animationValue = AnimationValue.easeIn()
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.duration]?.cgFloat, 0.35, "Default duration should be 0.35")

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should handle default duration")
  }

  func testDefaultSpringParameters() {
    let animationValue = AnimationValue.spring()
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.response]?.cgFloat, 0.55, "Default response should be 0.55")
    XCTAssertEqual(attributeValue.dict?[.dampingFraction]?.cgFloat, 0.825, "Default dampingFraction should be 0.825")
    XCTAssertEqual(attributeValue.dict?[.blendDuration]?.cgFloat, 0.0, "Default blendDuration should be 0.0")

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should handle default spring parameters")
  }

  // MARK: - Modifiers

  func testDelayModifier() {
    let animationValue = AnimationValue.easeIn().delay(0.5)
    let attributeValue = animationValue.toAttributeValue()

    // Verify base animation
    XCTAssertEqual(attributeValue.dict?[.type]?.string, "easeIn")

    // Verify next modifier exists
    let nextDict = attributeValue.dict?[.next]?.dict
    XCTAssertNotNil(nextDict, "Should have next modifier")
    XCTAssertEqual(nextDict?[.type]?.string, "delay")
    XCTAssertEqual(nextDict?[.delay]?.cgFloat, 0.5)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert delayed animation")
  }

  func testSpeedModifier() {
    let animationValue = AnimationValue.easeOut().speed(2.0)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "easeOut")

    let nextDict = attributeValue.dict?[.next]?.dict
    XCTAssertNotNil(nextDict, "Should have next modifier")
    XCTAssertEqual(nextDict?[.type]?.string, "speed")
    XCTAssertEqual(nextDict?[.speed]?.cgFloat, 2.0)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert speed-modified animation")
  }

  func testRepeatCountModifier() {
    let animationValue = AnimationValue.linear().repeatCount(3, autoreverses: true)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "linear")

    let nextDict = attributeValue.dict?[.next]?.dict
    XCTAssertNotNil(nextDict, "Should have next modifier")
    XCTAssertEqual(nextDict?[.type]?.string, "repeatCount")
    XCTAssertEqual(nextDict?[.count]?.int, 3)
    XCTAssertEqual(nextDict?[.autoreverses]?.bool, true)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert repeating animation")
  }

  func testRepeatForeverModifier() {
    let animationValue = AnimationValue.spring().repeatForever(autoreverses: false)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "spring")

    let nextDict = attributeValue.dict?[.next]?.dict
    XCTAssertNotNil(nextDict, "Should have next modifier")
    XCTAssertEqual(nextDict?[.type]?.string, "repeatForever")
    XCTAssertEqual(nextDict?[.autoreverses]?.bool, false)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert infinitely repeating animation")
  }

  // MARK: - Chained Modifiers

  func testMultipleModifiers() {
    let animationValue = AnimationValue.easeOut(duration: 0.5)
      .delay(0.1)
      .speed(2.0)
      .repeatCount(3, autoreverses: true)
    let attributeValue = animationValue.toAttributeValue()

    // Verify base animation
    XCTAssertEqual(attributeValue.dict?[.type]?.string, "easeOut")
    XCTAssertEqual(attributeValue.dict?[.duration]?.cgFloat, 0.5)

    // Verify first modifier (delay)
    let delayDict = attributeValue.dict?[.next]?.dict
    XCTAssertNotNil(delayDict, "Should have delay modifier")
    XCTAssertEqual(delayDict?[.type]?.string, "delay")
    XCTAssertEqual(delayDict?[.delay]?.cgFloat, 0.1)

    // Verify second modifier (speed)
    let speedDict = delayDict?[.next]?.dict
    XCTAssertNotNil(speedDict, "Should have speed modifier")
    XCTAssertEqual(speedDict?[.type]?.string, "speed")
    XCTAssertEqual(speedDict?[.speed]?.cgFloat, 2.0)

    // Verify third modifier (repeatCount)
    let repeatDict = speedDict?[.next]?.dict
    XCTAssertNotNil(repeatDict, "Should have repeatCount modifier")
    XCTAssertEqual(repeatDict?[.type]?.string, "repeatCount")
    XCTAssertEqual(repeatDict?[.count]?.int, 3)
    XCTAssertEqual(repeatDict?[.autoreverses]?.bool, true)

    // Verify no more modifiers
    XCTAssertNil(repeatDict?[.next], "Should not have more modifiers")

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert animation with multiple modifiers")
  }

  func testComplexChain() {
    let animationValue = AnimationValue.spring(response: 0.6, dampingFraction: 0.8)
      .delay(0.2)
      .speed(1.5)
    let attributeValue = animationValue.toAttributeValue()

    // Verify base spring animation with custom parameters
    XCTAssertEqual(attributeValue.dict?[.type]?.string, "spring")
    XCTAssertEqual(attributeValue.dict?[.response]?.cgFloat, 0.6)
    XCTAssertEqual(attributeValue.dict?[.dampingFraction]?.cgFloat, 0.8)

    // Verify delay modifier
    let delayDict = attributeValue.dict?[.next]?.dict
    XCTAssertEqual(delayDict?[.type]?.string, "delay")
    XCTAssertEqual(delayDict?[.delay]?.cgFloat, 0.2)

    // Verify speed modifier
    let speedDict = delayDict?[.next]?.dict
    XCTAssertEqual(speedDict?[.type]?.string, "speed")
    XCTAssertEqual(speedDict?[.speed]?.cgFloat, 1.5)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should successfully convert complex animation chain")
  }

  // MARK: - Modifier-Only Chains

  func testModifierAsBase() {
    // Test that modifiers can be base animations (they fall back to .default)
    let animationValue = AnimationValue.delay(0.5)
    let attributeValue = animationValue.toAttributeValue()

    XCTAssertEqual(attributeValue.dict?[.type]?.string, "delay")
    XCTAssertEqual(attributeValue.dict?[.delay]?.cgFloat, 0.5)
    XCTAssertNil(attributeValue.dict?[.next], "Should not have next modifier when used as base")

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should handle modifier as base animation (falls back to .default)")
  }

  func testChainedModifiersOnly() {
    let animationValue = AnimationValue.delay(0.2).speed(1.5)
    let attributeValue = animationValue.toAttributeValue()

    // Verify base is delay modifier
    XCTAssertEqual(attributeValue.dict?[.type]?.string, "delay")
    XCTAssertEqual(attributeValue.dict?[.delay]?.cgFloat, 0.2)

    // Verify speed is chained
    let nextDict = attributeValue.dict?[.next]?.dict
    XCTAssertEqual(nextDict?[.type]?.string, "speed")
    XCTAssertEqual(nextDict?[.speed]?.cgFloat, 1.5)

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should handle chained modifiers without base animation")
  }

  // MARK: - Error Cases

  func testInvalidAttributeValue() {
    let animation = Animation.from(.string("invalid"))
    XCTAssertNil(animation, "Should return nil for non-dict attribute value")
  }

  func testNumberAttributeValue() {
    let animation = Animation.from(.number(123))
    XCTAssertNil(animation, "Should return nil for number attribute value")
  }

  func testBoolAttributeValue() {
    let animation = Animation.from(.bool(true))
    XCTAssertNil(animation, "Should return nil for bool attribute value")
  }

  func testArrayAttributeValue() {
    let animation = Animation.from(.array([.string("test")]))
    XCTAssertNil(animation, "Should return nil for array attribute value")
  }

  func testNullAttributeValue() {
    let animation = Animation.from(.null)
    XCTAssertNil(animation, "Should return nil for null attribute value")
  }

  func testMissingType() {
    let attributeValue: AttributeValue = .dict([
      .duration: .number(0.5),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNil(animation, "Should return nil when type is missing")
  }

  func testInvalidType() {
    let attributeValue: AttributeValue = .dict([
      .type: .string("invalid_type"),
      .duration: .number(0.5),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNil(animation, "Should return nil for invalid animation type")
  }

  func testTypeAsNumber() {
    let attributeValue: AttributeValue = .dict([
      .type: .number(123),
      .duration: .number(0.5),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNil(animation, "Should return nil when type is not a string")
  }

  func testEmptyDict() {
    let attributeValue: AttributeValue = .dict([:])

    let animation = Animation.from(attributeValue)
    XCTAssertNil(animation, "Should return nil for empty dictionary")
  }

  // MARK: - Missing Parameters (Should Use Defaults)

  func testMissingDuration() {
    let attributeValue: AttributeValue = .dict([
      .type: .string(AnimationType.easeIn.rawValue),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should use default duration when missing")
  }

  func testMissingSpringParameters() {
    let attributeValue: AttributeValue = .dict([
      .type: .string(AnimationType.spring.rawValue),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should use default spring parameters when missing")
  }

  func testMissingAutoreverses() {
    let attributeValue: AttributeValue = .dict([
      .type: .string(AnimationType.repeatForever.rawValue),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should use default autoreverses when missing")
  }

  func testPartialSpringParameters() {
    // Only provide response, should use defaults for the rest
    let attributeValue: AttributeValue = .dict([
      .type: .string(AnimationType.spring.rawValue),
      .response: .number(0.8),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should use defaults for missing spring parameters")
  }

  // MARK: - Invalid Next Chains

  func testInvalidNextValue() {
    let attributeValue: AttributeValue = .dict([
      .type: .string(AnimationType.easeIn.rawValue),
      .duration: .number(0.5),
      .next: .string("invalid"),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should ignore invalid next value and return base animation")
  }

  func testNextWithMissingType() {
    let attributeValue: AttributeValue = .dict([
      .type: .string(AnimationType.easeIn.rawValue),
      .duration: .number(0.5),
      .next: .dict([
        .delay: .number(0.5),
      ]),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should ignore next modifier with missing type and return base animation")
  }

  func testDeepNestedChain() {
    // Build a deeply nested chain manually
    let attributeValue: AttributeValue = .dict([
      .type: .string(AnimationType.easeIn.rawValue),
      .duration: .number(0.5),
      .next: .dict([
        .type: .string(AnimationType.delay.rawValue),
        .delay: .number(0.1),
        .next: .dict([
          .type: .string(AnimationType.speed.rawValue),
          .speed: .number(2.0),
          .next: .dict([
            .type: .string(AnimationType.repeatCount.rawValue),
            .count: .number(5),
            .autoreverses: .bool(true),
          ]),
        ]),
      ]),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should handle deeply nested modifier chains")
  }

  // MARK: - Parameter Type Coercion

  func testDurationAsString() {
    let attributeValue: AttributeValue = .dict([
      .type: .string(AnimationType.easeIn.rawValue),
      .duration: .string("0.5"),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should handle duration as string (coercion)")
  }

  func testCountAsDouble() {
    let attributeValue: AttributeValue = .dict([
      .type: .string(AnimationType.repeatCount.rawValue),
      .count: .number(3.0),
      .autoreverses: .bool(true),
    ])

    let animation = Animation.from(attributeValue)
    XCTAssertNotNil(animation, "Should handle count as double")
  }

  func testAutoReversesAsNumber() {
    let attributeValue: AttributeValue = .dict([
      .type: .string(AnimationType.repeatForever.rawValue),
      .autoreverses: .number(1),
    ])

    let animation = Animation.from(attributeValue)
    // This might not work due to AttributeValue.bool requiring actual bool
    // But test it anyway to document behavior
    XCTAssertNotNil(animation, "Should handle autoreverses fallback when not a bool")
  }
}
