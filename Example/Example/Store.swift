import Foundation
import Combine
import SwiftUIML

class Store: ObservableObject {
  @Published var state: Node = ProgressViewNode(label: "Loading")
  @Published var alertMessage: String = ""
  private let baseURL = "http://localhost:3000"
  private let urlSession = URLSession.shared
  private let decoder = JSONDecoder()
  private var currentPath: String = ""

  init() {
    load()
  }

  func handle(message: AttributeValue) {
    guard let message = message.dict?[.custom("message")]?.dict else {
      print("Could not find a message in: \(message)")
      return
    }
    print("handling message: \(message)")
    if let path = message[.custom("path")]?.string {
      load(path: path)
    }
  }

  func reload() {
    load(path: currentPath)
  }

  func load(path: String = "") {
    guard let url = URL(string: baseURL + path) else {
      state = errorValue("Invalid url")
      return
    }
    currentPath = path
    Task {
      let update: Node
      do {
        let result = try await urlSession.data(from: url).0
        let value: SwiftUIML.Layout = try decoder.decode(SwiftUIML.Layout.self, from: result)
        update = value.resolve().addingStableIds()
      }
      catch {
        update = errorValue("Something went wrong.\nIs \(baseURL) running?")
      }
      await MainActor.run {
        self.state = update
      }
    }
  }

  private func errorValue(_ value: String) -> Node {
    VStackNode {
      TextNode("❌")
        .font(size: 40)
      TextNode("\(value)")
    }
    .multilineTextAlignment(.center)
  }

  func dismissAlert() {
    alertMessage = ""
  }
}
