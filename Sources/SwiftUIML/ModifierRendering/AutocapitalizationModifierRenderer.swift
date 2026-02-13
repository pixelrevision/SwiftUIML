import SwiftUI
import SwiftUIMLCore

public struct AutocapitalizationModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .autocapitalization

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard let autocapitalizationType = UITextAutocapitalizationType(value) else {
      return nil
    }
    return view.autocapitalization(autocapitalizationType)
  }
}

#Preview {
  DebugView {
    FormNode {
      TextFieldNode("All Characters")
        .autocapitalization(.allCharacters)
      
      TextFieldNode("Sentences")
        .autocapitalization(.sentences)
      
      TextFieldNode("Words")
        .autocapitalization(.words)
      
      TextFieldNode("None")
        .autocapitalization(.none)
    }
    .padding(16)
  }
}
