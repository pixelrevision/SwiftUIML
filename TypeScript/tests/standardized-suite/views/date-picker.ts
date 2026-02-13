/**
 * DatePicker view test definitions
 * Must match Swift DatePickerTests.swift
 */
import { Node, Form, Section, DatePicker, HStack, ImageSystemName, Text } from "../../../src/index";

export function generateDatePickerTests(): Record<string, Node> {
  return {
    "view.date-picker.configurations": Form([
      Section([
        // Basic DatePicker with stable initial value
        DatePicker("Select Date", "2025-06-15T12:00:00Z")
          .locale("en_US")
          .timeZone("GMT")
          .onDateChange("dateChanged"),

        // DatePicker with initial value and date-only display
        DatePicker("Birthday", "2000-01-01T00:00:00Z")
          .locale("en_US")
          .timeZone("GMT")
          .displayedComponents("date"),

        // DatePicker with date and time
        DatePicker("Appointment", "2025-06-15T14:00:00Z")
          .locale("en_US")
          .timeZone("GMT")
          .displayedComponents("dateAndTime")
          .minimumDate("2025-01-01T00:00:00Z")
          .maximumDate("2025-12-31T23:59:59Z")
          .onDateChange({ action: "appointmentChanged" }),

        // DatePicker with custom label node
        DatePicker(
          {
            label: HStack(undefined, undefined, [ImageSystemName("calendar"), Text("Event Date")]),
          },
          "2025-10-25T14:30:00Z",
        )
          .locale("en_US")
          .timeZone("GMT")
          .displayedComponents("dateAndTime"),
      ]),
    ]),
  };
}
