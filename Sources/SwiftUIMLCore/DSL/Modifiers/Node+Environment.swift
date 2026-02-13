import Foundation

public extension Node {
  /// Sets the locale for the view environment
  /// - Parameter locale: Locale instance
  /// - Returns: A modified node with the locale set
  func locale(_ locale: Locale) -> Node {
    addingAttribute(.locale, value: .string(locale.identifier))
  }

  /// Sets the timezone for the view environment
  /// - Parameter timeZone: TimeZone instance
  /// - Returns: A modified node with the timezone set
  func timeZone(_ timeZone: TimeZone) -> Node {
    addingAttribute(.timeZone, value: .string(timeZone.identifier))
  }

  /// Sets the control size for the view environment
  /// - Parameter size: ControlSize enum value (mini, small, regular, large, extraLarge)
  /// - Returns: A modified node with the control size set
  func controlSize(_ size: Node.ControlSize) -> Node {
    addingAttribute(.controlSize, value: .string(size.rawValue))
  }

  /// Sets the keyboard type for text input
  /// - Parameter type: KeyboardType enum value (default, asciiCapable, numberPad, emailAddress, etc.)
  /// - Returns: A modified node with the keyboard type set
  func keyboardType(_ type: Node.KeyboardType) -> Node {
    addingAttribute(.keyboardType, value: .string(type.rawValue))
  }

  /// Sets the autocapitalization type for text input
  /// - Parameter type: AutocapitalizationType enum value (none, words, sentences, allCharacters)
  /// - Returns: A modified node with the autocapitalization type set
  func autocapitalization(_ type: Node.AutocapitalizationType) -> Node {
    addingAttribute(.autocapitalization, value: .string(type.rawValue))
  }

  /// Sets the text content type for semantic meaning and AutoFill support
  /// - Parameter type: TextContentType enum value (emailAddress, password, username, etc.)
  /// - Returns: A modified node with the text content type set
  func textContentType(_ type: Node.TextContentType) -> Node {
    addingAttribute(.textContentType, value: .string(type.rawValue))
  }

  /// Sets the submit label for the keyboard return key
  /// - Parameter label: SubmitLabel enum value (done, go, send, join, route, search, return, next, continue)
  /// - Returns: A modified node with the submit label set
  func submitLabel(_ label: Node.SubmitLabel) -> Node {
    addingAttribute(.submitLabel, value: .string(label.rawValue))
  }
}
