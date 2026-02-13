public extension Node {
  /// Sets the scroll bounce behavior
  /// - Parameters:
  ///   - behavior: Bounce behavior
  ///   - axes: Axes to apply to
  func scrollBounceBehavior(_ behavior: ScrollBounceBehavior, axes: Axis = .vertical) -> Node {
    addingAttribute(.scrollBounceBehavior, value: [
      .behavior: .string(behavior.rawValue),
      .axis: .string(axes.rawValue),
    ])
  }

  /// Sets the scroll target behavior for snapping
  /// - Parameter behavior: Target behavior (paging or viewAligned)
  func scrollTargetBehavior(_ behavior: ScrollTargetBehavior) -> Node {
    addingAttribute(.scrollTargetBehavior, value: .string(behavior.rawValue))
  }

  /// Marks this view as a scroll target layout container
  /// Use on LazyVStack/LazyHStack inside a ScrollView to enable snapping
  func scrollTargetLayout() -> Node {
    addingAttribute(.scrollTargetLayout, value: .bool(true))
  }

  /// Disables or enables scrolling
  /// - Parameter disabled: Whether scrolling should be disabled
  func scrollDisabled(_ disabled: Bool = true) -> Node {
    addingAttribute(.scrollDisabled, value: .bool(disabled))
  }

  /// Sets the visibility of scroll indicators
  /// - Parameters:
  ///   - visibility: Indicator visibility
  ///   - axes: Which axes to apply to (defaults to both)
  func scrollIndicators(_ visibility: ScrollIndicatorVisibility, axes: Axis? = nil) -> Node {
    if let axes = axes {
      return addingAttribute(.scrollIndicators, value: [
        .type: .string(visibility.rawValue),
        .axis: .string(axes.rawValue),
      ])
    }
    else {
      return addingAttribute(.scrollIndicators, value: .string(visibility.rawValue))
    }
  }
}
