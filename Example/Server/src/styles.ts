import { Attr, Color, Styles } from "swiftuiml-typescript";

/**
 * Reusable styles for the application
 * Using Geist font family with dark mode support
 * Color format: lightColor:darkColor
 */
export const styles: Styles = {
  // Page Typography
  pageTitle: [
    [Attr.font, { name: "Geist", fixedSize: 34 }],
    [Attr.fontWeight, "bold"],
    [Attr.foregroundColor, "#000000:#FFFFFF"],
  ],

  pageSubtitle: [
    [Attr.font, { name: "Geist", fixedSize: 17 }],
    [Attr.foregroundColor, "#8E8E93:#8E8E93"],
  ],

  sectionTitle: [
    [Attr.font, { name: "Geist", fixedSize: 22 }],
    [Attr.fontWeight, "semibold"],
    [Attr.foregroundColor, "#000000:#FFFFFF"],
  ],

  subhead: [
    [Attr.font, { name: "Geist", fixedSize: 15 }],
    [Attr.foregroundColor, "#8E8E93:#98989D"],
  ],

  body: [
    [Attr.font, { name: "Geist", fixedSize: 17 }],
    [Attr.foregroundColor, "#000000:#FFFFFF"],
  ],

  caption: [
    [Attr.font, { name: "Geist", fixedSize: 13 }],
    [Attr.foregroundColor, "#8E8E93:#98989D"],
  ],

  // Layout Containers
  pageContainer: [[Attr.padding, { leading: 20, trailing: 20, top: 20, bottom: 40 }]],

  headerContainer: [[Attr.padding, { bottom: 16 }]],

  section: [[Attr.padding, { top: 8, bottom: 8 }]],

  card: [
    [Attr.padding, 16],
    [Attr.background, Color("#FFFFFF:#1C1C1E")],
    [Attr.cornerRadius, 12],
    [Attr.shadow, { radius: 8, x: 0, y: 2, color: "#00000008:#FFFFFF08" }],
  ],

  // Navigation Buttons
  navButton: [
    [Attr.padding, { leading: 16, trailing: 16, top: 14, bottom: 14 }],
    [Attr.background, Color("#FFFFFF:#2C2C2E")],
    [Attr.cornerRadius, 12],
    [Attr.shadow, { radius: 4, x: 0, y: 1, color: "#00000006:#FFFFFF06" }],
  ],

  navButtonContent: [[Attr.frame, { maxWidth: Infinity }]],

  navButtonText: [
    [Attr.font, { name: "Geist", fixedSize: 17 }],
    [Attr.foregroundColor, "#000000:#FFFFFF"],
  ],

  chevron: [
    [Attr.font, { fixedSize: 14 }],
    [Attr.fontWeight, "semibold"],
    [Attr.foregroundColor, "#C7C7CC:#48484A"],
  ],

  // Action Buttons
  primaryButton: [
    [Attr.padding, { leading: 24, trailing: 24, top: 14, bottom: 14 }],
    [Attr.background, Color("#007AFF:#0A84FF")],
    [Attr.foregroundColor, "#FFFFFF:#FFFFFF"],
    [Attr.tint, "#FFFFFF:#FFFFFF"],
    [Attr.cornerRadius, 12],
    [Attr.font, { name: "Geist", fixedSize: 17 }],
    [Attr.fontWeight, "semibold"],
    [Attr.shadow, { radius: 8, x: 0, y: 4, color: "#007AFF30:#0A84FF30" }],
  ],

  secondaryButton: [
    [Attr.padding, { leading: 24, trailing: 24, top: 14, bottom: 14 }],
    [Attr.background, Color("#F5F5F7:#2C2C2E")],
    [Attr.foregroundColor, "#000000:#FFFFFF"],
    [Attr.tint, "#000000:#FFFFFF"],
    [Attr.cornerRadius, 12],
    [Attr.font, { name: "Geist", fixedSize: 17 }],
    [Attr.fontWeight, "medium"],
  ],
};
