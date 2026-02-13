/**
 * Section view test definitions
 * Must match Swift SectionTests.swift
 */
import { Node, List, Section, SectionWithFooter, Text } from "../../../src/index";

export function generateSectionTests(): Record<string, Node> {
  return {
    "view.section.basic": List([Section([Text("Item 1"), Text("Item 2"), Text("Item 3")])]),

    "view.section.header": List([
      Section(Text("Header"), [Text("Item 1"), Text("Item 2"), Text("Item 3")]),
    ]),

    "view.section.footer": List([
      SectionWithFooter(Text("Footer text"), [Text("Item 1"), Text("Item 2")]),
    ]),

    "view.section.header-footer": List([
      Section(Text("Section Header"), Text("Section Footer"), [
        Text("Item 1"),
        Text("Item 2"),
        Text("Item 3"),
      ]),
    ]),

    "view.section.multiple": List([
      Section(Text("First Section"), [Text("Item 1"), Text("Item 2")]),
      Section(Text("Second Section"), [Text("Item 3"), Text("Item 4")]),
    ]),
  };
}
