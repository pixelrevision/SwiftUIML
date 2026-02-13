import SwiftUI
import SwiftUIMLCore

public struct SheetModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .sheet
  
  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    guard
      let dict = value.dict,
      let contentNode = dict[.value]?.node
    else {
      return nil
    }
    
    let sheetId = dict[.id]?.string ?? contentNode.id
    let isPresented = dict[.isPresented]?.bool ?? false
    let animated = dict[.animated]?.bool ?? true
    let onPresented = dict[.onPresented]
    let onDismiss = dict[.onDismiss]
    
    return SheetWrapper(
      sheetId: sheetId,
      isPresented: isPresented,
      animated: animated,
      contentNode: contentNode,
      onPresented: onPresented,
      onDismiss: onDismiss,
      messageHandler: messageHandler,
      content: { AnyView(view) }
    )
  }
}

private struct SheetWrapper<Content: View>: View {
  let sheetId: String
  let isPresented: Bool
  let animated: Bool
  let contentNode: Node
  let onPresented: AttributeValue?
  let onDismiss: AttributeValue?
  let messageHandler: MessageHandler?
  let content: () -> Content
  
  @State private var isPresentedState: Bool = false
  @State private var hasPresented: Bool = false
  
  var body: some View {
    content()
      .sheet(
        isPresented: $isPresentedState,
        onDismiss: {
          if let onDismiss = onDismiss {
            wrappedMessageHandler?(onDismiss)
          }
        },
        content: {
          NodeView(contentNode, messageHandler: wrappedMessageHandler)
        }
      )
      .onChange(of: isPresented) { oldValue, newValue in
        if animated {
          isPresentedState = newValue
        }
        else {
          // For non-animated, use transaction
          var transaction = Transaction()
          transaction.disablesAnimations = true
          withTransaction(transaction) {
            isPresentedState = newValue
          }
        }
        
        // Call onPresented when transitioning from false to true
        if !oldValue && newValue && !hasPresented {
          hasPresented = true
          if let onPresented = onPresented {
            wrappedMessageHandler?(onPresented)
          }
        }
        else if !newValue {
          hasPresented = false
        }
      }
      .onAppear {
        isPresentedState = isPresented
        if isPresented && !hasPresented {
          hasPresented = true
          if let onPresented = onPresented {
            wrappedMessageHandler?(onPresented)
          }
        }
      }
  }
  
  /// Wraps the message handler to add presentedId to context
  private var wrappedMessageHandler: MessageHandler? {
    guard let messageHandler = messageHandler else { return nil }

    return { payload in
      let wrappedMessage = wrapMessage(payload, addingToContext: [
        .presentedId: AttributeValue(sheetId),
      ])

      messageHandler(wrappedMessage)
    }
  }
}

#Preview {
  DebugView {
    VStackNode {
      TextNode("Main Content")
        .font(.title)
        .padding()
    }
    .sheet {
      VStackNode {
        TextNode("Sheet Content")
          .font(.headline)
        TextNode("This is inside a sheet")
          .padding()
      }
    }
  }
}
