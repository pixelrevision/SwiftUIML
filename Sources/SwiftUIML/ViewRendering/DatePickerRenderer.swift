import SwiftUI
import SwiftUIMLCore

public struct DatePickerRenderer: ViewRenderer {
  public static let type: ViewType = .datePicker

  public static func render(node: Node, context: RenderContext, messageHandler: MessageHandler?) -> any View {
    let labelValue = node.attributes[.label]
    let initialValue = node.attributes[.value]?.string
    let onDateChange = node.attributes[.onDateChange]
    let displayedComponents = node.attributes[.displayedComponents]?.string
    let minimumDate = node.attributes[.minimumDate]?.string
    let maximumDate = node.attributes[.maximumDate]?.string

    return DatePickerView(
      labelValue: labelValue,
      initialValue: initialValue,
      onDateChange: onDateChange,
      displayedComponents: displayedComponents,
      minimumDate: minimumDate,
      maximumDate: maximumDate,
      messageHandler: messageHandler
    )
    .applyModifiers(node, context: context, handler: messageHandler)
  }
}

/// Internal view that maintains DatePicker state
private struct DatePickerView: View {
  let labelValue: AttributeValue?
  let initialValue: String?
  let onDateChange: AttributeValue?
  let displayedComponents: String?
  let minimumDate: String?
  let maximumDate: String?
  let messageHandler: MessageHandler?
  static let formatter = ISO8601DateFormatter()

  @State private var date: Date

  init(
    labelValue: AttributeValue?,
    initialValue: String?,
    onDateChange: AttributeValue?,
    displayedComponents: String?,
    minimumDate: String?,
    maximumDate: String?,
    messageHandler: MessageHandler?
  ) {
    self.labelValue = labelValue
    self.initialValue = initialValue
    self.onDateChange = onDateChange
    self.displayedComponents = displayedComponents
    self.minimumDate = minimumDate
    self.maximumDate = maximumDate
    self.messageHandler = messageHandler
    self._date = State(initialValue: Self.parseDate(initialValue) ?? Date())
  }

  var body: some View {
    Group {
      if let labelNode = labelValue?.node {
        DatePicker(selection: $date, in: dateRange, displayedComponents: components) {
          NodeView(labelNode, messageHandler: messageHandler)
        }
      }
      else if let labelString = labelValue?.string {
        DatePicker(labelString, selection: $date, in: dateRange, displayedComponents: components)
      }
      else {
        DatePicker("", selection: $date, in: dateRange, displayedComponents: components)
      }
    }
    .onChange(of: date) { oldValue, newValue in
      if let onDateChange = onDateChange, let messageHandler = messageHandler {
        let wrappedMessage = wrapMessage(onDateChange, addingToContext: [
          .value: AttributeValue(Self.formatDate(newValue)),
          .oldValue: AttributeValue(Self.formatDate(oldValue)),
        ])
        messageHandler(wrappedMessage)
      }
    }
    .onChange(of: initialValue) { _, newValue in
      // Sync with server value changes
      if let newDate = Self.parseDate(newValue) {
        if newDate != date {
          date = newDate
        }
      }
    }
  }

  /// Parses displayed components string
  private var components: DatePickerComponents {
    switch displayedComponents {
    case "date":
      return [.date]
    case "hourAndMinute":
      return [.hourAndMinute]
    case "dateAndTime":
      return [.date, .hourAndMinute]
    default:
      return [.date, .hourAndMinute]
    }
  }

  /// Creates a date range from min/max dates
  private var dateRange: ClosedRange<Date> {
    let min = Self.parseDate(minimumDate) ?? Date.distantPast
    let max = Self.parseDate(maximumDate) ?? Date.distantFuture
    return min...max
  }

  /// Parses ISO8601 date string to Date
  private static func parseDate(_ dateString: String?) -> Date? {
    guard let dateString = dateString else {
      return nil
    }
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    if let date = formatter.date(from: dateString) {
      return date
    }
    // Try without fractional seconds
    formatter.formatOptions = [.withInternetDateTime]
    return formatter.date(from: dateString)
  }

  /// Formats Date to ISO8601 string
  private static func formatDate(_ date: Date) -> String {
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    return formatter.string(from: date)
  }
}

#Preview {
  DebugView {
    DatePickerNode("Select Date")
      .minimumDate("")
      .maximumDate("")
      .displayedComponents(.date)
      .onDateChange("dateChanged")
      .padding()
  }.messageHandler { message in
    print("Message:", message)
  }
}
