import Foundation
import SwiftUIMLCore
import CoreGraphics

/// Represents a responsive breakpoint condition
public struct BreakpointCondition {
  public enum Dimension {
    case width
    case height
  }
  
  public enum Operator {
    case greaterThanOrEqual  // >=
    case greaterThan         // >
    case lessThanOrEqual     // <=
    case lessThan            // <
    case equal               // =
  }
  
  public let dimension: Dimension
  public let op: Operator
  public let value: CGFloat
  
  /// Checks if this condition matches the given size
  public func matches(size: CGSize) -> Bool {
    let actual = dimension == .width ? size.width : size.height
    
    switch op {
    case .greaterThanOrEqual: return actual >= value
    case .greaterThan: return actual > value
    case .lessThanOrEqual: return actual <= value
    case .lessThan: return actual < value
    case .equal: return actual == value
    }
  }
}

/// Represents a breakpoint pattern (one or more conditions)
public struct BreakpointPattern {
  public let conditions: [BreakpointCondition]
  
  /// Checks if all conditions match (AND logic)
  public func matches(size: CGSize) -> Bool {
    conditions.allSatisfy { $0.matches(size: size) }
  }
  
  /// Parses a pattern string into a BreakpointPattern
  /// 
  /// Supported formats:
  /// - Named breakpoints: "xs", "sm", "md", "lg", "xl" (defaults to width >=)
  /// - Custom width: "w>=800", "w>600", "w<=1024", "w<768"
  /// - Custom height: "h>=1024", "h<600"
  /// - Combined: "w>=768,h>=1024" (AND logic)
  ///
  /// - Parameter pattern: Pattern string to parse
  /// - Returns: BreakpointPattern or nil if invalid
  public init?(parsing pattern: String) {
    let trimmed = pattern.trimmingCharacters(in: .whitespaces)
    
    // Handle named breakpoints first (xs, sm, md, lg, xl)
    if let namedValue = Self.namedBreakpoints[trimmed] {
      self.conditions = [
        BreakpointCondition(
          dimension: .width,
          op: .greaterThanOrEqual,
          value: namedValue
        ),
      ]
      return
    }
    
    // Parse custom patterns (e.g., "w>=768,h>=1024")
    let parts = trimmed.split(separator: ",").map { String($0).trimmingCharacters(in: .whitespaces) }
    var conditions: [BreakpointCondition] = []
    
    for part in parts {
      guard let condition = Self.parseCondition(part) else {
        return nil
      }
      conditions.append(condition)
    }
    
    guard !conditions.isEmpty else { return nil }
    self.conditions = conditions
  }
  
  /// Named breakpoint values (width in points)
  private static let namedBreakpoints: [String: CGFloat] = [
    "xs": 0,      // 0+ (all sizes)
    "sm": 375,    // 375+ (standard phones)
    "md": 768,    // 768+ (large phones, small tablets)
    "lg": 1024,   // 1024+ (tablets)
    "xl": 1366,    // 1366+ (large tablets, desktop)
  ]
  
  /// Parses a single condition string (e.g., "w>=768" or "h<600")
  private static func parseCondition(_ string: String) -> BreakpointCondition? {
    // Extract dimension (w or h)
    guard let firstChar = string.first,
      let dimension = firstChar == "w" ? BreakpointCondition.Dimension.width :
        firstChar == "h" ? BreakpointCondition.Dimension.height :
        nil else {
      return nil
    }
    
    // Extract operator and value
    let rest = String(string.dropFirst())
    
    // Try operators in order (longest first to match >= before >)
    if rest.hasPrefix(">=") {
      guard let doubleValue = Double(rest.dropFirst(2)) else { return nil }
      return BreakpointCondition(dimension: dimension, op: .greaterThanOrEqual, value: CGFloat(doubleValue))
    }
    else if rest.hasPrefix(">") {
      guard let doubleValue = Double(rest.dropFirst(1)) else { return nil }
      return BreakpointCondition(dimension: dimension, op: .greaterThan, value: CGFloat(doubleValue))
    }
    else if rest.hasPrefix("<=") {
      guard let doubleValue = Double(rest.dropFirst(2)) else { return nil }
      return BreakpointCondition(dimension: dimension, op: .lessThanOrEqual, value: CGFloat(doubleValue))
    }
    else if rest.hasPrefix("<") {
      guard let doubleValue = Double(rest.dropFirst(1)) else { return nil }
      return BreakpointCondition(dimension: dimension, op: .lessThan, value: CGFloat(doubleValue))
    }
    else if rest.hasPrefix("=") {
      guard let doubleValue = Double(rest.dropFirst(1)) else { return nil }
      return BreakpointCondition(dimension: dimension, op: .equal, value: CGFloat(doubleValue))
    }
    
    return nil
  }
}
