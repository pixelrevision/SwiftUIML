/// Type-safe breakpoint pattern builder for DSL
public struct Breakpoint: ExpressibleByStringLiteral, Hashable {
  public let pattern: String
  
  public init(_ pattern: String) {
    self.pattern = pattern
  }
  
  // ExpressibleByStringLiteral for named breakpoints
  public init(stringLiteral value: String) {
    self.pattern = value
  }
  
  // Hashable conformance
  public func hash(into hasher: inout Hasher) {
    hasher.combine(pattern)
  }
  
  public static func == (lhs: Breakpoint, rhs: Breakpoint) -> Bool {
    lhs.pattern == rhs.pattern
  }
  
  /// Extra small (0+)
  public static let xs: Breakpoint = "xs"
  
  /// Small (375+)
  public static let sm: Breakpoint = "sm"
  
  /// Medium (768+)
  public static let md: Breakpoint = "md"
  
  /// Large (1024+)
  public static let lg: Breakpoint = "lg"
  
  /// Extra large (1366+)
  public static let xl: Breakpoint = "xl"
  
  /// Width greater than or equal to value
  public static func w(_ value: Double) -> Breakpoint {
    Breakpoint("w>=\(Int(value))")
  }
  
  /// Width greater than value
  public static func wGreaterThan(_ value: Double) -> Breakpoint {
    Breakpoint("w>\(Int(value))")
  }
  
  /// Width less than or equal to value
  public static func wLessThanOrEqual(_ value: Double) -> Breakpoint {
    Breakpoint("w<=\(Int(value))")
  }
  
  /// Width less than value
  public static func wLessThan(_ value: Double) -> Breakpoint {
    Breakpoint("w<\(Int(value))")
  }
  
  /// Height greater than or equal to value
  public static func h(_ value: Double) -> Breakpoint {
    Breakpoint("h>=\(Int(value))")
  }
  
  /// Height greater than value
  public static func hGreaterThan(_ value: Double) -> Breakpoint {
    Breakpoint("h>\(Int(value))")
  }
  
  /// Height less than or equal to value
  public static func hLessThanOrEqual(_ value: Double) -> Breakpoint {
    Breakpoint("h<=\(Int(value))")
  }
  
  /// Height less than value
  public static func hLessThan(_ value: Double) -> Breakpoint {
    Breakpoint("h<\(Int(value))")
  }
  
  /// Combine width and height conditions (AND logic)
  public func and(_ other: Breakpoint) -> Breakpoint {
    Breakpoint("\(self.pattern),\(other.pattern)")
  }
}

public extension Breakpoint {
  /// Combine breakpoints with AND logic
  static func + (lhs: Breakpoint, rhs: Breakpoint) -> Breakpoint {
    lhs.and(rhs)
  }
}
