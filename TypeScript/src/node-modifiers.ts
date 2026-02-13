// Extension methods for Node - view modifiers
import { Node, AttrValue } from "./node";
import { AttributeKey } from "./attribute-key";
import { Breakpoint } from "./breakpoint";
import { Text } from "./views";
import type {
  Alignment,
  TextAlignment,
  TruncationMode,
  SafeAreaRegion,
  FontStyle,
  FontWeight,
  FontDesign,
  ContentMode,
  RenderingMode,
  BlendMode,
  RedactionReasons,
  ScrollBounceBehavior,
  ScrollTargetBehavior,
  ScrollIndicatorVisibility,
  TextSelection,
  TabViewStyle,
  TextFieldStyle,
  ButtonStyle,
  ProgressViewStyle,
  ListStyle,
  ToggleStyle,
  PickerStyle,
  ButtonBorderShape,
  UserScriptInjectionTime,
  Axis,
  ColorScheme,
  DisplayedComponents,
  ControlSize,
  KeyboardType,
  AutocapitalizationType,
  TextContentType,
  SubmitLabel,
  AccessibilityChildBehavior,
  NavigationBarTitleDisplayMode,
  PresentationDetent,
  Visibility,
  VerticalEdges,
} from "./unions";

// Extend the Node class prototype with modifier methods
declare module "./node" {
  interface Node {
    // Identity
    id(value: string): Node;
    ID(value: string): Node;
    Name(value: string): Node;
    style(styleName: string): Node;
    ignoreEquatable(): Node;

    // Responsive & Conditional
    responsive(breakpoints: Map<Breakpoint, { [key: string]: AttrValue }>): Node;
    colorSchemeConditional(schemes: {
      light?: { [key: string]: AttrValue };
      dark?: { [key: string]: AttrValue };
    }): Node;

    // Frame modifiers
    frame(width?: number, height?: number, alignment?: Alignment): Node;
    frame(
      minWidth?: number,
      idealWidth?: number,
      maxWidth?: number,
      minHeight?: number,
      idealHeight?: number,
      maxHeight?: number,
      alignment?: Alignment,
    ): Node;
    containerRelativeFrame(
      axes: string,
      count: number,
      span: number,
      spacing?: number,
      alignment?: Alignment,
    ): Node;
    fixedSize(): Node;
    fixedSize(horizontal: boolean, vertical: boolean): Node;

    // Padding modifiers
    padding(): Node;
    padding(amount: number): Node;
    padding(top: number, leading: number, bottom: number, trailing: number): Node;

    // Offset modifiers
    offset(value: number): Node;
    offset(x: number, y: number): Node;

    // Position modifiers
    position(x: number, y: number): Node;

    // Rotation effect
    rotationEffect(degrees: number, anchor?: Alignment): Node;
    rotationEffectRadians(radians: number, anchor?: Alignment): Node;

    // 3D Rotation effect
    rotation3DEffect(
      degrees: number,
      axis: { x: number; y: number; z: number },
      anchor?: Alignment,
      anchorZ?: number,
      perspective?: number,
    ): Node;
    rotation3DEffectRadians(
      radians: number,
      axis: { x: number; y: number; z: number },
      anchor?: Alignment,
      anchorZ?: number,
      perspective?: number,
    ): Node;

    // Perspective
    perspective(value: number): Node;

    // Scale effect
    scaleEffect(scale: number): Node;
    scaleEffect(x: number, y: number, anchor?: Alignment): Node;

    // Grid
    gridCellColumns(count: number): Node;

    // Layout priority
    layoutPriority(priority: number): Node;

    // Coordinate space
    coordinateSpace(name: string): Node;

    // Gauge labels
    currentValueLabel(label: string | Node): Node;
    minimumValueLabel(label: string | Node): Node;
    maximumValueLabel(label: string | Node): Node;

    // Color modifiers
    foregroundColor(color: string): Node;
    backgroundColor(color: string): Node;
    tint(color: string): Node;

    // Layering modifiers
    overlay(overlay: Node, alignment?: Alignment): Node;
    background(background: Node, alignment?: Alignment): Node;
    mask(mask: Node, alignment?: Alignment): Node;

    // Shape modifiers
    clipShape(shape: Node): Node;
    fill(color: string): Node;
    fill(fill: Node): Node;
    stroke(color: string, lineWidth?: number): Node;
    trim(to: number): Node;
    trim(from: number, to: number): Node;

    // Text modifiers
    font(style: FontStyle): Node;
    font(size: number, weight?: FontWeight, design?: FontDesign): Node;
    customFont(name: string, size: number, relativeTo?: FontStyle): Node;
    customFont(name: string, fixedSize: number): Node;
    fontWeight(weight: FontWeight): Node;
    bold(): Node;
    italic(): Node;
    underline(): Node;
    underline(isActive: boolean, color?: string): Node;
    strikethrough(): Node;
    strikethrough(isActive: boolean, color?: string): Node;
    kerning(kerning: number): Node;
    tracking(tracking: number): Node;
    lineSpacing(spacing: number): Node;
    minimumScaleFactor(factor: number): Node;
    lineLimit(limit: number): Node;
    multilineTextAlignment(alignment: TextAlignment): Node;
    textSelection(selection: TextSelection): Node;
    truncationMode(mode: TruncationMode): Node;
    allowsTightening(allows?: boolean): Node;
    baselineOffset(offset: number): Node;

    // Corner and visual effects
    cornerRadius(radius: number): Node;
    opacity(value: number): Node;
    blendMode(mode: BlendMode): Node;
    hidden(): Node;
    redacted(reason: RedactionReasons): Node;
    privacySensitive(sensitive?: boolean): Node;
    clipped(): Node;
    ignoresSafeArea(): Node;
    ignoresSafeArea(edges: string): Node;
    safeAreaInset(
      edge: SafeAreaRegion,
      alignment: Alignment,
      spacing: number | undefined,
      content: Node,
    ): Node;
    border(color: string, width: number): Node;
    shadow(color: string, radius?: number, x?: number, y?: number): Node;
    blur(radius: number, opaque?: boolean): Node;
    brightness(amount: number): Node;
    contrast(amount: number): Node;
    saturation(amount: number): Node;
    grayscale(amount: number): Node;
    hueRotation(degrees: number): Node;
    hueRotation(angle: { degrees?: number; radians?: number; zero?: boolean }): Node;
    colorInvert(): Node;
    luminanceToAlpha(): Node;
    colorMultiply(color: string): Node;

    // Image modifiers
    resizable(): Node;
    renderingMode(mode: RenderingMode): Node;
    aspectRatio(ratio: number | string, contentMode?: ContentMode): Node;

    // Scroll modifiers
    scrollBounceBehavior(behavior: ScrollBounceBehavior, axes?: Axis): Node;
    scrollTargetBehavior(behavior: ScrollTargetBehavior): Node;
    scrollTargetLayout(): Node;
    scrollDisabled(disabled?: boolean): Node;
    scrollIndicators(visibility: ScrollIndicatorVisibility, axes?: Axis): Node;

    // Tab modifiers
    tabItem(systemName?: string, text?: string): Node;
    tabItem(dict: { [key: string]: AttrValue }): Node;
    tag(tag: string | number): Node;
    badge(label: string): Node;
    badge(count: number): Node;
    tabViewStyle(style: TabViewStyle): Node;

    // Text field style
    textFieldStyle(style: TextFieldStyle): Node;

    // Button style
    buttonStyle(style: ButtonStyle): Node;

    // Progress view style
    progressViewStyle(style: ProgressViewStyle): Node;

    // List style
    listStyle(style: ListStyle): Node;
    listRowBackground(background: Node): Node;
    listRowInsets(top?: number, leading?: number, bottom?: number, trailing?: number): Node;
    listRowSeparator(visibility: Visibility): Node;
    listRowSeparator(visibility: Visibility, edges: VerticalEdges): Node;

    // Toggle style
    toggleStyle(style: ToggleStyle): Node;

    // Picker style
    pickerStyle(style: PickerStyle): Node;

    // Labels hidden
    labelsHidden(): Node;

    // Button border shape
    buttonBorderShape(shape: ButtonBorderShape): Node;

    // Color scheme
    colorScheme(scheme: ColorScheme): Node;
    preferredColorScheme(scheme: ColorScheme): Node;

    // Interaction modifiers
    onTapGesture(message: AttrValue): Node;
    onLongPressGesture(message: AttrValue, minimumDuration?: number): Node;
    onAppear(message: AttrValue): Node;
    onDisappear(message: AttrValue): Node;
    disabled(disabled?: boolean): Node;

    // TextField modifiers
    onTextChange(message: AttrValue): Node;
    onSubmit(message: AttrValue): Node;
    onFocus(message: AttrValue): Node;
    onBlur(message: AttrValue): Node;

    // Toggle modifiers
    onToggle(message: AttrValue): Node;

    // Slider modifiers
    onSliderChange(message: AttrValue): Node;

    // Stepper modifiers
    onStepperChange(message: AttrValue): Node;

    // Picker modifiers
    onPickerChange(message: AttrValue): Node;

    // DisclosureGroup modifiers
    onExpandedChange(message: AttrValue): Node;

    // DatePicker modifiers
    onDateChange(message: AttrValue): Node;
    displayedComponents(components: DisplayedComponents): Node;
    minimumDate(date: Date | string): Node;
    maximumDate(date: Date | string): Node;
    locale(localeIdentifier: string): Node;
    timeZone(timeZoneIdentifier: string): Node;
    controlSize(size: ControlSize): Node;
    keyboardType(type: KeyboardType): Node;
    autocapitalization(type: AutocapitalizationType): Node;
    textContentType(type: TextContentType): Node;
    submitLabel(label: SubmitLabel): Node;

    // ColorPicker modifiers
    onColorChange(message: AttrValue): Node;
    supportsOpacity(supports?: boolean): Node;

    // Animation
    animation(
      animation: { toAttributeValue(): { [key: string]: AttrValue } },
      attribute: string | AttributeKey,
    ): Node;

    // Accessibility
    accessibilityLabel(label: string): Node;
    accessibilityHint(hint: string): Node;
    accessibilityValue(value: string): Node;
    accessibilityIdentifier(identifier: string): Node;
    accessibilityHidden(hidden?: boolean): Node;
    accessibilityTraits(trait: string | string[]): Node;
    accessibilityRemoveTraits(trait: string | string[]): Node;
    accessibilitySortPriority(priority: number): Node;
    accessibilityElement(children: AccessibilityChildBehavior): Node;
    accessibilityInputLabels(labels: string[]): Node;
    accessibilityAction(named: string, message: AttrValue): Node;

    // WebView
    javascriptBridge(
      enabled: boolean,
      allowlist: string[],
      scriptInjectionTime?: UserScriptInjectionTime,
      mainFrameOnly?: boolean,
    ): Node;
    inspectable(): Node;
    isInspectable(value: boolean): Node;

    // Navigation
    sheet(
      content: Node,
      id?: string,
      isPresented?: boolean,
      animated?: boolean,
      onPresented?: AttrValue,
      onDismiss?: AttrValue,
    ): Node;
    fullScreenCover(
      content: Node,
      id?: string,
      isPresented?: boolean,
      animated?: boolean,
      onPresented?: AttrValue,
      onDismiss?: AttrValue,
    ): Node;
    alert(
      title: string,
      message?: string,
      isPresented?: boolean,
      buttons?: AlertButton[],
      onDismiss?: AttrValue,
    ): Node;
    confirmationDialog(
      title: string,
      message?: string,
      isPresented?: boolean,
      buttons?: AlertButton[],
      onDismiss?: AttrValue,
    ): Node;
    popover(
      content: Node,
      id?: string,
      isPresented?: boolean,
      animated?: boolean,
      onPresented?: AttrValue,
      onDismiss?: AttrValue,
    ): Node;
    navigationDestination(
      value: string,
      content: Node,
      id?: string,
      isPresented?: boolean,
      onPresented?: AttrValue,
      onDismiss?: AttrValue,
    ): Node;
    navigationDestinationKey(key: string): Node;
    navigationDestinations(...destinations: Node[]): Node;
    navigationTitle(title: string): Node;
    navigationBarTitleDisplayMode(displayMode: NavigationBarTitleDisplayMode): Node;
    navigationBarHidden(hidden?: boolean): Node;
    navigationBarBackButtonHidden(hidden?: boolean): Node;
    toolbar(...content: Node[]): Node;

    // Presentation modifiers
    presentationDetents(detents: PresentationDetent | PresentationDetent[]): Node;
    presentationDragIndicator(visibility: Visibility): Node;
    interactiveDismissDisabled(disabled?: boolean): Node;
  }
}

// ============================================================================
// Identity
// ============================================================================

Node.prototype.id = function (value: string): Node {
  return this.addingAttribute(AttributeKey.id, value);
};

Node.prototype.ID = function (value: string): Node {
  return this.addingAttribute(AttributeKey.id, value);
};

Node.prototype.Name = function (value: string): Node {
  return this.addingAttribute(AttributeKey.Name, value);
};

Node.prototype.style = function (styleName: string): Node {
  return this.addingAttribute(AttributeKey.style, styleName);
};

Node.prototype.ignoreEquatable = function (): Node {
  return this.addingAttribute(AttributeKey.ignoreEquatable, true);
};

// ============================================================================
// Responsive & Conditional Rendering
// ============================================================================

/**
 * Adds responsive breakpoint-based attributes
 * @param breakpoints - Map of Breakpoint to attribute dictionaries
 *
 * Serializes as array of objects: [{pattern: "w>=200", attributes: [...]}, ...]
 *
 * Example:
 * ```typescript
 * Text("Hello").responsive(new Map([
 *   [Breakpoint.sm, { font: "body", padding: 8 }],
 *   [Breakpoint.md, { font: "title", padding: 16 }],
 *   [Breakpoint.w(800), { hidden: true }]
 * ]))
 * ```
 */
Node.prototype.responsive = function (
  breakpoints: Map<Breakpoint, { [key: string]: AttrValue }>,
): Node {
  const breakpointArray: AttrValue[] = [];

  for (const [bp, attrs] of breakpoints.entries()) {
    const attrsArray: [string, AttrValue][] = [];
    for (const [key, value] of Object.entries(attrs)) {
      attrsArray.push([key, value]);
    }

    breakpointArray.push({
      pattern: bp.pattern,
      attributes: attrsArray,
    });
  }

  return this.addingAttribute(AttributeKey.responsive, breakpointArray);
};

/**
 * Adds color scheme conditional attributes (light/dark mode variations)
 * @param schemes - Object with optional light and dark attribute dictionaries
 *
 * Serializes as: {light: [...], dark: [...]}
 *
 * Example:
 * ```typescript
 * AsyncImage("default.jpg").colorSchemeConditional({
 *   light: { url: "light-image.jpg" },
 *   dark: { url: "dark-image.jpg" }
 * })
 * ```
 */
Node.prototype.colorSchemeConditional = function (schemes: {
  light?: { [key: string]: AttrValue };
  dark?: { [key: string]: AttrValue };
}): Node {
  const schemesDict: { [key: string]: AttrValue } = {};

  if (schemes.light) {
    const lightArray: [string, AttrValue][] = [];
    for (const [key, value] of Object.entries(schemes.light)) {
      lightArray.push([key, value]);
    }
    schemesDict["light"] = lightArray;
  }

  if (schemes.dark) {
    const darkArray: [string, AttrValue][] = [];
    for (const [key, value] of Object.entries(schemes.dark)) {
      darkArray.push([key, value]);
    }
    schemesDict["dark"] = darkArray;
  }

  return this.addingAttribute(AttributeKey.colorSchemeConditional, schemesDict);
};

// ============================================================================
// Frame Modifiers
// ============================================================================

Node.prototype.frame = function (...args: any[]): Node {
  // Overload 1: frame(width?, height?, alignment?)
  if (args.length <= 3 && (typeof args[0] === "number" || args[0] === undefined)) {
    const [width, height, alignment] = args;
    const dict: { [key: string]: AttrValue } = {};
    if (width !== undefined) dict["width"] = width;
    if (height !== undefined) dict["height"] = height;
    if (alignment !== undefined) dict["alignment"] = alignment;
    return this.addingAttribute(AttributeKey.frame, dict);
  }

  // Overload 2: frame(minWidth?, idealWidth?, maxWidth?, minHeight?, idealHeight?, maxHeight?, alignment?)
  const [minWidth, idealWidth, maxWidth, minHeight, idealHeight, maxHeight, alignment] = args;
  const dict: { [key: string]: AttrValue } = {};
  if (minWidth !== undefined) dict["minWidth"] = minWidth;
  if (idealWidth !== undefined) dict["width"] = idealWidth;
  if (maxWidth !== undefined) dict["maxWidth"] = maxWidth;
  if (minHeight !== undefined) dict["minHeight"] = minHeight;
  if (idealHeight !== undefined) dict["height"] = idealHeight;
  if (maxHeight !== undefined) dict["maxHeight"] = maxHeight;
  if (alignment !== undefined) dict["alignment"] = alignment;
  return this.addingAttribute(AttributeKey.frame, dict);
};

Node.prototype.containerRelativeFrame = function (
  axes: string,
  count: number,
  span: number,
  spacing?: number,
  alignment?: Alignment,
): Node {
  const dict: { [key: string]: AttrValue } = {
    axis: axes || "both",
    count,
    span,
  };
  if (spacing !== undefined) dict["spacing"] = spacing;
  if (alignment !== undefined) dict["alignment"] = alignment;
  return this.addingAttribute(AttributeKey.containerRelativeFrame, dict);
};

Node.prototype.fixedSize = function (...args: any[]): Node {
  if (args.length === 0) {
    return this.addingAttribute(AttributeKey.fixedSize, true);
  }
  const [horizontal, vertical] = args;
  return this.addingAttribute(AttributeKey.fixedSize, {
    horizontal,
    vertical,
  });
};

// ============================================================================
// Padding Modifiers
// ============================================================================

Node.prototype.padding = function (...args: number[]): Node {
  if (args.length === 0) {
    return this.addingAttribute(AttributeKey.padding, null);
  } else if (args.length === 1) {
    return this.addingAttribute(AttributeKey.padding, args[0]);
  } else if (args.length === 4) {
    const [top, leading, bottom, trailing] = args;
    return this.addingAttribute(AttributeKey.padding, {
      top,
      leading,
      bottom,
      trailing,
    });
  }
  return this;
};

// ============================================================================
// Offset Modifiers
// ============================================================================

Node.prototype.offset = function (...args: number[]): Node {
  if (args.length === 1) {
    return this.addingAttribute(AttributeKey.offset, args[0]);
  } else if (args.length === 2) {
    const [x, y] = args;
    return this.addingAttribute(AttributeKey.offset, { x, y });
  }
  return this;
};

// ============================================================================
// Position Modifiers
// ============================================================================

Node.prototype.position = function (x: number, y: number): Node {
  return this.addingAttribute(AttributeKey.position, { x, y });
};

// ============================================================================
// Rotation Effect
// ============================================================================

Node.prototype.rotationEffect = function (degrees: number, anchor: Alignment = "center"): Node {
  return this.addingAttribute(AttributeKey.rotationEffect, {
    degrees: degrees,
    anchor: anchor,
  });
};

Node.prototype.rotationEffectRadians = function (
  radians: number,
  anchor: Alignment = "center",
): Node {
  return this.addingAttribute(AttributeKey.rotationEffect, {
    radians: radians,
    anchor: anchor,
  });
};

// ============================================================================
// 3D Rotation Effect
// ============================================================================

Node.prototype.rotation3DEffect = function (
  degrees: number,
  axis: { x: number; y: number; z: number },
  anchor: Alignment = "center",
  anchorZ: number = 0,
  perspective: number = 1,
): Node {
  return this.addingAttribute(AttributeKey.rotation3DEffect, {
    degrees: degrees,
    x: axis.x,
    y: axis.y,
    z: axis.z,
    anchor: anchor,
    anchorZ: anchorZ,
    perspective: perspective,
  });
};

Node.prototype.rotation3DEffectRadians = function (
  radians: number,
  axis: { x: number; y: number; z: number },
  anchor: Alignment = "center",
  anchorZ: number = 0,
  perspective: number = 1,
): Node {
  return this.addingAttribute(AttributeKey.rotation3DEffect, {
    radians: radians,
    x: axis.x,
    y: axis.y,
    z: axis.z,
    anchor: anchor,
    anchorZ: anchorZ,
    perspective: perspective,
  });
};

// ============================================================================
// Perspective
// ============================================================================

Node.prototype.perspective = function (value: number): Node {
  return this.addingAttribute(AttributeKey.perspective, value);
};

// ============================================================================
// Scale Effect
// ============================================================================

Node.prototype.scaleEffect = function (...args: any[]): Node {
  if (args.length === 1 && typeof args[0] === "number") {
    return this.addingAttribute(AttributeKey.scaleEffect, args[0]);
  } else if (args.length >= 2) {
    const [x, y, anchor = "center" as Alignment] = args;
    return this.addingAttribute(AttributeKey.scaleEffect, { x, y, anchor });
  }
  return this;
};

// ============================================================================
// Grid
// ============================================================================

Node.prototype.gridCellColumns = function (count: number): Node {
  return this.addingAttribute(AttributeKey.gridCellColumns, count);
};

// ============================================================================
// Layout Priority
// ============================================================================

Node.prototype.layoutPriority = function (priority: number): Node {
  return this.addingAttribute(AttributeKey.layoutPriority, priority);
};

// ============================================================================
// Coordinate Space
// ============================================================================

Node.prototype.coordinateSpace = function (name: string): Node {
  return this.addingAttribute(AttributeKey.coordinateSpace, name);
};

// ============================================================================
// Color Modifiers
// ============================================================================

Node.prototype.foregroundColor = function (color: string): Node {
  return this.addingAttribute(AttributeKey.foregroundColor, color);
};

Node.prototype.backgroundColor = function (color: string): Node {
  return this.addingAttribute(AttributeKey.backgroundColor, color);
};

Node.prototype.tint = function (color: string): Node {
  return this.addingAttribute(AttributeKey.tint, color);
};

// ============================================================================
// Layering Modifiers
// ============================================================================

Node.prototype.overlay = function (overlay: Node, alignment?: Alignment): Node {
  if (alignment === undefined) {
    return this.addingAttribute(AttributeKey.overlay, overlay);
  }
  return this.addingAttribute(AttributeKey.overlay, {
    value: overlay,
    alignment,
  });
};

Node.prototype.background = function (background: Node, alignment?: Alignment): Node {
  if (alignment === undefined) {
    return this.addingAttribute(AttributeKey.background, background);
  }
  return this.addingAttribute(AttributeKey.background, {
    value: background,
    alignment,
  });
};

Node.prototype.mask = function (mask: Node, alignment?: Alignment): Node {
  if (alignment === undefined) {
    return this.addingAttribute(AttributeKey.mask, mask);
  }
  return this.addingAttribute(AttributeKey.mask, {
    value: mask,
    alignment,
  });
};

// ============================================================================
// Shape Modifiers
// ============================================================================

Node.prototype.clipShape = function (shape: Node): Node {
  return this.addingAttribute(AttributeKey.clipShape, shape);
};

Node.prototype.fill = function (fill: string | Node): Node {
  if (typeof fill === "string") {
    return this.addingAttribute(AttributeKey.fill, fill);
  }
  return this.addingAttribute(AttributeKey.fill, fill);
};

Node.prototype.stroke = function (color: string, lineWidth?: number): Node {
  if (lineWidth === undefined) {
    return this.addingAttribute(AttributeKey.stroke, color);
  }
  return this.addingAttribute(AttributeKey.stroke, {
    color,
    lineWidth,
  });
};

Node.prototype.trim = function (...args: number[]): Node {
  if (args.length === 1) {
    // Single argument: treat as "to" with from=0
    return this.addingAttribute(AttributeKey.trim, args[0]);
  } else if (args.length === 2) {
    // Two arguments: from and to
    const [from, to] = args;
    return this.addingAttribute(AttributeKey.trim, {
      from,
      to,
    });
  }
  return this;
};

// ============================================================================
// Text Modifiers
// ============================================================================

Node.prototype.font = function (...args: any[]): Node {
  if (args.length === 1 && typeof args[0] === "string") {
    // font(style: FontStyle)
    return this.addingAttribute(AttributeKey.font, args[0]);
  }
  // font(size: number, weight?: FontWeight, design?: FontDesign)
  const [size, weight, design] = args;
  const dict: { [key: string]: AttrValue } = {
    type: "system",
    size,
  };
  if (weight) dict["weight"] = weight;
  if (design) dict["design"] = design;
  return this.addingAttribute(AttributeKey.font, dict);
};

Node.prototype.customFont = function (...args: any[]): Node {
  const [name, sizeOrFixed, relativeTo] = args;
  if (relativeTo !== undefined || args.length === 3) {
    // customFont(name: string, size: number, relativeTo?: FontStyle)
    const dict: { [key: string]: AttrValue } = { name, size: sizeOrFixed };
    if (relativeTo) dict["relativeTo"] = relativeTo;
    return this.addingAttribute(AttributeKey.font, dict);
  }
  // customFont(name: string, fixedSize: number)
  return this.addingAttribute(AttributeKey.font, {
    name,
    fixedSize: sizeOrFixed,
  });
};

Node.prototype.fontWeight = function (weight: FontWeight): Node {
  return this.addingAttribute(AttributeKey.fontWeight, weight);
};

Node.prototype.bold = function (): Node {
  return this.addingAttribute(AttributeKey.bold, true);
};

Node.prototype.italic = function (): Node {
  return this.addingAttribute(AttributeKey.italic, true);
};

Node.prototype.underline = function (isActive?: boolean, color?: string): Node {
  if (isActive === undefined) {
    return this.addingAttribute(AttributeKey.underline, true);
  }
  const value: any = { isActive };
  if (color !== undefined) {
    value.color = color;
  }
  return this.addingAttribute(AttributeKey.underline, value);
};

Node.prototype.strikethrough = function (isActive?: boolean, color?: string): Node {
  if (isActive === undefined) {
    return this.addingAttribute(AttributeKey.strikethrough, true);
  }
  const value: any = { isActive };
  if (color !== undefined) {
    value.color = color;
  }
  return this.addingAttribute(AttributeKey.strikethrough, value);
};

Node.prototype.kerning = function (kerning: number): Node {
  return this.addingAttribute(AttributeKey.kerning, kerning);
};

Node.prototype.tracking = function (tracking: number): Node {
  return this.addingAttribute(AttributeKey.tracking, tracking);
};

Node.prototype.lineSpacing = function (spacing: number): Node {
  return this.addingAttribute(AttributeKey.lineSpacing, spacing);
};

Node.prototype.minimumScaleFactor = function (factor: number): Node {
  return this.addingAttribute(AttributeKey.minimumScaleFactor, factor);
};

Node.prototype.lineLimit = function (limit: number): Node {
  return this.addingAttribute(AttributeKey.lineLimit, limit);
};

Node.prototype.multilineTextAlignment = function (alignment: TextAlignment): Node {
  return this.addingAttribute(AttributeKey.multilineTextAlignment, alignment);
};

Node.prototype.textSelection = function (selection: TextSelection): Node {
  return this.addingAttribute(AttributeKey.textSelection, selection);
};

Node.prototype.truncationMode = function (mode: TruncationMode): Node {
  return this.addingAttribute(AttributeKey.truncationMode, mode);
};

Node.prototype.allowsTightening = function (allows: boolean = true): Node {
  return this.addingAttribute(AttributeKey.allowsTightening, allows);
};

Node.prototype.baselineOffset = function (offset: number): Node {
  return this.addingAttribute(AttributeKey.baselineOffset, offset);
};

// ============================================================================
// Visual Effect Modifiers
// ============================================================================

Node.prototype.cornerRadius = function (radius: number): Node {
  return this.addingAttribute(AttributeKey.cornerRadius, radius);
};

Node.prototype.opacity = function (value: number): Node {
  return this.addingAttribute(AttributeKey.opacity, value);
};

Node.prototype.blendMode = function (mode: BlendMode): Node {
  return this.addingAttribute(AttributeKey.blendMode, mode);
};

Node.prototype.hidden = function (): Node {
  return this.addingAttribute(AttributeKey.hidden, true);
};

Node.prototype.redacted = function (reason: RedactionReasons): Node {
  return this.addingAttribute(AttributeKey.redacted, reason);
};

Node.prototype.privacySensitive = function (sensitive: boolean = true): Node {
  return this.addingAttribute(AttributeKey.privacySensitive, sensitive);
};

Node.prototype.clipped = function (): Node {
  return this.addingAttribute(AttributeKey.clipped, true);
};

Node.prototype.ignoresSafeArea = function (edges?: string): Node {
  if (edges === undefined) {
    return this.addingAttribute(AttributeKey.ignoresSafeArea, true);
  }
  return this.addingAttribute(AttributeKey.ignoresSafeArea, edges);
};

Node.prototype.safeAreaInset = function (
  edge: SafeAreaRegion,
  alignment: Alignment = "center",
  spacing: number | undefined = undefined,
  content: Node,
): Node {
  const dict: { [key: string]: any } = {
    edge: edge,
    alignment: alignment,
    content: content,
  };
  if (spacing !== undefined) {
    dict["spacing"] = spacing;
  }
  return this.addingAttribute(AttributeKey.safeAreaInset, dict);
};

Node.prototype.border = function (color: string, width: number): Node {
  return this.addingAttribute(AttributeKey.border, {
    color,
    width,
  });
};

Node.prototype.shadow = function (
  color: string,
  radius: number = 5,
  x: number = 0,
  y: number = 0,
): Node {
  return this.addingAttribute(AttributeKey.shadow, {
    color,
    radius,
    x,
    y,
  });
};

Node.prototype.blur = function (radius: number, opaque?: boolean): Node {
  if (opaque === undefined) {
    return this.addingAttribute(AttributeKey.blur, radius);
  }
  return this.addingAttribute(AttributeKey.blur, {
    radius,
    opaque,
  });
};

Node.prototype.brightness = function (amount: number): Node {
  return this.addingAttribute(AttributeKey.brightness, amount);
};

Node.prototype.contrast = function (amount: number): Node {
  return this.addingAttribute(AttributeKey.contrast, amount);
};

Node.prototype.saturation = function (amount: number): Node {
  return this.addingAttribute(AttributeKey.saturation, amount);
};

Node.prototype.grayscale = function (amount: number): Node {
  return this.addingAttribute(AttributeKey.grayscale, amount);
};

Node.prototype.hueRotation = function (
  degreesOrAngle: number | { degrees?: number; radians?: number; zero?: boolean },
): Node {
  if (typeof degreesOrAngle === "number") {
    return this.addingAttribute(AttributeKey.hueRotation, degreesOrAngle);
  }

  // Handle angle object
  const angle = degreesOrAngle;
  if (angle.degrees !== undefined) {
    return this.addingAttribute(AttributeKey.hueRotation, {
      [AttributeKey.degrees.value]: angle.degrees,
    });
  } else if (angle.radians !== undefined) {
    return this.addingAttribute(AttributeKey.hueRotation, {
      [AttributeKey.radians.value]: angle.radians,
    });
  } else if (angle.zero) {
    return this.addingAttribute(AttributeKey.hueRotation, {
      [AttributeKey.zero.value]: true,
    });
  }

  // Default to 0 degrees
  return this.addingAttribute(AttributeKey.hueRotation, 0);
};

Node.prototype.colorInvert = function (): Node {
  return this.addingAttribute(AttributeKey.colorInvert, true);
};

Node.prototype.luminanceToAlpha = function (): Node {
  return this.addingAttribute(AttributeKey.luminanceToAlpha, true);
};

Node.prototype.colorMultiply = function (color: string): Node {
  return this.addingAttribute(AttributeKey.colorMultiply, color);
};

// ============================================================================
// Image Modifiers
// ============================================================================

Node.prototype.resizable = function (): Node {
  return this.addingAttribute(AttributeKey.resizable, true);
};

Node.prototype.renderingMode = function (mode: RenderingMode): Node {
  return this.addingAttribute(AttributeKey.renderingMode, mode);
};

Node.prototype.aspectRatio = function (
  ratio: number | string,
  contentMode: ContentMode = "fit",
): Node {
  return this.addingAttribute(AttributeKey.aspectRatio, {
    ratio,
    contentMode,
  });
};

// ============================================================================
// Scroll Modifiers
// ============================================================================

Node.prototype.scrollBounceBehavior = function (
  behavior: ScrollBounceBehavior,
  axes: Axis = "vertical",
): Node {
  return this.addingAttribute(AttributeKey.scrollBounceBehavior, {
    behavior: behavior,
    axis: axes,
  });
};

Node.prototype.scrollTargetBehavior = function (behavior: ScrollTargetBehavior): Node {
  return this.addingAttribute(AttributeKey.scrollTargetBehavior, behavior);
};

Node.prototype.scrollTargetLayout = function (): Node {
  return this.addingAttribute(AttributeKey.scrollTargetLayout, true);
};

Node.prototype.scrollDisabled = function (disabled: boolean = true): Node {
  return this.addingAttribute(AttributeKey.scrollDisabled, disabled);
};

Node.prototype.scrollIndicators = function (
  visibility: ScrollIndicatorVisibility,
  axes?: Axis,
): Node {
  if (axes === undefined) {
    return this.addingAttribute(AttributeKey.scrollIndicators, visibility);
  }
  return this.addingAttribute(AttributeKey.scrollIndicators, {
    type: visibility,
    axis: axes,
  });
};

// ============================================================================
// Tab Modifiers
// ============================================================================

Node.prototype.tabItem = function (...args: any[]): Node {
  if (args.length === 1 && typeof args[0] === "object" && !Array.isArray(args[0])) {
    // tabItem(dict: { [key: string]: AttrValue })
    return this.addingAttribute(AttributeKey.tabItem, args[0]);
  }
  // tabItem(systemName?: string, text?: string)
  const [systemName, text] = args;
  const dict: { [key: string]: AttrValue } = {};
  if (systemName) dict["systemName"] = systemName;
  if (text) dict["text"] = text;
  return this.addingAttribute(AttributeKey.tabItem, dict);
};

Node.prototype.tag = function (tag: string | number): Node {
  return this.addingAttribute(AttributeKey.tag, tag);
};

Node.prototype.badge = function (value: string | number): Node {
  return this.addingAttribute(AttributeKey.badge, value);
};

Node.prototype.tabViewStyle = function (style: TabViewStyle): Node {
  return this.addingAttribute(AttributeKey.tabViewStyle, style);
};

// ============================================================================
// Text Field Style
// ============================================================================

Node.prototype.textFieldStyle = function (style: TextFieldStyle): Node {
  return this.addingAttribute(AttributeKey.textFieldStyle, style);
};

// ============================================================================
// Button Style
// ============================================================================

Node.prototype.buttonStyle = function (style: ButtonStyle): Node {
  return this.addingAttribute(AttributeKey.buttonStyle, style);
};

// ============================================================================
// Progress View Style
// ============================================================================

Node.prototype.progressViewStyle = function (style: ProgressViewStyle): Node {
  return this.addingAttribute(AttributeKey.progressViewStyle, style);
};

// ============================================================================
// List Style
// ============================================================================

Node.prototype.listStyle = function (style: ListStyle): Node {
  return this.addingAttribute(AttributeKey.listStyle, style);
};

Node.prototype.listRowBackground = function (background: Node): Node {
  return this.addingAttribute(AttributeKey.listRowBackground, background).addingAttribute(
    AttributeKey.ignoreEquatable,
    true,
  );
};

Node.prototype.listRowInsets = function (
  top: number = 0,
  leading: number = 0,
  bottom: number = 0,
  trailing: number = 0,
): Node {
  return this.addingAttribute(AttributeKey.listRowInsets, {
    top,
    leading,
    bottom,
    trailing,
  }).addingAttribute(AttributeKey.ignoreEquatable, true);
};

Node.prototype.listRowSeparator = function (...args: any[]): Node {
  if (args.length === 1) {
    // Just visibility
    return this.addingAttribute(AttributeKey.listRowSeparator, args[0]).addingAttribute(
      AttributeKey.ignoreEquatable,
      true,
    );
  } else if (args.length === 2) {
    // Visibility and edges
    return this.addingAttribute(AttributeKey.listRowSeparator, {
      visibility: args[0],
      edges: args[1],
    }).addingAttribute(AttributeKey.ignoreEquatable, true);
  }
  return this;
};

// ============================================================================
// Toggle Style
// ============================================================================

Node.prototype.toggleStyle = function (style: ToggleStyle): Node {
  return this.addingAttribute(AttributeKey.toggleStyle, style);
};

// ============================================================================
// Picker Style
// ============================================================================

Node.prototype.pickerStyle = function (style: PickerStyle): Node {
  return this.addingAttribute(AttributeKey.pickerStyle, style);
};

// ============================================================================
// Labels Hidden
// ============================================================================

Node.prototype.labelsHidden = function (): Node {
  return this.addingAttribute(AttributeKey.labelsHidden, true);
};

// ============================================================================
// Button Border Shape
// ============================================================================

Node.prototype.buttonBorderShape = function (shape: ButtonBorderShape): Node {
  return this.addingAttribute(AttributeKey.buttonBorderShape, shape);
};

// ============================================================================
// Color Scheme
// ============================================================================

Node.prototype.colorScheme = function (scheme: ColorScheme): Node {
  return this.addingAttribute(AttributeKey.colorScheme, scheme);
};

Node.prototype.preferredColorScheme = function (scheme: ColorScheme): Node {
  return this.addingAttribute(AttributeKey.preferredColorScheme, scheme);
};

// ============================================================================
// Interaction Modifiers
// ============================================================================

Node.prototype.onTapGesture = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onTapGesture, message);
};

Node.prototype.onLongPressGesture = function (
  message: AttrValue,
  minimumDuration: number = 0.5,
): Node {
  return this.addingAttribute(AttributeKey.onLongPressGesture, {
    minimumDuration,
    message,
  });
};

Node.prototype.onAppear = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onAppear, message);
};

Node.prototype.onDisappear = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onDisappear, message);
};

Node.prototype.disabled = function (disabled: boolean = true): Node {
  return this.addingAttribute(AttributeKey.disabled, disabled);
};

// ============================================================================
// TextField modifiers
// ============================================================================

Node.prototype.onTextChange = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onTextChange, message);
};

Node.prototype.onSubmit = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onSubmit, message);
};

Node.prototype.onFocus = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onFocus, message);
};

Node.prototype.onBlur = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onBlur, message);
};

// ============================================================================
// Toggle modifiers
// ============================================================================

Node.prototype.onToggle = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onToggle, message);
};

// ============================================================================
// Slider modifiers
// ============================================================================

Node.prototype.onSliderChange = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onSliderChange, message);
};

// ============================================================================
// Stepper modifiers
// ============================================================================

Node.prototype.onStepperChange = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onStepperChange, message);
};

// ============================================================================
// Picker modifiers
// ============================================================================

Node.prototype.onPickerChange = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onPickerChange, message);
};

// ============================================================================
// DisclosureGroup modifiers
// ============================================================================

Node.prototype.onExpandedChange = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onExpandedChange, message);
};

// ============================================================================
// DatePicker modifiers
// ============================================================================

Node.prototype.onDateChange = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onDateChange, message);
};

Node.prototype.displayedComponents = function (components: DisplayedComponents): Node {
  return this.addingAttribute(AttributeKey.displayedComponents, components);
};

Node.prototype.minimumDate = function (date: Date | string): Node {
  const dateString = date instanceof Date ? date.toISOString() : date;
  return this.addingAttribute(AttributeKey.minimumDate, dateString);
};

Node.prototype.maximumDate = function (date: Date | string): Node {
  const dateString = date instanceof Date ? date.toISOString() : date;
  return this.addingAttribute(AttributeKey.maximumDate, dateString);
};

Node.prototype.locale = function (localeIdentifier: string): Node {
  return this.addingAttribute(AttributeKey.locale, localeIdentifier);
};

Node.prototype.timeZone = function (timeZoneIdentifier: string): Node {
  return this.addingAttribute(AttributeKey.timeZone, timeZoneIdentifier);
};

Node.prototype.controlSize = function (size: ControlSize): Node {
  return this.addingAttribute(AttributeKey.controlSize, size);
};

Node.prototype.keyboardType = function (type: KeyboardType): Node {
  return this.addingAttribute(AttributeKey.keyboardType, type);
};

Node.prototype.autocapitalization = function (type: AutocapitalizationType): Node {
  return this.addingAttribute(AttributeKey.autocapitalization, type);
};

Node.prototype.textContentType = function (type: TextContentType): Node {
  return this.addingAttribute(AttributeKey.textContentType, type);
};

Node.prototype.submitLabel = function (label: SubmitLabel): Node {
  return this.addingAttribute(AttributeKey.submitLabel, label);
};

// ============================================================================
// ColorPicker modifiers
// ============================================================================

Node.prototype.onColorChange = function (message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.onColorChange, message);
};

Node.prototype.supportsOpacity = function (supports: boolean = true): Node {
  return this.addingAttribute(AttributeKey.supportsOpacity, supports);
};

// ============================================================================
// Animation
// ============================================================================

Node.prototype.animation = function (
  animation: { toAttributeValue(): { [key: string]: AttrValue } },
  attribute: string | AttributeKey,
): Node {
  const animDict = animation.toAttributeValue();
  const attributeStr = typeof attribute === "string" ? attribute : attribute.value;
  animDict["attribute"] = attributeStr;
  return this.addingAttribute(AttributeKey.animation, animDict);
};

// ============================================================================
// Accessibility
// ============================================================================

Node.prototype.accessibilityLabel = function (label: string): Node {
  return this.addingAttribute(AttributeKey.accessibilityLabel, label);
};

Node.prototype.accessibilityHint = function (hint: string): Node {
  return this.addingAttribute(AttributeKey.accessibilityHint, hint);
};

Node.prototype.accessibilityValue = function (value: string): Node {
  return this.addingAttribute(AttributeKey.accessibilityValue, value);
};

Node.prototype.accessibilityIdentifier = function (identifier: string): Node {
  return this.addingAttribute(AttributeKey.accessibilityIdentifier, identifier);
};

Node.prototype.accessibilityHidden = function (hidden: boolean = true): Node {
  return this.addingAttribute(AttributeKey.accessibilityHidden, hidden);
};

Node.prototype.accessibilityTraits = function (trait: string | string[]): Node {
  if (typeof trait === "string") {
    return this.addingAttribute(AttributeKey.accessibilityTraits, trait);
  }
  return this.addingAttribute(AttributeKey.accessibilityTraits, trait);
};

Node.prototype.accessibilitySortPriority = function (priority: number): Node {
  return this.addingAttribute(AttributeKey.accessibilitySortPriority, priority);
};

Node.prototype.accessibilityElement = function (children: AccessibilityChildBehavior): Node {
  return this.addingAttribute(AttributeKey.accessibilityElement, children);
};

Node.prototype.accessibilityInputLabels = function (labels: string[]): Node {
  return this.addingAttribute(AttributeKey.accessibilityInputLabels, labels);
};

Node.prototype.accessibilityRemoveTraits = function (trait: string | string[]): Node {
  if (typeof trait === "string") {
    return this.addingAttribute(AttributeKey.accessibilityRemoveTraits, trait);
  }
  return this.addingAttribute(AttributeKey.accessibilityRemoveTraits, trait);
};

Node.prototype.accessibilityAction = function (named: string, message: AttrValue): Node {
  return this.addingAttribute(AttributeKey.accessibilityAction, {
    name: named,
    message: message,
  });
};

// ============================================================================
// WebView
// ============================================================================

Node.prototype.javascriptBridge = function (
  enabled: boolean = true,
  allowlist: string[],
  scriptInjectionTime?: UserScriptInjectionTime,
  mainFrameOnly: boolean = true,
): Node {
  const dict: { [key: string]: AttrValue } = {
    enabled,
    allowlist,
    mainFrameOnly,
  };
  if (scriptInjectionTime) {
    dict["injectionTime"] = scriptInjectionTime;
  }
  return this.addingAttribute(AttributeKey.javascriptBridge, dict);
};

Node.prototype.inspectable = function (): Node {
  return this.addingAttribute(AttributeKey.isInspectable, true);
};

Node.prototype.isInspectable = function (value: boolean): Node {
  return this.addingAttribute(AttributeKey.isInspectable, value);
};

// Navigation modifiers

Node.prototype.sheet = function (
  content: Node,
  id?: string,
  isPresented: boolean = true,
  animated: boolean = true,
  onPresented?: AttrValue,
  onDismiss?: AttrValue,
): Node {
  const sheetDict: { [key: string]: AttrValue } = {
    value: content,
    isPresented: isPresented,
    animated: animated,
  };

  if (id) {
    sheetDict["id"] = id;
  }
  if (onPresented) {
    sheetDict["onPresented"] = onPresented;
  }
  if (onDismiss) {
    sheetDict["onDismiss"] = onDismiss;
  }

  return this.addingAttribute(AttributeKey.sheet, sheetDict);
};

Node.prototype.fullScreenCover = function (
  content: Node,
  id?: string,
  isPresented: boolean = true,
  animated: boolean = true,
  onPresented?: AttrValue,
  onDismiss?: AttrValue,
): Node {
  const coverDict: { [key: string]: AttrValue } = {
    value: content,
    isPresented: isPresented,
    animated: animated,
  };

  if (id) {
    coverDict["id"] = id;
  }
  if (onPresented) {
    coverDict["onPresented"] = onPresented;
  }
  if (onDismiss) {
    coverDict["onDismiss"] = onDismiss;
  }

  return this.addingAttribute(AttributeKey.fullScreenCover, coverDict);
};

/**
 * Alert button configuration
 */
export interface AlertButton {
  label: string;
  role?: "cancel" | "destructive";
  action?: AttrValue;
}

Node.prototype.alert = function (
  title: string,
  message?: string,
  isPresented: boolean = true,
  buttons: AlertButton[] = [],
  onDismiss?: AttrValue,
): Node {
  const alertDict: { [key: string]: AttrValue } = {
    title: title,
    isPresented: isPresented,
    buttons: buttons.map((btn) => ({
      label: btn.label,
      ...(btn.role && { role: btn.role }),
      ...(btn.action && { action: btn.action }),
    })),
  };

  if (message) {
    alertDict["message"] = message;
  }
  if (onDismiss) {
    alertDict["onDismiss"] = onDismiss;
  }

  return this.addingAttribute(AttributeKey.alert, alertDict);
};

Node.prototype.confirmationDialog = function (
  title: string,
  message?: string,
  isPresented: boolean = true,
  buttons: AlertButton[] = [],
  onDismiss?: AttrValue,
): Node {
  const dialogDict: { [key: string]: AttrValue } = {
    title: title,
    isPresented: isPresented,
    buttons: buttons.map((btn) => ({
      label: btn.label,
      ...(btn.role && { role: btn.role }),
      ...(btn.action && { action: btn.action }),
    })),
  };

  if (message) {
    dialogDict["message"] = message;
  }
  if (onDismiss) {
    dialogDict["onDismiss"] = onDismiss;
  }

  return this.addingAttribute(AttributeKey.confirmationDialog, dialogDict);
};

Node.prototype.popover = function (
  content: Node,
  id?: string,
  isPresented: boolean = true,
  animated: boolean = true,
  onPresented?: AttrValue,
  onDismiss?: AttrValue,
): Node {
  const popoverDict: { [key: string]: AttrValue } = {
    value: content,
    isPresented: isPresented,
    animated: animated,
  };

  if (id) {
    popoverDict["id"] = id;
  }
  if (onPresented) {
    popoverDict["onPresented"] = onPresented;
  }
  if (onDismiss) {
    popoverDict["onDismiss"] = onDismiss;
  }

  return this.addingAttribute(AttributeKey.popover, popoverDict);
};

Node.prototype.navigationDestination = function (
  value: string,
  content: Node,
  id?: string,
  isPresented: boolean = false,
  onPresented?: AttrValue,
  onDismiss?: AttrValue,
): Node {
  const destDict: { [key: string]: AttrValue } = {
    value: value,
    isPresented: isPresented,
    content: content,
  };

  if (id) {
    destDict["id"] = id;
  }
  if (onPresented) {
    destDict["onPresented"] = onPresented;
  }
  if (onDismiss) {
    destDict["onDismiss"] = onDismiss;
  }

  return this.addingAttribute(AttributeKey.navigationDestination, destDict);
};

Node.prototype.toolbar = function (...content: Node[]): Node {
  // Wrap children in a container node, matching Swift implementation
  const toolbarNode = new Node("ToolbarContent", [], content);
  return this.addingAttribute(AttributeKey.toolbar, toolbarNode);
};

Node.prototype.navigationDestinationKey = function (key: string): Node {
  return this.addingAttribute(AttributeKey.navigationDestinationKey, key);
};

Node.prototype.navigationDestinations = function (...destinations: Node[]): Node {
  return this.addingAttribute(AttributeKey.navigationDestinations, destinations);
};

Node.prototype.navigationTitle = function (title: string): Node {
  return this.addingAttribute(AttributeKey.navigationTitle, title);
};

Node.prototype.navigationBarTitleDisplayMode = function (
  displayMode: NavigationBarTitleDisplayMode,
): Node {
  return this.addingAttribute(AttributeKey.navigationBarTitleDisplayMode, displayMode);
};

Node.prototype.navigationBarHidden = function (hidden: boolean = true): Node {
  return this.addingAttribute(AttributeKey.navigationBarHidden, hidden);
};

Node.prototype.navigationBarBackButtonHidden = function (hidden: boolean = true): Node {
  return this.addingAttribute(AttributeKey.navigationBarBackButtonHidden, hidden);
};

// ============================================================================
// Presentation Modifiers
// ============================================================================

Node.prototype.presentationDetents = function (
  detents: PresentationDetent | PresentationDetent[],
): Node {
  const detentArray = Array.isArray(detents) ? detents : [detents];
  return this.addingAttribute(AttributeKey.presentationDetents, detentArray);
};

Node.prototype.presentationDragIndicator = function (visibility: Visibility): Node {
  return this.addingAttribute(AttributeKey.presentationDragIndicator, visibility);
};

Node.prototype.interactiveDismissDisabled = function (disabled: boolean = true): Node {
  return this.addingAttribute(AttributeKey.interactiveDismissDisabled, disabled);
};

// ============================================================================
// Gauge Labels
// ============================================================================

Node.prototype.currentValueLabel = function (label: string | Node): Node {
  const labelNode = typeof label === "string" ? Text(label) : label;
  return this.addingAttribute(AttributeKey.currentValueLabel, labelNode);
};

Node.prototype.minimumValueLabel = function (label: string | Node): Node {
  const labelNode = typeof label === "string" ? Text(label) : label;
  return this.addingAttribute(AttributeKey.minimumValueLabel, labelNode);
};

Node.prototype.maximumValueLabel = function (label: string | Node): Node {
  const labelNode = typeof label === "string" ? Text(label) : label;
  return this.addingAttribute(AttributeKey.maximumValueLabel, labelNode);
};
