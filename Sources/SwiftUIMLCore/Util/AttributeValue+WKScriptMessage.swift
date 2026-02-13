import WebKit
import Foundation

extension AttributeValue {
  /// Initialize an AttributeValue from a WKScriptMessage.body (Any)
  public init?(scriptMessageBody body: Any) {
    // null
    if body is NSNull {
      self = .null
      return
    }
    // string
    if let string = body as? String {
      self = .string(string)
      return
    }
    // number
    if let number = body as? NSNumber {
      // Check if it's a boolean
      if CFNumberGetType(number as CFNumber) == .charType {
        self = .bool(number.boolValue)
        return
      }
      // Otherwise treat as number
      self = .number(number.doubleValue)
      return
    }
    // array
    if let array = body as? [Any] {
      let values = array.compactMap { AttributeValue(scriptMessageBody: $0) }
      self = .array(values)
      return
    }
    // dict
    if let dict = body as? [String: Any] {
      var attributeDict: [AttributeKey: AttributeValue] = [:]
      for (key, value) in dict {
        if let attributeValue = AttributeValue(scriptMessageBody: value) {
          attributeDict[AttributeKey(key)] = attributeValue
        }
      }
      self = .dict(attributeDict)
      return
    }
    // unsupported
    return nil
  }
}
