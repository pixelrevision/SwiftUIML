import {
  Button,
  Color,
  Divider,
  HStack,
  Node,
  ScrollView,
  Spacer,
  SystemImage,
  Text,
  VStack,
} from "swiftuiml-typescript";

/**
 * Navigation tabs bar - horizontal scrollable list of tabs
 * @param activeTab The name of the currently active tab
 */
export function NavTabs(activeTab: string): Node {
  const tabs = [
    { title: "Home", path: "/" },
    { title: "Text", path: "/text-demo" },
    { title: "Buttons", path: "/buttons-demo" },
    { title: "Layout", path: "/layout-demo" },
    { title: "Images", path: "/images-demo" },
    { title: "Shapes", path: "/shapes-demo" },
    { title: "Styles", path: "/styles-demo" },
    { title: "Messaging", path: "/messaging-demo" },
    { title: "Navigation", path: "/navigation-demo" },
  ];

  const tabNodes = tabs.map((tab) => {
    const isActive = tab.title === activeTab;
    const textColor = isActive ? "#007AFF:#0A84FF" : "#8E8E93:#8E8E93";

    return Text(tab.title)
      .customFont("Geist", 15)
      .fontWeight(isActive ? "semibold" : "regular")
      .foregroundColor(textColor)
      .padding(8, 16, 8, 16)
      .background(Color(isActive ? "#007AFF15:#0A84FF15" : "#00000000:#00000000"))
      .cornerRadius(8)
      .onTapGesture({ path: tab.path });
  });

  return VStack(12, "leading", [
    Divider(),
    ScrollView("horizontal", [HStack(8, "center", tabNodes)]),
  ]);
}

/**
 * Page header with title and optional subtitle
 */
export function Header(title: string, subtitle?: string): Node {
  const children: Node[] = [
    Text(title)
      .style("pageTitle"),
  ];

  if (subtitle) {
    children.push(
      Text(subtitle)
        .style("pageSubtitle")
    );
  }

  return VStack(8, "leading", children)
    .style("headerContainer");
}

/**
 * Section header with divider
 */
export function SectionHeader(title: string): Node {
  return VStack(12, "leading", [
    Text(title)
      .style("sectionTitle"),
    Divider(),
  ]);
}

/**
 * Subhead text for introducing content sections
 */
export function Subhead(text: string): Node {
  return Text(text)
    .style("subhead");
}

/**
 * Navigation button for page navigation
 * @param title Button title
 * @param action Action message to send (should be object with path key)
 * @param systemIcon Optional SF Symbol icon name
 */
export function NavButton(title: string, action: any, systemIcon?: string): Node {
  const children: Node[] = [];

  if (systemIcon) {
    children.push(
      SystemImage(systemIcon)
        .foregroundColor("#007AFF:#0A84FF")
    );
  }

  children.push(
    Text(title)
      .style("navButtonText")
  );

  children.push(Spacer());

  children.push(
    SystemImage("chevron.right")
      .style("chevron")
  );

  // Return HStack directly with onTapGesture instead of Button
  return HStack(12, "center", children)
    .onTapGesture(action)
    .style("navButton");
}

/**
 * Primary action button
 */
export function PrimaryButton(title: string, action: string): Node {
  return Button(title, action)
    .style("primaryButton");
}

/**
 * Secondary action button
 */
export function SecondaryButton(title: string, action: string): Node {
  return Button(title, action)
    .style("secondaryButton");
}

/**
 * Card container for grouping related content
 */
export function Card(children: Node[]): Node {
  return VStack(12, "leading", children)
    .style("card");
}

/**
 * Content section with optional header
 */
export function Section(title: string | undefined, children: Node[]): Node {
  const content: Node[] = [];

  if (title) {
    content.push(SectionHeader(title));
  }

  content.push(...children);

  return VStack(16, "leading", content)
    .style("section");
}

/**
 * Page container with standard padding and spacing wrapped in ScrollView
 * @param children Main content nodes
 * @param bottomBar Optional bottom navigation bar
 */
export function Page(children: Node[], bottomBar?: Node): Node {
  if (bottomBar) {
    return VStack(0, "leading", [
      ScrollView("vertical", [
        VStack(24, "leading", children)
          .style("pageContainer"),
      ]),
      bottomBar,
    ]);
  }

  return ScrollView("vertical", [
    VStack(24, "leading", children)
      .style("pageContainer"),
  ]);
}
