import SwiftUI

/// Environment key for sharing NavigationPath binding between NavigationStack and modifiers
struct NavigationPathKey: EnvironmentKey {
  static let defaultValue: Binding<NavigationPath>? = nil
}

extension EnvironmentValues {
  var navigationPath: Binding<NavigationPath>? {
    get { self[NavigationPathKey.self] }
    set { self[NavigationPathKey.self] = newValue }
  }
}
