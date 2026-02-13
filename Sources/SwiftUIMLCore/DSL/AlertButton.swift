/// Represents an alert button configuration
public enum AlertButton {
  /// Cancel button (dismisses alert, optional action)
  case cancel(String, action: AttributeValue? = nil)

  /// Destructive button (red/destructive style)
  case destructive(String, action: AttributeValue)

  /// Default button (normal style, optional action)
  case `default`(String, action: AttributeValue? = nil)

  /// Converts the button to attribute dictionary
  public var attributes: [AttributeKey: AttributeValue] {
    switch self {
    case let .cancel(label, action):
      var dict: [AttributeKey: AttributeValue] = [
        .label: .string(label),
        .role: .string("cancel"),
      ]
      if let action = action {
        dict[.action] = action
      }
      return dict

    case let .destructive(label, action):
      return [
        .label: .string(label),
        .role: .string("destructive"),
        .action: action,
      ]

    case let .default(label, action):
      var dict: [AttributeKey: AttributeValue] = [
        .label: .string(label),
      ]
      if let action = action {
        dict[.action] = action
      }
      return dict
    }
  }
}
