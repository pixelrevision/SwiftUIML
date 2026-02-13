import {
  Attr,
  Button,
  Color,
  HStack,
  Layout,
  Styles
} from "swiftuiml-typescript";
import { Card, Header, NavTabs, Page, Section, Subhead } from "../components";
import { styles } from "../styles";

export function buttonsDemo() {
  // Page-specific button styles for better contrast
  const pageStyles: Styles = {
    ...styles,
    demoPrimary: [
      [Attr.padding, { leading: 24, trailing: 24, top: 14, bottom: 14 }],
      [Attr.background, Color("#007AFF:#0A84FF")],
      [Attr.foregroundColor, "#FFFFFF:#FFFFFF"],
      [Attr.tint, "#FFFFFF:#FFFFFF"],
      [Attr.cornerRadius, 12],
      [Attr.font, { name: "Geist", fixedSize: 17 }],
      [Attr.fontWeight, "semibold"],
    ],
    demoSecondary: [
      [Attr.padding, { leading: 24, trailing: 24, top: 14, bottom: 14 }],
      [Attr.background, Color("#F5F5F7:#2C2C2E")],
      [Attr.foregroundColor, "#000000:#FFFFFF"],
      [Attr.tint, "#000000:#FFFFFF"],
      [Attr.cornerRadius, 12],
      [Attr.font, { name: "Geist", fixedSize: 17 }],
      [Attr.fontWeight, "medium"],
    ],
  };

  const layout = new Layout(
    pageStyles,
    Page(
      [
        Header("Buttons & Actions", "Interactive elements that respond to user input"),

        Section("Button Styles", [
          Card([
            Subhead("Primary and secondary button variants"),
            Button("Primary Action", "primary")
              .style("demoPrimary"),
            Button("Secondary Action", "secondary")
              .style("demoSecondary"),
          ]),
        ]),

        Section("Button States", [
          Card([
            Button("Default Button", { action: "default" })
              .padding(12, 20, 12, 20)
              .background(Color("#007AFF:#0A84FF"))
              .foregroundColor("#FFFFFF:#FFFFFF")
              .cornerRadius(10)
              .customFont("Geist", 17),

            Button("Disabled Button", { action: "disabled" })
              .padding(12, 20, 12, 20)
              .background(Color("#E5E5EA:#3A3A3C"))
              .foregroundColor("#8E8E93:#8E8E93")
              .cornerRadius(10)
              .customFont("Geist", 17)
              .disabled(),
          ]),
        ]),

        Section("Destructive Actions", [
          Card([
            Subhead("Use red for destructive or dangerous actions"),
            Button("Delete Item", { action: "delete" })
              .padding(12, 20, 12, 20)
              .background(Color("#FF3B30:#FF453A"))
              .foregroundColor("#FFFFFF:#FFFFFF")
              .cornerRadius(10)
              .customFont("Geist", 17)
              .fontWeight("semibold"),
          ]),
        ]),

        Section("Compact Buttons", [
          Card([
            HStack(12, "center", [
              Button("Yes", { action: "yes" })
                .padding(8, 16, 8, 16)
                .background(Color("#34C759:#30D158"))
                .foregroundColor("#FFFFFF:#FFFFFF")
                .cornerRadius(8)
                .customFont("Geist", 15)
                .fontWeight("medium"),

              Button("No", { action: "no" })
                .padding(8, 16, 8, 16)
                .background(Color("#F5F5F7:#2C2C2E"))
                .foregroundColor("#000000:#FFFFFF")
                .cornerRadius(8)
                .customFont("Geist", 15)
                .fontWeight("medium"),
            ]),
          ]),
        ]),
      ],
      NavTabs("Buttons"),
    ),
  );

  return layout;
}
