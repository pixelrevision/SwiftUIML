// Type definitions for SwiftUIML union types
// These match Swift enums and provide type safety for string literal parameters

// ============================================================================
// Layout & Alignment
// ============================================================================

export type Alignment =
  | "topLeading"
  | "top"
  | "topTrailing"
  | "leading"
  | "center"
  | "trailing"
  | "bottomLeading"
  | "bottom"
  | "bottomTrailing";

export type HorizontalAlignment = "leading" | "center" | "trailing";

export type VerticalAlignment =
  | "top"
  | "center"
  | "bottom"
  | "firstTextBaseline"
  | "lastTextBaseline";

export type Axis = "vertical" | "horizontal";

// ============================================================================
// Text & Typography
// ============================================================================

export type TextAlignment = "leading" | "center" | "trailing";

export type TruncationMode = "head" | "tail" | "middle";

export type FontStyle =
  | "largeTitle"
  | "title"
  | "title2"
  | "title3"
  | "headline"
  | "subheadline"
  | "body"
  | "callout"
  | "caption"
  | "caption2"
  | "footnote";

export type FontWeight =
  | "ultraLight"
  | "thin"
  | "light"
  | "regular"
  | "medium"
  | "semibold"
  | "bold"
  | "heavy"
  | "black";

export type FontDesign = "default" | "serif" | "rounded" | "monospaced";

export type TextSelection = "enabled" | "disabled";

// ============================================================================
// Visual & Effects
// ============================================================================

export type ContentMode = "fit" | "fill";

export type RenderingMode = "template" | "original";

export type BlendMode =
  | "normal"
  | "multiply"
  | "screen"
  | "overlay"
  | "darken"
  | "lighten"
  | "colorDodge"
  | "colorBurn"
  | "softLight"
  | "hardLight"
  | "difference"
  | "exclusion"
  | "hue"
  | "saturation"
  | "color"
  | "luminosity"
  | "sourceAtop"
  | "destinationOver"
  | "destinationOut"
  | "plusDarker"
  | "plusLighter";

export type RedactionReasons = "placeholder" | "privacy";

export type ColorScheme = "light" | "dark" | "system";

// ============================================================================
// Scrolling
// ============================================================================

export type ScrollBounceBehavior = "always" | "basedOnSize" | "never";

export type ScrollTargetBehavior = "paging" | "viewAligned";

export type ScrollIndicatorVisibility = "automatic" | "visible" | "hidden" | "never";

// ============================================================================
// Component Styles
// ============================================================================

export type TabViewStyle = "automatic" | "page";

export type TextFieldStyle = "automatic" | "plain" | "roundedBorder";

export type ButtonStyle = "automatic" | "plain" | "bordered" | "borderedProminent" | "borderless";

export type ButtonBorderShape = "automatic" | "capsule" | "roundedRectangle";

export type ProgressViewStyle = "automatic" | "linear" | "circular";

export type ListStyle = "automatic" | "plain" | "grouped" | "inset" | "insetGrouped" | "sidebar";

export type ToggleStyle = "automatic" | "switch" | "button";

export type PickerStyle =
  | "automatic"
  | "inline"
  | "menu"
  | "navigationLink"
  | "palette"
  | "segmented"
  | "wheel";

// ============================================================================
// Form Controls & Input
// ============================================================================

export type DisplayedComponents = "date" | "hourAndMinute" | "dateAndTime";

export type ControlSize = "mini" | "small" | "regular" | "large" | "extraLarge";

export type KeyboardType =
  | "default"
  | "asciiCapable"
  | "numbersAndPunctuation"
  | "URL"
  | "numberPad"
  | "phonePad"
  | "namePhonePad"
  | "emailAddress"
  | "decimalPad"
  | "twitter"
  | "webSearch"
  | "asciiCapableNumberPad";

export type AutocapitalizationType = "none" | "words" | "sentences" | "allCharacters";

export type TextContentType =
  | "name"
  | "namePrefix"
  | "givenName"
  | "middleName"
  | "familyName"
  | "nameSuffix"
  | "nickname"
  | "emailAddress"
  | "telephoneNumber"
  | "URL"
  | "streetAddressLine1"
  | "streetAddressLine2"
  | "fullStreetAddress"
  | "addressCity"
  | "addressState"
  | "addressCityAndState"
  | "postalCode"
  | "countryName"
  | "organizationName"
  | "jobTitle"
  | "username"
  | "password"
  | "newPassword"
  | "oneTimeCode"
  | "creditCardNumber"
  | "birthdate"
  | "birthdateDay"
  | "birthdateMonth"
  | "birthdateYear"
  | "dateTime"
  | "location"
  | "flightNumber"
  | "shipmentTrackingNumber";

export type SubmitLabel =
  | "done"
  | "go"
  | "send"
  | "join"
  | "route"
  | "search"
  | "return"
  | "next"
  | "continue";

// ============================================================================
// Accessibility
// ============================================================================

export type AccessibilityChildBehavior = "contain" | "ignore" | "combine";

// ============================================================================
// Navigation
// ============================================================================

export type NavigationBarTitleDisplayMode = "automatic" | "inline" | "large";

// ============================================================================
// Presentation
// ============================================================================

export type PresentationDetent =
  | "medium"
  | "large"
  | { type: "fraction"; value: number }
  | { type: "height"; value: number };

export type Visibility = "automatic" | "visible" | "hidden";

// ============================================================================
// WebView
// ============================================================================

export type UserScriptInjectionTime = "atDocumentStart" | "atDocumentEnd";

// ============================================================================
// Layout Regions
// ============================================================================

export type SafeAreaRegion = "top" | "bottom" | "leading" | "trailing";

// ============================================================================
// List Row
// ============================================================================

export type VerticalEdges = "top" | "bottom" | "all";
