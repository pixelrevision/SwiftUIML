import { Layout, Text } from "swiftuiml-typescript";
import { Card, Header, NavTabs, Page, Section, Subhead } from "../components";
import { styles } from "../styles";

export function textDemo() {
  const layout = new Layout(
    styles,
    Page(
      [
        Header(
          "Text & Typography",
          "SwiftUIML supports all native SwiftUI text styles and formatting",
        ),

        Section("Font Styles", [
          Card([
            Text("Large Title")
              .font("largeTitle"),
            Text("Title")
              .font("title"),
            Text("Title 2")
              .font("title2"),
            Text("Title 3")
              .font("title3"),
            Text("Headline")
              .font("headline"),
            Text("Body")
              .font("body"),
            Text("Callout")
              .font("callout"),
            Text("Subheadline")
              .font("subheadline"),
            Text("Footnote")
              .font("footnote"),
            Text("Caption")
              .font("caption"),
            Text("Caption 2")
              .font("caption2"),
          ]),
        ]),

        Section("Font Weights", [
          Card([
            Text("Ultralight")
              .fontWeight("ultraLight"),
            Text("Thin")
              .fontWeight("thin"),
            Text("Light")
              .fontWeight("light"),
            Text("Regular")
              .fontWeight("regular"),
            Text("Medium")
              .fontWeight("medium"),
            Text("Semibold")
              .fontWeight("semibold"),
            Text("Bold")
              .fontWeight("bold"),
            Text("Heavy")
              .fontWeight("heavy"),
            Text("Black")
              .fontWeight("black"),
          ]),
        ]),

        Section("Text Modifiers", [
          Card([
            Text("Bold Text")
              .bold(),
            Text("Italic Text")
              .italic(),
            Text("Underlined Text")
              .addingAttribute("underline", true),
            Text("Strikethrough Text")
              .addingAttribute("strikethrough", true),
            Text("Colored Text")
              .foregroundColor("#007AFF"),
          ]),
        ]),

        Section("Custom Fonts", [
          Card([
            Subhead("Using the Geist font family"),
            Text("Geist Regular 17pt")
              .customFont("Geist", 17),
            Text("Geist Medium 20pt")
              .customFont("Geist", 20)
              .fontWeight("medium"),
            Text("Geist Bold 24pt")
              .customFont("Geist", 24)
              .fontWeight("bold"),
          ]),
        ]),

        Section("Multiline Text", [
          Card([
            Text(
              "This is a longer piece of text that demonstrates how SwiftUIML handles multiline text content. The text will automatically wrap to fit the available width and can span multiple lines as needed.",
            ),
            Text(
              "This text is limited to 2 lines and will truncate with an ellipsis if it's too long to fit within the specified line limit.",
            )
              .lineLimit(2)
              .foregroundColor("#8E8E93:#98989D"),
          ]),
        ]),
      ],
      NavTabs("Text"),
    ),
  );

  return layout;
}
