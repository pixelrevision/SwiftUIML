import SwiftUI
import SwiftUIMLCore
struct CopyLogView: View {
  let value: String

  var body: some View {
    HStack {
      Spacer()
      Button("💾 Copy") {
        UIPasteboard.general.string = value
      }
      Spacer()
      Button("📋 Log") {
        print(value)
      }
      Spacer()
    }
    .font(.system(size: 12))
  }
}
