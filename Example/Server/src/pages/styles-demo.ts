import {
  Color,
  HStack,
  Layout,
  Rectangle,
  Text,
  VStack,
  w,
  wLessThan,
} from "swiftuiml-typescript";
import { Card, Header, NavTabs, Page, Section, Subhead } from "../components";
import { styles } from "../styles";

export function stylesDemo() {
  const layout = new Layout(
    styles,
    Page(
      [
        Header("Styles & Layouts", "Reusable styles, breakpoints, and color scheme handling"),

        Section("Layout System", [
          Card([
            Subhead("Define reusable styles in a Layout and apply them with .style()"),
            VStack(12, "leading", [
              Text("This text uses the 'body' style")
                .style("body"),
              Text("This uses 'caption' style")
                .style("caption"),
              Text("This uses 'pageTitle' style")
                .style("pageTitle"),
            ]),
          ]),
        ]),

        Section("Style Inheritance", [
          Card([
            Subhead("Styles can inherit from other styles using the 'inherit' key"),
            VStack(12, "leading", [
              Text("Styles can reference other styles"),
              Text("This creates a design system hierarchy"),
              Text("Changes cascade through the tree"),
            ]).style("body"),
          ]),
        ]),

        Section("Responsive Breakpoints", [
          Card([
            Subhead("Adapt layouts based on screen size using responsive attributes"),
            VStack(16, "leading", [
              Text("Compact: < 768px")
                .customFont("Geist", 14)
                .responsive(
                  new Map([
                    [wLessThan(768), { font: { name: "Geist", fixedSize: 14 } }],
                    [w(768), { font: { name: "Geist", fixedSize: 17 } }],
                    [w(1024), { font: { name: "Geist", fixedSize: 20 } }],
                  ]),
                ),
              Text("Regular: 768px - 1024px")
                .customFont("Geist", 14)
                .responsive(
                  new Map([
                    [wLessThan(768), { font: { name: "Geist", fixedSize: 14 } }],
                    [w(768), { font: { name: "Geist", fixedSize: 17 } }],
                    [w(1024), { font: { name: "Geist", fixedSize: 20 } }],
                  ]),
                ),
              Text("Large: > 1024px")
                .customFont("Geist", 14)
                .responsive(
                  new Map([
                    [wLessThan(768), { font: { name: "Geist", fixedSize: 14 } }],
                    [w(768), { font: { name: "Geist", fixedSize: 17 } }],
                    [w(1024), { font: { name: "Geist", fixedSize: 20 } }],
                  ]),
                ),
            ]),
          ]),
        ]),

        Section("Color Scheme Switching", [
          Card([
            Subhead("Use colon-separated colors for automatic light/dark mode support"),
            VStack(16, "leading", [
              Text("Light:Dark format")
                .customFont("Geist", 15)
                .foregroundColor("#8E8E93:#8E8E93"),
              HStack(12, "center", [
                Rectangle()
                  .fill("#FF0000:#0000FF")
                  .frame(60, 40)
                  .cornerRadius(8),
                VStack(4, "leading", [
                  Text("#FF0000:#0000FF")
                    .customFont("Geist", 13)
                    .style("caption"),
                  Text("Light mode:Dark mode")
                    .customFont("Geist", 11)
                    .style("caption"),
                ]),
              ]),
            ]),
          ]),
        ]),

        Section("Color Scheme Conditionals", [
          Card([
            Subhead("Apply different attributes based on the active color scheme"),
            VStack(12, "leading", [
              Text("This text changes based on color scheme").colorSchemeConditional({
                light: { foregroundColor: "#007AFF", fontWeight: "regular" },
                dark: { foregroundColor: "#0A84FF", fontWeight: "bold" },
              }),
            ]),
          ]),
        ]),

        Section("Dynamic Padding", [
          Card([
            Subhead("Adjust spacing and padding based on screen size"),
            VStack(0, "leading", [
              Text("Compact padding")
                .padding(8)
                .background(Color("#F5F5F7:#2C2C2E"))
                .cornerRadius(8)
                .responsive(
                  new Map([
                    [wLessThan(768), { padding: 8 }],
                    [w(768), { padding: 16 }],
                    [w(1024), { padding: 24 }],
                  ]),
                ),
            ]),
          ]),
        ]),
      ],
      NavTabs("Styles"),
    ),
  );

  return layout;
}
