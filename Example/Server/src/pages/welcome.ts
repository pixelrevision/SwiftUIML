import { Layout } from "swiftuiml-typescript";
import { Header, NavButton, Page, Section, Subhead } from "../components";
import { styles } from "../styles";

export function welcome() {
  const layout = new Layout(
    styles,
    Page([
      Header(
        "Welcome to SwiftUIML",
        "A declarative UI framework for building native iOS interfaces from the server",
      ),

      Subhead("Explore the capabilities of SwiftUIML by browsing through interactive examples."),

      Section("View Types", [
        NavButton("Text & Typography", { path: "/text-demo", target: "sheet" }, "textformat"),
        NavButton("Buttons & Actions", { path: "/buttons-demo" }, "hand.tap"),
        NavButton("Layout Containers", { path: "/layout-demo" }, "rectangle.stack"),
        NavButton("Images & Media", { path: "/images-demo" }, "photo"),
        NavButton("Shapes & Graphics", { path: "/shapes-demo" }, "circle"),
      ]),

      Section("Advanced Features", [
        NavButton("Navigation", { path: "/navigation-demo" }, "arrow.up.forward.square"),
        NavButton("Styles & Layouts", { path: "/styles-demo" }, "paintbrush"),
        NavButton("Messaging System", { path: "/messaging-demo" }, "arrow.left.arrow.right"),
        NavButton("Recent Features", { path: "/recent-features" }, "sparkles"),
      ]),
    ]),
  );

  return layout;
}
