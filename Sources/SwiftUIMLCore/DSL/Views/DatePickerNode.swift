import Foundation

/// Formats a Date to ISO8601 string
private func formatDate(_ date: Date) -> String {
  let formatter = ISO8601DateFormatter()
  formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
  return formatter.string(from: date)
}

/// Creates a DatePicker node with a string label
/// - Parameters:
///   - label: The label text for the date picker
///   - value: Optional initial date value (ISO8601 string)
/// - Returns: A node representing a date picker
public func DatePickerNode(
  _ label: String,
  value: String? = nil
) -> Node {
  var attributes: Node.Attributes = [
    .label: .string(label),
  ]

  if let value = value {
    attributes[.value] = .string(value)
  }

  return Node(
    type: .datePicker,
    attributes: attributes
  )
}

/// Creates a DatePicker node with a custom label node
/// - Parameters:
///   - label: The label node for the date picker
///   - value: Optional initial date value (ISO8601 string)
/// - Returns: A node representing a date picker
public func DatePickerNode(
  label: Node,
  value: String? = nil
) -> Node {
  var attributes: Node.Attributes = [
    .label: .node(label),
  ]
  if let value = value {
    attributes[.value] = .string(value)
  }
  return Node(
    type: .datePicker,
    attributes: attributes
  )
}

/// Creates a DatePicker node with a string label and Date value
/// - Parameters:
///   - label: The label text for the date picker
///   - value: Initial date value
/// - Returns: A node representing a date picker
public func DatePickerNode(
  _ label: String,
  value: Date
) -> Node {
  DatePickerNode(label, value: formatDate(value))
}

/// Creates a DatePicker node with a custom label node and Date value
/// - Parameters:
///   - label: The label node for the date picker
///   - value: Initial date value
/// - Returns: A node representing a date picker
public func DatePickerNode(
  label: Node,
  value: Date
) -> Node {
  DatePickerNode(label: label, value: formatDate(value))
}
