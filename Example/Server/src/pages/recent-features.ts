import {
  VStack,
  HStack,
  Text,
  Button,
  Layout,
  Divider,
  Menu,
  Label,
  Link,
  ShareLink,
  EmptyView,
  List,
  Section,
  ProgressView,
} from "swiftuiml-typescript";
import { Header, Page, Card, Subhead } from "../components";
import { styles } from "../styles";

export function recentFeaturesDemo() {
  const layout = new Layout(
    styles,
    Page([
      Header("Recent Features", "Showcase of recently added components and modifiers"),

      VStack(24, "leading", [

      // Menu
      Text("Menu").font("title").fontWeight("semibold"),
      Text("Dropdown menu with actions").font("subheadline").foregroundColor("#666666"),
      HStack(16, "center", [
        Menu(
          "Options",
          Button("Action 1", { action: "menu1" }),
          Button("Action 2", { action: "menu2" }),
          Button("Action 3", { action: "menu3" }),
        ),
        Menu(
          Label("Settings", "gear"),
          Button("Profile", { action: "profile" }),
          Button("Preferences", { action: "prefs" }),
          Divider(),
          Button("Logout", { action: "logout" }),
        ),
      ]).padding(12).backgroundColor("#F5F5F5").cornerRadius(8),

      Divider(),

      // Label
      Text("Label").font("title").fontWeight("semibold"),
      Text("Text with SF Symbol icons").font("subheadline").foregroundColor("#666666"),
      VStack(8, "leading", [
        Label("Home", "house"),
        Label("Messages", "message.fill"),
        Label("Settings", "gear"),
      ]).padding(12).backgroundColor("#F5F5F5").cornerRadius(8),

      Divider(),

      // Link
      Text("Link").font("title").fontWeight("semibold"),
      Text("Navigate to URLs").font("subheadline").foregroundColor("#666666"),
      VStack(8, "leading", [
        Link("Visit Apple", "https://apple.com"),
        Link("GitHub", "https://github.com"),
      ]).padding(12).backgroundColor("#F5F5F5").cornerRadius(8),

      Divider(),

      // ShareLink
      Text("ShareLink").font("title").fontWeight("semibold"),
      Text("System share sheet integration").font("subheadline").foregroundColor("#666666"),
      VStack(8, "leading", [
        ShareLink("https://apple.com"),
        ShareLink("https://apple.com", "Check this out!"),
      ]).padding(12).backgroundColor("#F5F5F5").cornerRadius(8),

      Divider(),

      // EmptyView for Spacing
      Text("EmptyView").font("title").fontWeight("semibold"),
      Text("Invisible view for custom spacing").font("subheadline").foregroundColor("#666666"),
      VStack(0, "leading", [
        Text("Section 1").font("headline"),
        EmptyView().frame(undefined, 20),
        Text("Content here"),
        EmptyView().frame(undefined, 30),
        Text("Section 2").font("headline"),
      ]).padding(12).backgroundColor("#F5F5F5").cornerRadius(8),

      Divider(),

      // Section & Group in Lists
      Text("Section & Group").font("title").fontWeight("semibold"),
      Text("Organize list content").font("subheadline").foregroundColor("#666666"),
      List([
        Section(Text("Header 1"), [Text("Item 1"), Text("Item 2")]),
        Section(Text("Header 2"), [Text("Item 3"), Text("Item 4")]),
      ]).frame(undefined, 200),

      Divider(),

      // Button Styles
      Text("Button Styles").font("title").fontWeight("semibold"),
      Text("Various button appearances").font("subheadline").foregroundColor("#666666"),
      VStack(8, "leading", [
        Button("Bordered", { action: "demo" }).buttonStyle("bordered"),
        Button("Bordered Prominent", { action: "demo" }).buttonStyle("borderedProminent"),
        Button("Borderless", { action: "demo" }).buttonStyle("borderless"),
      ]).padding(12).backgroundColor("#F5F5F5").cornerRadius(8),

      Divider(),

      // Button Border Shapes
      Text("Button Border Shapes").font("title").fontWeight("semibold"),
      Text("Customize button borders").font("subheadline").foregroundColor("#666666"),
      VStack(8, "leading", [
        Button("Capsule", { action: "demo" })
          .buttonStyle("bordered")
          .buttonBorderShape("capsule"),
        Button("Rounded", { action: "demo" })
          .buttonStyle("bordered")
          .buttonBorderShape("roundedRectangle"),
      ]).padding(12).backgroundColor("#F5F5F5").cornerRadius(8),

      Divider(),

      // ProgressView Styles
      Text("ProgressView Styles").font("title").fontWeight("semibold"),
      Text("Progress indicators").font("subheadline").foregroundColor("#666666"),
      VStack(12, "leading", [
        HStack(12, "center", [ProgressView(), Text("Circular")]),
        ProgressView().progressViewStyle("linear"),
        ProgressView("Loading", 0.7).progressViewStyle("linear"),
      ]).padding(12).backgroundColor("#F5F5F5").cornerRadius(8),

      ]),
    ]),
  );

  return layout;
}
