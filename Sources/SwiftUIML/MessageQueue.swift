import Foundation
import SwiftUI
import SwiftUIMLCore
import Combine

/// Observable queue for sending messages to rendered components
public class MessageQueue: ObservableObject {
  /// The most recent message sent. Components observe this to receive messages.
  @Published public private(set) var latest: AttributeValue?
  
  /// Optional callback invoked when a message is sent (useful for debugging)
  public var onMessageSent: ((AttributeValue) -> Void)?
  
  public init(onMessageSent: ((AttributeValue) -> Void)? = nil) {
    self.onMessageSent = onMessageSent
  }

  /// Sends a message
  public func send(_ message: AttributeValue) {
    DispatchQueue.main.async {
      self.latest = message
      self.onMessageSent?(message)
    }
  }
  
  /// Clear the current message (optional - helps with debugging)
  public func clear() {
    latest = nil
  }
}

struct MessageQueueKey: EnvironmentKey {
  static let defaultValue = MessageQueue()
}

extension EnvironmentValues {
  public var messageQueue: MessageQueue {
    get { self[MessageQueueKey.self] }
    set { self[MessageQueueKey.self] = newValue }
  }
}
