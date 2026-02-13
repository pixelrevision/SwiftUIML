public extension Node {
  /// Presents a sheet
  /// - Parameters:
  ///   - id: Optional identifier for the sheet (defaults to content node's id)
  ///   - isPresented: Whether the sheet is presented
  ///   - animated: Whether to animate the presentation (defaults to true)
  ///   - onPresented: Optional message to send when the sheet is presented
  ///   - onDismiss: Optional message to send when the sheet is dismissed
  ///   - content: The content to display in the sheet
  func sheet(
    id: String? = nil,
    isPresented: Bool = true,
    animated: Bool = true,
    onPresented: AttributeValue? = nil,
    onDismiss: AttributeValue? = nil,
    @NodeBuilder content: () -> [Node]
  ) -> Node {
    let contentNodes = content()
    
    let contentNode: Node

    if contentNodes.count == 1 {
      contentNode = contentNodes[0]
    }
    else {
      contentNode = Node(type: .vStack, children: contentNodes)
    }
    return sheet(
      id: id,
      isPresented: isPresented,
      animated: animated,
      content: contentNode,
      onPresented: onPresented,
      onDismiss: onDismiss
    )
  }

  /// Presents a sheet with a single node
  /// - Parameters:
  ///   - id: Optional identifier for the sheet (defaults to content node's id)
  ///   - isPresented: Whether the sheet is presented
  ///   - animated: Whether to animate the presentation (defaults to true)
  ///   - content: The node to display in the sheet
  ///   - onPresented: Optional message to send when the sheet is presented
  ///   - onDismiss: Optional message to send when the sheet is dismissed
  func sheet(
    id: String? = nil,
    isPresented: Bool = true,
    animated: Bool = true,
    content: Node,
    onPresented: AttributeValue? = nil,
    onDismiss: AttributeValue? = nil
  ) -> Node {
    var sheetDict: [AttributeKey: AttributeValue] = [
      .isPresented: .bool(isPresented),
      .animated: .bool(animated),
      .value: .node(content),
    ]

    if let id = id {
      sheetDict[.id] = .string(id)
    }

    if let onPresented = onPresented {
      sheetDict[.onPresented] = onPresented
    }

    if let onDismiss = onDismiss {
      sheetDict[.onDismiss] = onDismiss
    }

    return addingAttribute(.sheet, value: .dict(sheetDict))
  }

  /// Presents a full screen cover
  /// - Parameters:
  ///   - id: Optional identifier for the cover (defaults to content node's id)
  ///   - isPresented: Whether the cover is presented
  ///   - animated: Whether to animate the presentation (defaults to true)
  ///   - onPresented: Optional message to send when the cover is presented
  ///   - onDismiss: Optional message to send when the cover is dismissed
  ///   - content: The content to display in the cover
  func fullScreenCover(
    id: String? = nil,
    isPresented: Bool = true,
    animated: Bool = true,
    onPresented: AttributeValue? = nil,
    onDismiss: AttributeValue? = nil,
    @NodeBuilder content: () -> [Node]
  ) -> Node {
    let contentNodes = content()

    let contentNode: Node

    if contentNodes.count == 1 {
      contentNode = contentNodes[0]
    }
    else {
      contentNode = Node(type: .vStack, children: contentNodes)
    }
    return fullScreenCover(
      id: id,
      isPresented: isPresented,
      animated: animated,
      content: contentNode,
      onPresented: onPresented,
      onDismiss: onDismiss
    )
  }

  /// Presents a full screen cover with a single node
  /// - Parameters:
  ///   - id: Optional identifier for the cover (defaults to content node's id)
  ///   - isPresented: Whether the cover is presented
  ///   - animated: Whether to animate the presentation (defaults to true)
  ///   - content: The node to display in the cover
  ///   - onPresented: Optional message to send when the cover is presented
  ///   - onDismiss: Optional message to send when the cover is dismissed
  func fullScreenCover(
    id: String? = nil,
    isPresented: Bool = true,
    animated: Bool = true,
    content: Node,
    onPresented: AttributeValue? = nil,
    onDismiss: AttributeValue? = nil
  ) -> Node {
    var coverDict: [AttributeKey: AttributeValue] = [
      .isPresented: .bool(isPresented),
      .animated: .bool(animated),
      .value: .node(content),
    ]

    if let id = id {
      coverDict[.id] = .string(id)
    }

    if let onPresented = onPresented {
      coverDict[.onPresented] = onPresented
    }

    if let onDismiss = onDismiss {
      coverDict[.onDismiss] = onDismiss
    }

    return addingAttribute(.fullScreenCover, value: .dict(coverDict))
  }

  /// Presents an alert
  /// - Parameters:
  ///   - title: Alert title
  ///   - message: Optional alert message
  ///   - isPresented: Whether the alert is presented
  ///   - buttons: Array of AlertButton configurations
  ///   - onDismiss: Optional message to send when alert is dismissed
  func alert(
    title: String,
    message: String? = nil,
    isPresented: Bool = true,
    buttons: [AlertButton],
    onDismiss: AttributeValue? = nil
  ) -> Node {
    var alertDict: [AttributeKey: AttributeValue] = [
      .title: .string(title),
      .isPresented: .bool(isPresented),
      .buttons: .array(buttons.map { .dict($0.attributes) }),
    ]

    if let message = message {
      alertDict[.message] = .string(message)
    }

    if let onDismiss = onDismiss {
      alertDict[.onDismiss] = onDismiss
    }

    return addingAttribute(.alert, value: .dict(alertDict))
  }

  /// Presents a confirmation dialog
  /// - Parameters:
  ///   - title: Title of the confirmation dialog
  ///   - message: Optional message text
  ///   - isPresented: Whether the dialog is currently presented
  ///   - buttons: Array of AlertButton configurations
  ///   - onDismiss: Optional message to send when dialog is dismissed
  func confirmationDialog(
    title: String,
    message: String? = nil,
    isPresented: Bool = true,
    buttons: [AlertButton],
    onDismiss: AttributeValue? = nil
  ) -> Node {
    var dialogDict: [AttributeKey: AttributeValue] = [
      .title: .string(title),
      .isPresented: .bool(isPresented),
      .buttons: .array(buttons.map { .dict($0.attributes) }),
    ]

    if let message = message {
      dialogDict[.message] = .string(message)
    }

    if let onDismiss = onDismiss {
      dialogDict[.onDismiss] = onDismiss
    }

    return addingAttribute(.confirmationDialog, value: .dict(dialogDict))
  }

  /// Presents a popover
  /// - Parameters:
  ///   - id: Optional identifier for the popover (defaults to content node's id)
  ///   - isPresented: Whether the popover is presented
  ///   - animated: Whether to animate the presentation (defaults to true)
  ///   - onPresented: Optional message to send when the popover is presented
  ///   - onDismiss: Optional message to send when the popover is dismissed
  ///   - content: The content to display in the popover
  func popover(
    id: String? = nil,
    isPresented: Bool = true,
    animated: Bool = true,
    onPresented: AttributeValue? = nil,
    onDismiss: AttributeValue? = nil,
    @NodeBuilder content: () -> [Node]
  ) -> Node {
    let contentNodes = content()

    let contentNode: Node

    if contentNodes.count == 1 {
      contentNode = contentNodes[0]
    }
    else {
      contentNode = Node(type: .vStack, children: contentNodes)
    }
    return popover(
      id: id,
      isPresented: isPresented,
      animated: animated,
      content: contentNode,
      onPresented: onPresented,
      onDismiss: onDismiss
    )
  }

  /// Presents a popover with a single node
  /// - Parameters:
  ///   - id: Optional identifier for the popover (defaults to content node's id)
  ///   - isPresented: Whether the popover is presented
  ///   - animated: Whether to animate the presentation (defaults to true)
  ///   - content: The node to display in the popover
  ///   - onPresented: Optional message to send when the popover is presented
  ///   - onDismiss: Optional message to send when the popover is dismissed
  func popover(
    id: String? = nil,
    isPresented: Bool = true,
    animated: Bool = true,
    content: Node,
    onPresented: AttributeValue? = nil,
    onDismiss: AttributeValue? = nil
  ) -> Node {
    var popoverDict: [AttributeKey: AttributeValue] = [
      .isPresented: .bool(isPresented),
      .animated: .bool(animated),
      .value: .node(content),
    ]

    if let id = id {
      popoverDict[.id] = .string(id)
    }

    if let onPresented = onPresented {
      popoverDict[.onPresented] = onPresented
    }

    if let onDismiss = onDismiss {
      popoverDict[.onDismiss] = onDismiss
    }

    return addingAttribute(.popover, value: .dict(popoverDict))
  }

  /// Presents a navigation destination
  /// - Parameters:
  ///   - value: Identifier for this destination
  ///   - id: Optional identifier for the destination (defaults to value)
  ///   - isPresented: Whether to auto-push this destination
  ///   - content: The content to display when navigated to
  ///   - onPresented: Optional message to send when pushed
  ///   - onDismiss: Optional message to send when popped
  func navigationDestination(
    value: String,
    id: String? = nil,
    isPresented: Bool = false,
    content: Node,
    onPresented: AttributeValue? = nil,
    onDismiss: AttributeValue? = nil
  ) -> Node {
    var destDict: [AttributeKey: AttributeValue] = [
      .value: .string(value),
      .isPresented: .bool(isPresented),
      .content: .node(content),
    ]

    if let id = id {
      destDict[.id] = .string(id)
    }

    if let onPresented = onPresented {
      destDict[.onPresented] = onPresented
    }

    if let onDismiss = onDismiss {
      destDict[.onDismiss] = onDismiss
    }

    return addingAttribute(.navigationDestination, value: .dict(destDict))
  }

  /// Presents a navigation destination with builder
  /// - Parameters:
  ///   - value: Identifier for this destination
  ///   - id: Optional identifier for the destination
  ///   - isPresented: Whether to auto-push this destination
  ///   - onPresented: Optional message to send when pushed
  ///   - onDismiss: Optional message to send when popped
  ///   - content: Builder for destination content
  func navigationDestination(
    value: String,
    id: String? = nil,
    isPresented: Bool = false,
    onPresented: AttributeValue? = nil,
    onDismiss: AttributeValue? = nil,
    @NodeBuilder content: () -> [Node]
  ) -> Node {
    let contentNodes = content()
    let contentNode: Node

    if contentNodes.count == 1 {
      contentNode = contentNodes[0]
    }
    else {
      contentNode = Node(type: .vStack, children: contentNodes)
    }

    return navigationDestination(
      value: value,
      id: id,
      isPresented: isPresented,
      content: contentNode,
      onPresented: onPresented,
      onDismiss: onDismiss
    )
  }

  /// Sets the navigation title
  /// - Parameter title: The title to display
  func navigationTitle(_ title: String) -> Node {
    addingAttribute(.navigationTitle, value: .string(title))
  }

  /// Sets the navigation bar title display mode
  /// - Parameter displayMode: The display mode (automatic, inline, large)
  func navigationBarTitleDisplayMode(_ displayMode: NavigationBarTitleDisplayMode) -> Node {
    addingAttribute(.navigationBarTitleDisplayMode, value: .string(displayMode.rawValue))
  }

  /// Sets whether the navigation bar is hidden
  /// - Parameter hidden: Whether to hide the navigation bar
  func navigationBarHidden(_ hidden: Bool = true) -> Node {
    addingAttribute(.navigationBarHidden, value: .bool(hidden))
  }

  /// Sets whether the navigation bar back button is hidden
  /// - Parameter hidden: Whether to hide the back button
  func navigationBarBackButtonHidden(_ hidden: Bool = true) -> Node {
    addingAttribute(.navigationBarBackButtonHidden, value: .bool(hidden))
  }

  /// Tags a node with a navigation destination key for use with navigationDestinations
  /// - Parameter key: The key to identify this destination
  func navigationDestinationKey(_ key: String) -> Node {
    addingAttribute(.navigationDestinationKey, value: .string(key))
  }

  /// Presents multiple navigation destinations
  /// - Parameter content: Builder containing nodes tagged with navigationDestinationKey
  func navigationDestinations(@NodeBuilder content: () -> [Node]) -> Node {
    let contentNodes = content()
    return addingAttribute(.navigationDestinations, value: .array(contentNodes.map { .node($0) }))
  }

  /// Sets the presentation detents for a sheet or popover
  /// - Parameter detents: Array of presentation detents
  func presentationDetents(_ detents: [PresentationDetent]) -> Node {
    addingAttribute(.presentationDetents, value: .array(detents.map { $0.attributeValue }))
  }

  /// Sets a single presentation detent
  /// - Parameter detent: Presentation detent
  func presentationDetents(_ detent: PresentationDetent) -> Node {
    addingAttribute(.presentationDetents, value: .array([detent.attributeValue]))
  }

  /// Sets the visibility of the presentation drag indicator
  /// - Parameter visibility: The visibility mode
  func presentationDragIndicator(_ visibility: Visibility) -> Node {
    addingAttribute(.presentationDragIndicator, value: .string(visibility.rawValue))
  }

  /// Disables interactive dismissal of presented content
  /// - Parameter disabled: Whether to disable interactive dismiss (defaults to true)
  func interactiveDismissDisabled(_ disabled: Bool = true) -> Node {
    addingAttribute(.interactiveDismissDisabled, value: .bool(disabled))
  }
}
