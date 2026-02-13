import Foundation

public extension AttributeValue {
  /// Attempts to extract an OrderedMultiDictionary from this AttributeValue
  /// Supports both .dict and .array (2D array format) representations
  var orderedDict: OrderedMultiDictionary<AttributeKey, AttributeValue>? {
    switch self {
    case .dict(let dict):
      // Convert regular dictionary to OrderedMultiDictionary
      // Note: Dictionary order is not guaranteed, but we preserve whatever order we get
      return OrderedMultiDictionary(dict.map { ($0.key, $0.value) })
    case .array(let array):
      // Parse as 2D array format: [["key", value], ["key", value], ...]
      var result = OrderedMultiDictionary<AttributeKey, AttributeValue>()
      for element in array {
        // Each element should be an array with 2 elements: [key, value]
        guard
          let pairArray = element.array,
          pairArray.count == 2,
          let keyString = pairArray[0].string
        else {
          return nil
        }
        let key = AttributeKey(keyString)
        let value = pairArray[1]
        result.append(key, value)
      }
      return result
    default:
      return nil
    }
  }
}
