import Foundation

/// Wraps a message payload with context metadata
/// - Parameters:
///   - payload: The original message payload
///   - contextUpdates: Dictionary of context keys and values to add
/// - Returns: Wrapped message with structure: {context: {...}, message: {...}} or merged into existing structure
public func wrapMessage(
  _ payload: AttributeValue,
  addingToContext contextUpdates: [AttributeKey: AttributeValue]
) -> AttributeValue {
  if let dict = payload.dict {
    // Check if this dict already has a .message key (meaning it's already wrapped)
    if dict[.message] != nil {
      // Already wrapped, just add to context
      var newDict = dict
      var context = dict[.context]?.dict ?? [:]

      // Merge in the new context values
      for (key, value) in contextUpdates where context[key] == nil {
        context[key] = value
      }

      newDict[.context] = .dict(context)
      return .dict(newDict)
    }
    else {
      // Dict doesn't have .message key, so wrap the entire dict as the message
      var wrappedDict: [AttributeKey: AttributeValue] = [
        .message: payload,
      ]

      if !contextUpdates.isEmpty {
        wrappedDict[.context] = .dict(contextUpdates)
      }

      return .dict(wrappedDict)
    }
  }
  else {
    // Non-dict payload, wrap it with context and message keys
    var wrappedDict: [AttributeKey: AttributeValue] = [
      .message: payload,
    ]

    if !contextUpdates.isEmpty {
      wrappedDict[.context] = .dict(contextUpdates)
    }

    return .dict(wrappedDict)
  }
}
