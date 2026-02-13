import SwiftUI
import SwiftUIML

struct ContentView: View {
  @ObservedObject var store = Store()

  var body: some View {
    DebugView(store.state) { message in
      store.handle(message: message)
    }
  }
}

#Preview {
  ContentView()
}
