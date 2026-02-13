public extension Dictionary {
  /// Checks if a key in the list provided is present in the dictionary
  func containsKey(_ keys: Key...) -> Bool {
    for key in keys where self[key] != nil {
      return true
    }
    return false
  }
}
