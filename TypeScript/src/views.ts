// View builder functions that create configured nodes
import { Node, AttrValue, Attributes } from "./node";
import { ViewType } from "./view-type";
import { AttributeKey } from "./attribute-key";
import type { Alignment, HorizontalAlignment, VerticalAlignment, Axis } from "./unions";

// ============================================================================
// Core Views
// ============================================================================

/**
 * Creates a text node
 */
export function Text(text: string): Node {
  return new Node(ViewType.text, [[AttributeKey.text, text]]);
}

/**
 * Creates a text node with markdown
 */
export function TextMarkdown(markdown: string): Node {
  return new Node(ViewType.text, [[AttributeKey.markdown, markdown]]);
}

/**
 * Creates a button node with AttributeValue for maximum flexibility
 */
export function Button(title: string, onTap: AttrValue): Node {
  return new Node(ViewType.button, [
    [AttributeKey.title, title],
    [AttributeKey.onTap, onTap],
  ]);
}

/**
 * Creates a text field node
 * Use .onTextChange(), .onSubmit(), .onFocus(), and .onBlur() modifiers for event handling
 */
export function TextField(placeholder: string, value?: string): Node {
  const attrs: Attributes = [[AttributeKey.placeholder, placeholder]];
  if (value !== undefined) {
    attrs.push([AttributeKey.value, value]);
  }
  return new Node(ViewType.textField, attrs);
}

/**
 * Creates a multi-line text editor node
 * Use .onTextChange(), .onFocus(), and .onBlur() modifiers for event handling
 */
export function TextEditor(value?: string): Node {
  const attrs: Attributes = [];
  if (value !== undefined) {
    attrs.push([AttributeKey.value, value]);
  }
  return new Node(ViewType.textEditor, attrs);
}

/**
 * Creates a secure field node (password input)
 * Use .onTextChange(), .onSubmit(), .onFocus(), and .onBlur() modifiers for event handling
 */
export function SecureField(placeholder: string, value?: string): Node {
  const attrs: Attributes = [[AttributeKey.placeholder, placeholder]];
  if (value !== undefined) {
    attrs.push([AttributeKey.value, value]);
  }
  return new Node(ViewType.secureField, attrs);
}

/**
 * Creates a toggle node
 * Use .onToggle() modifier for event handling
 */
export function Toggle(label: string, isOn: boolean = false): Node {
  return new Node(ViewType.toggle, [
    [AttributeKey.label, label],
    [AttributeKey.isOn, isOn],
  ]);
}

/**
 * Creates a slider node
 * Use .onSliderChange() modifier for event handling
 */
export function Slider(
  value: number = 0.5,
  minimumValue: number = 0.0,
  maximumValue: number = 1.0,
  step?: number,
): Node {
  const attrs: Attributes = [
    [AttributeKey.value, value],
    [AttributeKey.minimumValue, minimumValue],
    [AttributeKey.maximumValue, maximumValue],
  ];
  if (step !== undefined) {
    attrs.push([AttributeKey.step, step]);
  }
  return new Node(ViewType.slider, attrs);
}

/**
 * Creates a stepper node
 * Use .onStepperChange() modifier for event handling
 */
export function Stepper(
  label: string,
  value: number = 0,
  minimumValue: number = 0,
  maximumValue: number = 100,
  step: number = 1,
): Node {
  const attrs: Attributes = [
    [AttributeKey.label, label],
    [AttributeKey.value, value],
    [AttributeKey.minimumValue, minimumValue],
    [AttributeKey.maximumValue, maximumValue],
    [AttributeKey.step, step],
  ];
  return new Node(ViewType.stepper, attrs);
}

/**
 * Creates a picker with selection options
 * Children should use .tag() modifier to identify selections
 */
export function Picker(label: string, children: Node[], selection?: string): Node {
  const attrs: Attributes = [[AttributeKey.label, label]];
  if (selection !== undefined) {
    attrs.push([AttributeKey.selection, selection]);
  }
  return new Node(ViewType.picker, attrs, children);
}

/**
 * Creates a DatePicker node with a string label
 */
export function DatePicker(label: string, value?: Date | string): Node;
/**
 * Creates a DatePicker node with a custom label node
 */
export function DatePicker(options: { label: Node }, value?: Date | string): Node;
export function DatePicker(labelOrOptions: string | { label: Node }, value?: Date | string): Node {
  const attrs: Attributes = [];

  // Handle label (string or node)
  if (typeof labelOrOptions === "string") {
    attrs.push([AttributeKey.label, labelOrOptions]);
  } else {
    attrs.push([AttributeKey.label, labelOrOptions.label]);
  }

  // Handle value (Date object or ISO8601 string)
  if (value !== undefined) {
    const dateString = value instanceof Date ? value.toISOString() : value;
    attrs.push([AttributeKey.value, dateString]);
  }

  return new Node(ViewType.datePicker, attrs);
}

/**
 * Creates a ColorPicker node
 * Use .onColorChange() modifier for event handling
 * @param label - The label for the color picker
 * @param value - Optional hex color value (e.g., "#FF0000" or "#FF0000FF" with alpha)
 */
export function ColorPicker(label: string, value?: string): Node {
  const attrs: Attributes = [[AttributeKey.label, label]];
  if (value !== undefined) {
    attrs.push([AttributeKey.value, value]);
  }
  return new Node(ViewType.colorPicker, attrs);
}

/**
 * Creates a link node with a text label
 */
export function Link(title: string, url: string): Node;
/**
 * Creates a link node with custom content
 */
export function Link(url: string, children: Node[]): Node;
export function Link(titleOrUrl: string, urlOrChildren: string | Node[]): Node {
  // Overload 1: Link(title, url)
  if (typeof urlOrChildren === "string") {
    return new Node(ViewType.link, [
      [AttributeKey.title, titleOrUrl],
      [AttributeKey.url, urlOrChildren],
    ]);
  }

  // Overload 2: Link(url, children)
  return new Node(ViewType.link, [[AttributeKey.url, titleOrUrl]], urlOrChildren);
}

/**
 * Creates a label node with a title and system image icon
 */
export function Label(title: string, systemImage: string): Node {
  return new Node(ViewType.label, [
    [AttributeKey.title, title],
    [AttributeKey.systemName, systemImage],
  ]);
}

/**
 * Creates a share link node with just a URL
 */
export function ShareLink(url: string): Node;
/**
 * Creates a share link node with a title and URL
 */
export function ShareLink(title: string, url: string): Node;
export function ShareLink(titleOrUrl: string, url?: string): Node {
  // Overload 1: ShareLink(url)
  if (url === undefined) {
    return new Node(ViewType.shareLink, [[AttributeKey.url, titleOrUrl]]);
  }

  // Overload 2: ShareLink(title, url)
  return new Node(ViewType.shareLink, [
    [AttributeKey.title, titleOrUrl],
    [AttributeKey.url, url],
  ]);
}

/**
 * Creates a spacer node that expands to fill available space
 */
export function Spacer(): Node {
  return new Node(ViewType.spacer);
}

/**
 * Creates a divider node
 */
export function Divider(): Node {
  return new Node(ViewType.divider);
}

/**
 * Creates an indeterminate progress view (spinning indicator)
 */
export function ProgressView(label?: string): Node;
/**
 * Creates a determinate progress view with a progress bar
 */
export function ProgressView(label: string | undefined, value: number, total?: number): Node;
export function ProgressView(label?: string, value?: number, total: number = 1.0): Node {
  const attributes: Attributes = [];
  if (label !== undefined) {
    attributes.push([AttributeKey.label, label]);
  }
  if (value !== undefined) {
    attributes.push([AttributeKey.value, value]);
    attributes.push([AttributeKey.total, total]);
  }
  return new Node(ViewType.progressView, attributes);
}

/**
 * Creates a gauge view that displays a value within a range
 */
export function Gauge(
  label: string | Node,
  value: number,
  minimumValue: number = 0,
  maximumValue: number = 1,
): Node {
  const labelValue = typeof label === "string" ? Text(label) : label;
  return new Node(ViewType.gauge, [
    [AttributeKey.label, labelValue],
    [AttributeKey.value, value],
    [AttributeKey.minimumValue, minimumValue],
    [AttributeKey.maximumValue, maximumValue],
  ]);
}

/**
 * Creates an empty view node that renders nothing
 */
export function EmptyView(): Node {
  return new Node(ViewType.emptyView);
}

/**
 * Creates a menu with a text label and menu items
 */
export function Menu(label: string, ...menuItems: Node[]): Node;
/**
 * Creates a menu with a custom node as the label and menu items
 */
export function Menu(label: Node, ...menuItems: Node[]): Node;
export function Menu(label: string | Node, ...menuItems: Node[]): Node {
  if (typeof label === "string") {
    // Text label variant
    return new Node(ViewType.menu, [[AttributeKey.label, label]], menuItems);
  } else {
    // Node label variant - label is stored as a node attribute
    return new Node(
      ViewType.menu,
      [[AttributeKey.label, { $type: "node", value: label }]],
      menuItems,
    );
  }
}

// ============================================================================
// Container Views
// ============================================================================

/**
 * Creates a vertical stack node
 */
export function VStack(
  spacing?: number,
  alignment: HorizontalAlignment = "center",
  children: Node[] = [],
): Node {
  const attributes: Attributes = [[AttributeKey.alignment, alignment]];
  if (spacing !== undefined) {
    attributes.push([AttributeKey.spacing, spacing]);
  }
  return new Node(ViewType.vStack, attributes, children);
}

/**
 * Creates a horizontal stack node
 */
export function HStack(
  spacing?: number,
  alignment: VerticalAlignment = "center",
  children: Node[] = [],
): Node {
  const attributes: Attributes = [[AttributeKey.alignment, alignment]];
  if (spacing !== undefined) {
    attributes.push([AttributeKey.spacing, spacing]);
  }
  return new Node(ViewType.hStack, attributes, children);
}

/**
 * Creates a Z stack node (overlapping views)
 */
export function ZStack(alignment: Alignment = "center", children: Node[] = []): Node {
  return new Node(ViewType.zStack, [[AttributeKey.alignment, alignment]], children);
}

/**
 * Creates a lazy vertical stack node
 */
export function LazyVStack(
  spacing?: number,
  alignment: HorizontalAlignment = "center",
  children: Node[] = [],
): Node {
  const attributes: Attributes = [[AttributeKey.alignment, alignment]];
  if (spacing !== undefined) {
    attributes.push([AttributeKey.spacing, spacing]);
  }
  return new Node(ViewType.lazyVStack, attributes, children);
}

/**
 * Creates a lazy horizontal stack node
 */
export function LazyHStack(
  spacing?: number,
  alignment: VerticalAlignment = "center",
  children: Node[] = [],
): Node {
  const attributes: Attributes = [[AttributeKey.alignment, alignment]];
  if (spacing !== undefined) {
    attributes.push([AttributeKey.spacing, spacing]);
  }
  return new Node(ViewType.lazyHStack, attributes, children);
}

/**
 * Creates a scroll view node
 */
export function ScrollView(axis: Axis = "vertical", children: Node[] = []): Node {
  return new Node(ViewType.scrollView, [[AttributeKey.axis, axis]], children);
}

/**
 * Creates a lazy vertical grid node
 */
export function LazyVGrid(
  columns: number,
  alignment: HorizontalAlignment = "center",
  spacing?: number,
  children: Node[] = [],
): Node {
  const attributes: Attributes = [
    [AttributeKey.columns, columns],
    [AttributeKey.alignment, alignment],
  ];
  if (spacing !== undefined) {
    attributes.push([AttributeKey.spacing, spacing]);
  }
  return new Node(ViewType.lazyVGrid, attributes, children);
}

/**
 * Creates a lazy horizontal grid node
 */
export function LazyHGrid(
  rows: number,
  alignment: VerticalAlignment = "center",
  spacing?: number,
  children: Node[] = [],
): Node {
  const attributes: Attributes = [
    [AttributeKey.rows, rows],
    [AttributeKey.alignment, alignment],
  ];
  if (spacing !== undefined) {
    attributes.push([AttributeKey.spacing, spacing]);
  }
  return new Node(ViewType.lazyHGrid, attributes, children);
}

/**
 * Creates a list node
 */
export function List(children: Node[] = []): Node {
  return new Node(ViewType.list, [], children);
}

/**
 * Creates a form node (displays labels for pickers and provides platform-appropriate styling)
 */
export function Form(children: Node[] = []): Node {
  return new Node(ViewType.form, [], children);
}

/**
 * Creates a disclosure group node (collapsible/expandable section)
 */
export function DisclosureGroup(label: string, children: Node[] = [], isExpanded?: boolean): Node {
  const attrs: Attributes = [[AttributeKey.label, label]];
  if (isExpanded !== undefined) {
    attrs.push([AttributeKey.isExpanded, isExpanded]);
  }
  return new Node(ViewType.disclosureGroup, attrs, children);
}

/**
 * Creates a group node (groups content without visual styling)
 */
export function Group(children: Node[] = []): Node {
  return new Node(ViewType.group, [], children);
}

/**
 * Creates a group box node (labeled container with styled background)
 */
export function GroupBox(children?: Node[]): Node;
export function GroupBox(label: string, children: Node[]): Node;
export function GroupBox(options: { label: Node }, children: Node[]): Node;
export function GroupBox(
  labelOrOptionsOrChildren?: string | { label: Node } | Node[],
  children?: Node[],
): Node {
  // Overload 1: GroupBox(children)
  if (Array.isArray(labelOrOptionsOrChildren)) {
    return new Node(ViewType.groupBox, [], labelOrOptionsOrChildren);
  }

  // Overload 2: GroupBox(label, children)
  if (typeof labelOrOptionsOrChildren === "string") {
    return new Node(
      ViewType.groupBox,
      [[AttributeKey.label, labelOrOptionsOrChildren]],
      children || [],
    );
  }

  // Overload 3: GroupBox({ label: Node }, children)
  if (labelOrOptionsOrChildren && "label" in labelOrOptionsOrChildren) {
    return new Node(
      ViewType.groupBox,
      [[AttributeKey.label, labelOrOptionsOrChildren.label]],
      children || [],
    );
  }

  // Default: No label, no children
  return new Node(ViewType.groupBox, [], []);
}

/**
 * Creates a control group node (groups related controls with unified appearance)
 */
export function ControlGroup(children: Node[] = []): Node {
  return new Node(ViewType.controlGroup, [], children);
}

/**
 * Creates a section node (typically used in Lists)
 */
export function Section(children?: Node[]): Node;
export function Section(header: Node | undefined, children: Node[]): Node;
export function Section(header: Node | undefined, footer: Node | undefined, children: Node[]): Node;
export function Section(
  headerOrChildren?: Node | Node[],
  footerOrChildren?: Node | Node[],
  children?: Node[],
): Node {
  // Overload 1: Section(children)
  if (Array.isArray(headerOrChildren)) {
    return new Node(ViewType.section, [], headerOrChildren);
  }

  // Overload 2: Section(header, children)
  if (headerOrChildren && Array.isArray(footerOrChildren)) {
    return new Node(ViewType.section, [[AttributeKey.header, headerOrChildren]], footerOrChildren);
  }

  // Overload 3: Section(header, footer, children)
  if (headerOrChildren && footerOrChildren && children) {
    return new Node(
      ViewType.section,
      [
        [AttributeKey.header, headerOrChildren],
        [AttributeKey.footer, footerOrChildren],
      ],
      children,
    );
  }

  // Default: empty section
  return new Node(ViewType.section, [], []);
}

/**
 * Creates a section node with only a footer
 */
export function SectionWithFooter(footer: Node, children: Node[]): Node {
  return new Node(ViewType.section, [[AttributeKey.footer, footer]], children);
}

/**
 * Creates a grid node
 */
export function Grid(
  alignment?: Alignment,
  horizontalSpacing?: number,
  verticalSpacing?: number,
  children: Node[] = [],
): Node {
  const attributes: Attributes = [];
  attributes.push([AttributeKey.alignment, alignment ?? "center"]);
  if (horizontalSpacing !== undefined) {
    attributes.push([AttributeKey.horizontalSpacing, horizontalSpacing]);
  }
  if (verticalSpacing !== undefined) {
    attributes.push([AttributeKey.verticalSpacing, verticalSpacing]);
  }
  return new Node(ViewType.grid, attributes, children);
}

/**
 * Creates a grid row node
 */
export function GridRow(alignment?: VerticalAlignment, children: Node[] = []): Node {
  const attributes: Attributes = [];
  attributes.push([AttributeKey.alignment, alignment ?? "center"]);
  return new Node(ViewType.gridRow, attributes, children);
}

/**
 * Creates a tab view node
 */
export function TabView(children: Node[] = []): Node {
  return new Node(ViewType.tabView, [], children);
}

/**
 * Creates a view that fits node
 */
export function ViewThatFits(children: Node[] = []): Node {
  return new Node(ViewType.viewThatFits, [], children);
}

/**
 * Creates a navigation stack container
 */
export function NavigationStack(children: Node[] = []): Node {
  return new Node(ViewType.navigationStack, [], children);
}

/**
 * Creates a navigation link
 */
export function NavigationLink(value: string, label: string | Node | Node[]): Node {
  const attributes: Attributes = [[AttributeKey.value, value]];

  // Handle text label
  if (typeof label === "string") {
    return new Node(ViewType.navigationLink, attributes, [Text(label)]);
  }

  // Handle single node
  if (!Array.isArray(label)) {
    return new Node(ViewType.navigationLink, attributes, [label]);
  }

  // Handle array of nodes
  return new Node(ViewType.navigationLink, attributes, label);
}

/**
 * Creates a web view node from a URL
 */
export function WebView(url: string, html?: string): Node {
  const attributes: Attributes = [[AttributeKey.url, url]];
  if (html !== undefined) {
    attributes.push([AttributeKey.html, html]);
  }
  return new Node(ViewType.webView, attributes);
}

// ============================================================================
// Images and Colors
// ============================================================================

/**
 * Creates an image node from a named asset
 */
export function Image(name: string, bundle?: string): Node {
  const attributes: Attributes = [[AttributeKey.Name, name]];
  if (bundle) {
    attributes.push([AttributeKey.bundle, bundle]);
  }
  return new Node(ViewType.image, attributes);
}

/**
 * Creates an image node from an SF Symbol
 */
export function SystemImage(systemName: string): Node {
  return new Node(ViewType.image, [[AttributeKey.systemName, systemName]]);
}

/**
 * @deprecated Use SystemImage instead
 * Creates an image node from an SF Symbol
 */
export function ImageSystemName(systemName: string): Node {
  return SystemImage(systemName);
}

/**
 * Creates an async image node
 */
export function AsyncImage(url: string, children?: Node[]): Node {
  return new Node(ViewType.asyncImage, [[AttributeKey.url, url]], children);
}

/**
 * Creates an async image empty placeholder node
 */
export function AsyncImageEmpty(children: Node[]): Node {
  // Wrap multiple children in VStack like Swift does
  const wrappedChildren =
    children.length === 1 ? children : [new Node(ViewType.vStack, [], children)];
  return new Node(ViewType.asyncImageEmpty, [], wrappedChildren);
}

/**
 * Creates an async image success node (for modifiers)
 */
export function AsyncImageSuccess(): Node {
  return new Node(ViewType.asyncImageSuccess);
}

/**
 * Creates an async image failure node
 */
export function AsyncImageFailure(children: Node[]): Node {
  // Wrap multiple children in VStack like Swift does
  const wrappedChildren =
    children.length === 1 ? children : [new Node(ViewType.vStack, [], children)];
  return new Node(ViewType.asyncImageFailure, [], wrappedChildren);
}

/**
 * Creates a color node
 */
export function Color(value: string): Node {
  return new Node(ViewType.color, [[AttributeKey.value, value]]);
}

export type UnitPoint =
  | "topLeading"
  | "top"
  | "topTrailing"
  | "leading"
  | "center"
  | "trailing"
  | "bottomLeading"
  | "bottom"
  | "bottomTrailing";

/**
 * Creates a linear gradient node
 */
export function LinearGradient(
  colors: string[],
  startPoint: UnitPoint = "top",
  endPoint: UnitPoint = "bottom",
): Node {
  // Convert colors array to array of AttributeValues
  const colorsArray = colors.map((c) => c as AttrValue);
  return new Node(ViewType.linearGradient, [
    [AttributeKey.colors, colorsArray],
    [AttributeKey.startPoint, startPoint],
    [AttributeKey.endPoint, endPoint],
  ]);
}

/**
 * Creates a radial gradient node
 */
export function RadialGradient(
  colors: string[],
  center: UnitPoint = "center",
  startRadius: number = 0,
  endRadius: number = 300,
): Node {
  const colorsArray = colors.map((c) => c as AttrValue);
  return new Node(ViewType.radialGradient, [
    [AttributeKey.colors, colorsArray],
    [AttributeKey.center, center],
    [AttributeKey.startRadius, startRadius],
    [AttributeKey.endRadius, endRadius],
  ]);
}

/**
 * Creates an angular gradient node
 */
export function AngularGradient(
  colors: string[],
  center: UnitPoint = "center",
  startAngle: number = 0,
  endAngle: number = 360,
): Node {
  const colorsArray = colors.map((c) => c as AttrValue);
  return new Node(ViewType.angularGradient, [
    [AttributeKey.colors, colorsArray],
    [AttributeKey.center, center],
    [AttributeKey.startAngle, startAngle],
    [AttributeKey.endAngle, endAngle],
  ]);
}

/**
 * Color stop for gradients with precise positioning
 */
export type ColorStop = { color: string; location: number };

/**
 * Creates a linear gradient node with precise color stop positions
 */
export function LinearGradientWithStops(
  colorStops: ColorStop[],
  startPoint: UnitPoint = "top",
  endPoint: UnitPoint = "bottom",
): Node {
  const stopsArray = colorStops.map(
    (stop) =>
      ({
        [AttributeKey.color.value]: stop.color,
        [AttributeKey.location.value]: stop.location,
      }) as AttrValue,
  );
  return new Node(ViewType.linearGradient, [
    [AttributeKey.colorStops, stopsArray],
    [AttributeKey.startPoint, startPoint],
    [AttributeKey.endPoint, endPoint],
  ]);
}

/**
 * Creates a radial gradient node with precise color stop positions
 */
export function RadialGradientWithStops(
  colorStops: ColorStop[],
  center: UnitPoint = "center",
  startRadius: number = 0,
  endRadius: number = 300,
): Node {
  const stopsArray = colorStops.map(
    (stop) =>
      ({
        [AttributeKey.color.value]: stop.color,
        [AttributeKey.location.value]: stop.location,
      }) as AttrValue,
  );
  return new Node(ViewType.radialGradient, [
    [AttributeKey.colorStops, stopsArray],
    [AttributeKey.center, center],
    [AttributeKey.startRadius, startRadius],
    [AttributeKey.endRadius, endRadius],
  ]);
}

/**
 * Creates an angular gradient node with precise color stop positions
 */
export function AngularGradientWithStops(
  colorStops: ColorStop[],
  center: UnitPoint = "center",
  startAngle: number = 0,
  endAngle: number = 360,
): Node {
  const stopsArray = colorStops.map(
    (stop) =>
      ({
        [AttributeKey.color.value]: stop.color,
        [AttributeKey.location.value]: stop.location,
      }) as AttrValue,
  );
  return new Node(ViewType.angularGradient, [
    [AttributeKey.colorStops, stopsArray],
    [AttributeKey.center, center],
    [AttributeKey.startAngle, startAngle],
    [AttributeKey.endAngle, endAngle],
  ]);
}

// ============================================================================
// Shapes
// ============================================================================

/**
 * Creates a circle shape node
 */
export function Circle(): Node {
  return new Node(ViewType.circle);
}

/**
 * Creates a rectangle shape node
 */
export function Rectangle(): Node {
  return new Node(ViewType.rectangle);
}

/**
 * Creates a rounded rectangle shape node
 */
export function RoundedRectangle(cornerRadius: number = 8): Node {
  return new Node(ViewType.roundedRectangle, [[AttributeKey.cornerRadius, cornerRadius]]);
}

/**
 * Creates an uneven rounded rectangle shape node with different corner radii
 */
export function UnevenRoundedRectangle(
  topLeading: number = 0,
  bottomLeading: number = 0,
  bottomTrailing: number = 0,
  topTrailing: number = 0,
): Node {
  return new Node(ViewType.unevenRoundedRectangle, [
    [AttributeKey.topLeading, topLeading],
    [AttributeKey.bottomLeading, bottomLeading],
    [AttributeKey.bottomTrailing, bottomTrailing],
    [AttributeKey.topTrailing, topTrailing],
  ]);
}

/**
 * Creates a capsule shape node
 */
export function Capsule(): Node {
  return new Node(ViewType.capsule);
}

/**
 * Creates an ellipse shape node
 */
export function Ellipse(): Node {
  return new Node(ViewType.ellipse);
}

/**
 * Creates a container-relative shape node that takes the shape of its nearest container
 */
export function ContainerRelativeShape(): Node {
  return new Node(ViewType.containerRelativeShape);
}

// ============================================================================
// Conditional Rendering
// ============================================================================

/**
 * Creates a color scheme conditional node
 * @param children - Array of nodes: [0] = light mode, [1] = dark mode
 */
export function ColorScheme(children: Node[]): Node {
  return new Node(ViewType.colorScheme, [], children);
}

/**
 * Creates a color scheme conditional node (convenience helper)
 * @param light - Node to display in light mode
 * @param dark - Node to display in dark mode
 */
export function ColorSchemeConditional(light: Node, dark: Node): Node {
  return ColorScheme([light, dark]);
}
