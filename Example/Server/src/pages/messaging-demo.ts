import {
  Attr,
  Button,
  Color,
  Layout,
  Styles,
  Text,
  VStack
} from "swiftuiml-typescript";
import { Card, Header, NavTabs, Page, Section, Subhead } from "../components";
import { styles } from "../styles";

export function messagingDemo() {
  // Page-specific button style for better contrast
  const pageStyles: Styles = {
    ...styles,
    demoButton: [
      [Attr.tint, "#000000:#FFFFFF"],
      [Attr.font, { name: "Geist", fixedSize: 17 }],
      [Attr.fontWeight, "semibold"],
    ],
  };

  const layout = new Layout(
    pageStyles,
    Page(
      [
        Header(
          "Messaging System",
          "Messages are just data - your app decides how to handle them. This demo implements navigation and alerts as examples.",
        ),

        Section("Basic Messages", [
          Card([
            Subhead("Any user interaction can send arbitrary data to your application"),
            VStack(12, "leading", [
              Text("Tap this button to send a simple message")
                .customFont("Geist", 15),
              Button("Simple Action", "simple")
                .style("demoButton"),
            ]),
          ]),
        ]),

        Section("Navigation (Demo Implementation)", [
          Card([
            Subhead("This demo app handles messages with 'path' by navigating to that route"),
            VStack(12, "leading", [
              Text("Your app can handle path messages however you want")
                .customFont("Geist", 15),
              Button("Go Home", { path: "/" })
                .style("demoButton"),
            ]),
          ]),
        ]),

        Section("Arbitrary Data", [
          Card([
            Subhead("Messages can be any JSON-serializable structure your app needs"),
            VStack(12, "leading", [
              Text("Mix multiple fields, nest objects, pass arrays - anything goes")
                .customFont("Geist", 15),
              Button("Send Complex", {
                action: "complex",
                data: { id: 123, type: "demo" },
                alert: "Sent complex message with action and data",
              })
                .style("demoButton"),
            ]),
          ]),
        ]),

        Section("Message Queue", [
          Card([
            Subhead("Server can send messages to specific components using MessageQueue"),
            VStack(12, "leading", [
              Text("Components listen with .onMessage(nodeId:)")
                .customFont("Geist", 15),
              Text("Host sends via messageQueue.send()")
                .customFont("Geist", 15)
                .style("caption"),
              Text("Messages are filtered by nodeId automatically")
                .customFont("Geist", 15)
                .style("caption"),
            ]),
          ]),
        ]),

        Section("Node Context", [
          Card([
            Subhead("All messages automatically include the node ID that triggered them"),
            VStack(12, "leading", [
              Text("Message structure:")
                .customFont("Geist", 15)
                .fontWeight("semibold"),
              Text('{ "nodeId": "Button.0", "message": {...} }')
                .customFont("Geist", 13)
                .foregroundColor("#5856D6:#5E5CE6")
                .padding(12)
                .background(Color("#F5F5F7:#2C2C2E"))
                .cornerRadius(8),
            ]),
          ]),
        ]),
      ],
      NavTabs("Messaging"),
    ),
  );

  return layout;
}
