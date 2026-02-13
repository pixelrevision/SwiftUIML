// Main entry point - exports everything
export { Node, AttrValue, Attribute, Attributes } from "./node";
export { Layout, Styles, attr, style } from "./layout";
// Utility functions
export { addStableIds } from "./serializer";
export { AttributeKey } from "./attribute-key";
export { AttributeKey as Attr } from "./attribute-key";
export { ViewType } from "./view-type";

// Export Breakpoint class and standalone helpers
export {
  Breakpoint,
  // Named breakpoints
  xs,
  sm,
  md,
  lg,
  xl,
  // Width helpers
  w,
  wGreaterThan,
  wLessThanOrEqual,
  wLessThan,
  // Height helpers
  h,
  hGreaterThan,
  hLessThanOrEqual,
  hLessThan,
} from "./breakpoint";

// Export animation types and builder functions
export {
  AnimationType,
  // Timing curve animations
  easeIn,
  easeOut,
  easeInOut,
  linear,
  // Spring animations
  spring,
  bouncy,
  smooth,
  snappy,
  // Animation modifiers
  delay,
  speed,
  repeatCount,
  repeatForever,
} from "./animation-types";

// Export union types for string literal parameters
// Note: ColorScheme type is not exported to avoid naming collision with ColorScheme() view function
export type {
  Alignment,
  HorizontalAlignment,
  VerticalAlignment,
  Axis,
  TextAlignment,
  TruncationMode,
  FontStyle,
  FontWeight,
  FontDesign,
  TextSelection,
  ContentMode,
  RenderingMode,
  BlendMode,
  RedactionReasons,
  ScrollBounceBehavior,
  ScrollTargetBehavior,
  ScrollIndicatorVisibility,
  TabViewStyle,
  TextFieldStyle,
  ButtonStyle,
  ButtonBorderShape,
  ProgressViewStyle,
  ListStyle,
  ToggleStyle,
  PickerStyle,
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
  UserScriptInjectionTime,
  SafeAreaRegion,
} from "./unions";

// Import modifiers to register them on Node prototype
import "./node-modifiers";

// Export view builder functions
export * from "./views";
