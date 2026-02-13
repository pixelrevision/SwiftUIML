//
//  DatePickerTests.swift
//  SwiftUIML
//
//  DatePicker view rendering tests
//

import XCTest
@testable import SwiftUIML
@testable import SwiftUIMLCore

class DatePickerTests: XCTestCase {
  @MainActor
  func testDatePickerConfigurations() throws {
    let utcTimeZone = try XCTUnwrap(TimeZone(identifier: "UTC"))
    testNode(
      TestCase.view.datePicker.configurations,
      size: CGSize(width: 450, height: 300),
      useHostingController: true
    ) {
      FormNode {
        SectionNode {
          // Basic DatePicker with stable initial value
          DatePickerNode("Select Date", value: "2025-06-15T12:00:00Z")
            .locale(Locale(identifier: "en_US"))
            .timeZone(utcTimeZone)
            .onDateChange("dateChanged")

          // DatePicker with initial value and date-only display
          DatePickerNode("Birthday", value: "2000-01-01T00:00:00Z")
            .locale(Locale(identifier: "en_US"))
            .timeZone(utcTimeZone)
            .displayedComponents(.date)

          // DatePicker with date and time
          DatePickerNode("Appointment", value: "2025-06-15T14:00:00Z")
            .locale(Locale(identifier: "en_US"))
            .timeZone(utcTimeZone)
            .displayedComponents(.dateAndTime)
            .minimumDate("2025-01-01T00:00:00Z")
            .maximumDate("2025-12-31T23:59:59Z")
            .onDateChange([.action: "appointmentChanged"])

          // DatePicker with custom label node
          DatePickerNode(
            label: HStackNode {
              ImageNode(systemName: "calendar")
              TextNode("Event Date")
            },
            value: "2025-10-25T14:30:00Z"
          )
          .locale(Locale(identifier: "en_US"))
          .timeZone(utcTimeZone)
          .displayedComponents(.dateAndTime)
        }
      }
    }
  }
}
