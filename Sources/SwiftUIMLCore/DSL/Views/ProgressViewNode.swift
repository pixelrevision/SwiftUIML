/// Creates an indeterminate progress view (spinning indicator)
public func ProgressViewNode(label: String? = nil) -> Node {
  var attrs: Node.Attributes = [:]
  if let label = label {
    attrs[.label] = .string(label)
  }
  return Node(
    type: .progressView,
    attributes: attrs
  )
}

/// Creates a determinate progress view with a progress bar
public func ProgressViewNode(
  label: String? = nil,
  value: Double,
  total: Double = 1.0
) -> Node {
  var attrs: Node.Attributes = [
    .value: .number(value),
    .total: .number(total),
  ]
  if let label = label {
    attrs[.label] = .string(label)
  }
  return Node(
    type: .progressView,
    attributes: attrs
  )
}
