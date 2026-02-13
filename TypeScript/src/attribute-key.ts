// Attribute keys that match SwiftUIML AttributeKey
// These provide type-safe keys for node attributes

export class AttributeKey {
  readonly value: string;

  constructor(value: string) {
    this.value = value;
  }

  toString(): string {
    return this.value;
  }

  // Basic keys
  static readonly id = new AttributeKey("id");
  static readonly nodeId = new AttributeKey("nodeId");
  static readonly type = new AttributeKey("type");
  static readonly Name = new AttributeKey("name"); // Capital N to avoid conflict with Function.name
  static readonly value = new AttributeKey("value");
  static readonly oldValue = new AttributeKey("oldValue");
  static readonly url = new AttributeKey("url");
  static readonly bundle = new AttributeKey("bundle");
  static readonly message = new AttributeKey("message");
  static readonly systemName = new AttributeKey("systemName");
  static readonly enabled = new AttributeKey("enabled");
  static readonly pattern = new AttributeKey("pattern");
  static readonly attributes = new AttributeKey("attributes");
  static readonly inherit = new AttributeKey("inherit");
  static readonly style = new AttributeKey("style");

  static readonly text = new AttributeKey("text");
  static readonly title = new AttributeKey("title");
  static readonly label = new AttributeKey("label");
  static readonly header = new AttributeKey("header");
  static readonly footer = new AttributeKey("footer");
  static readonly weight = new AttributeKey("weight");
  static readonly markdown = new AttributeKey("markdown");
  static readonly design = new AttributeKey("design");
  static readonly size = new AttributeKey("size");
  static readonly fixedSize = new AttributeKey("fixedSize");
  static readonly relativeTo = new AttributeKey("relativeTo");
  static readonly total = new AttributeKey("total");
  static readonly currentValue = new AttributeKey("currentValue");
  static readonly tag = new AttributeKey("tag");
  static readonly tabItem = new AttributeKey("tabItem");
  static readonly badge = new AttributeKey("badge");
  static readonly tabViewStyle = new AttributeKey("tabViewStyle");
  static readonly textFieldStyle = new AttributeKey("textFieldStyle");
  static readonly buttonStyle = new AttributeKey("buttonStyle");
  static readonly progressViewStyle = new AttributeKey("progressViewStyle");
  static readonly listStyle = new AttributeKey("listStyle");
  static readonly listRowBackground = new AttributeKey("listRowBackground");
  static readonly listRowInsets = new AttributeKey("listRowInsets");
  static readonly listRowSeparator = new AttributeKey("listRowSeparator");
  static readonly ignoreEquatable = new AttributeKey("ignoreEquatable");
  static readonly toggleStyle = new AttributeKey("toggleStyle");
  static readonly pickerStyle = new AttributeKey("pickerStyle");
  static readonly labelsHidden = new AttributeKey("labelsHidden");
  static readonly buttonBorderShape = new AttributeKey("buttonBorderShape");

  // Gradient properties
  static readonly colors = new AttributeKey("colors");
  static readonly colorStops = new AttributeKey("colorStops");
  static readonly startPoint = new AttributeKey("startPoint");
  static readonly endPoint = new AttributeKey("endPoint");

  static readonly padding = new AttributeKey("padding");
  static readonly resizable = new AttributeKey("resizable");
  static readonly frame = new AttributeKey("frame");
  static readonly containerRelativeFrame = new AttributeKey("containerRelativeFrame");
  static readonly horizontal = new AttributeKey("horizontal");
  static readonly vertical = new AttributeKey("vertical");

  // Text modifiers
  static readonly font = new AttributeKey("font");
  static readonly bold = new AttributeKey("bold");
  static readonly italic = new AttributeKey("italic");
  static readonly underline = new AttributeKey("underline");
  static readonly strikethrough = new AttributeKey("strikethrough");
  static readonly kerning = new AttributeKey("kerning");
  static readonly tracking = new AttributeKey("tracking");
  static readonly lineSpacing = new AttributeKey("lineSpacing");
  static readonly minimumScaleFactor = new AttributeKey("minimumScaleFactor");
  static readonly fontWeight = new AttributeKey("fontWeight");
  static readonly foregroundColor = new AttributeKey("foregroundColor");
  static readonly lineLimit = new AttributeKey("lineLimit");
  static readonly multilineTextAlignment = new AttributeKey("multilineTextAlignment");
  static readonly textSelection = new AttributeKey("textSelection");
  static readonly truncationMode = new AttributeKey("truncationMode");
  static readonly allowsTightening = new AttributeKey("allowsTightening");
  static readonly baselineOffset = new AttributeKey("baselineOffset");

  // General modifiers
  static readonly backgroundColor = new AttributeKey("backgroundColor");
  static readonly background = new AttributeKey("background");
  static readonly dark = new AttributeKey("dark");
  static readonly light = new AttributeKey("light");
  static readonly overlay = new AttributeKey("overlay");
  static readonly mask = new AttributeKey("mask");
  static readonly clipShape = new AttributeKey("clipShape");
  static readonly fill = new AttributeKey("fill");
  static readonly stroke = new AttributeKey("stroke");
  static readonly trim = new AttributeKey("trim");
  static readonly from = new AttributeKey("from");
  static readonly to = new AttributeKey("to");
  static readonly border = new AttributeKey("border");
  static readonly lineWidth = new AttributeKey("lineWidth");
  static readonly color = new AttributeKey("color");
  static readonly location = new AttributeKey("location");
  static readonly tint = new AttributeKey("tint");
  static readonly colorScheme = new AttributeKey("colorScheme");
  static readonly colorSchemeConditional = new AttributeKey("colorSchemeConditional");
  static readonly preferredColorScheme = new AttributeKey("preferredColorScheme");
  static readonly responsive = new AttributeKey("responsive");
  static readonly shadow = new AttributeKey("shadow");
  static readonly blur = new AttributeKey("blur");
  static readonly brightness = new AttributeKey("brightness");
  static readonly contrast = new AttributeKey("contrast");
  static readonly saturation = new AttributeKey("saturation");
  static readonly grayscale = new AttributeKey("grayscale");
  static readonly hueRotation = new AttributeKey("hueRotation");
  static readonly colorInvert = new AttributeKey("colorInvert");
  static readonly luminanceToAlpha = new AttributeKey("luminanceToAlpha");
  static readonly colorMultiply = new AttributeKey("colorMultiply");
  static readonly renderingMode = new AttributeKey("renderingMode");
  static readonly opacity = new AttributeKey("opacity");
  static readonly blendMode = new AttributeKey("blendMode");
  static readonly opaque = new AttributeKey("opaque");
  static readonly hidden = new AttributeKey("hidden");
  static readonly redacted = new AttributeKey("redacted");
  static readonly privacySensitive = new AttributeKey("privacySensitive");
  static readonly cornerRadius = new AttributeKey("cornerRadius");
  static readonly clipped = new AttributeKey("clipped");
  static readonly ignoresSafeArea = new AttributeKey("ignoresSafeArea");
  static readonly safeAreaInset = new AttributeKey("safeAreaInset");

  // Layout modifiers (HStack/VStack/ZStack/ScrollView)
  static readonly spacing = new AttributeKey("spacing");
  static readonly horizontalSpacing = new AttributeKey("horizontalSpacing");
  static readonly verticalSpacing = new AttributeKey("verticalSpacing");
  static readonly alignment = new AttributeKey("alignment");
  static readonly axis = new AttributeKey("axis");
  static readonly scrollBounceBehavior = new AttributeKey("scrollBounceBehavior");
  static readonly scrollTargetBehavior = new AttributeKey("scrollTargetBehavior");
  static readonly scrollTargetLayout = new AttributeKey("scrollTargetLayout");
  static readonly scrollDisabled = new AttributeKey("scrollDisabled");
  static readonly scrollIndicators = new AttributeKey("scrollIndicators");
  static readonly aspectRatio = new AttributeKey("aspectRatio");
  static readonly ratio = new AttributeKey("ratio");
  static readonly contentMode = new AttributeKey("contentMode");
  static readonly offset = new AttributeKey("offset");
  static readonly position = new AttributeKey("position");
  static readonly rotationEffect = new AttributeKey("rotationEffect");
  static readonly rotation3DEffect = new AttributeKey("rotation3DEffect");
  static readonly perspective = new AttributeKey("perspective");
  static readonly scaleEffect = new AttributeKey("scaleEffect");
  static readonly gridCellColumns = new AttributeKey("gridCellColumns");
  static readonly columns = new AttributeKey("columns");
  static readonly rows = new AttributeKey("rows");
  static readonly layoutPriority = new AttributeKey("layoutPriority");
  static readonly coordinateSpace = new AttributeKey("coordinateSpace");

  // Frame properties
  static readonly width = new AttributeKey("width");
  static readonly minWidth = new AttributeKey("minWidth");
  static readonly maxWidth = new AttributeKey("maxWidth");
  static readonly idealWidth = new AttributeKey("idealWidth");

  static readonly height = new AttributeKey("height");
  static readonly minHeight = new AttributeKey("minHeight");
  static readonly maxHeight = new AttributeKey("maxHeight");
  static readonly idealHeight = new AttributeKey("idealHeight");

  // Padding properties
  static readonly top = new AttributeKey("top");
  static readonly leading = new AttributeKey("leading");
  static readonly bottom = new AttributeKey("bottom");
  static readonly trailing = new AttributeKey("trailing");

  // Corner properties
  static readonly topLeading = new AttributeKey("topLeading");
  static readonly topTrailing = new AttributeKey("topTrailing");
  static readonly bottomLeading = new AttributeKey("bottomLeading");
  static readonly bottomTrailing = new AttributeKey("bottomTrailing");

  static readonly radius = new AttributeKey("radius");
  static readonly startRadius = new AttributeKey("startRadius");
  static readonly endRadius = new AttributeKey("endRadius");
  static readonly startAngle = new AttributeKey("startAngle");
  static readonly endAngle = new AttributeKey("endAngle");
  static readonly x = new AttributeKey("x");
  static readonly y = new AttributeKey("y");
  static readonly z = new AttributeKey("z");
  static readonly anchor = new AttributeKey("anchor");
  static readonly anchorZ = new AttributeKey("anchorZ");
  static readonly center = new AttributeKey("center");
  static readonly degrees = new AttributeKey("degrees");
  static readonly radians = new AttributeKey("radians");
  static readonly zero = new AttributeKey("zero");

  // Interaction modifiers
  static readonly onTap = new AttributeKey("onTap");
  static readonly onTapGesture = new AttributeKey("onTapGesture");
  static readonly onLongPressGesture = new AttributeKey("onLongPressGesture");
  static readonly minimumDuration = new AttributeKey("minimumDuration");
  static readonly onAppear = new AttributeKey("onAppear");
  static readonly onDisappear = new AttributeKey("onDisappear");
  static readonly disabled = new AttributeKey("disabled");

  // Form controls
  static readonly placeholder = new AttributeKey("placeholder");
  static readonly onTextChange = new AttributeKey("onTextChange");
  static readonly onSubmit = new AttributeKey("onSubmit");
  static readonly keyboardType = new AttributeKey("keyboardType");
  static readonly autocapitalization = new AttributeKey("autocapitalization");
  static readonly textContentType = new AttributeKey("textContentType");
  static readonly submitLabel = new AttributeKey("submitLabel");
  static readonly onFocus = new AttributeKey("onFocus");
  static readonly onBlur = new AttributeKey("onBlur");
  static readonly oldText = new AttributeKey("oldText");
  static readonly isOn = new AttributeKey("isOn");
  static readonly onToggle = new AttributeKey("onToggle");
  static readonly minimumValue = new AttributeKey("minimumValue");
  static readonly maximumValue = new AttributeKey("maximumValue");
  static readonly currentValueLabel = new AttributeKey("currentValueLabel");
  static readonly minimumValueLabel = new AttributeKey("minimumValueLabel");
  static readonly maximumValueLabel = new AttributeKey("maximumValueLabel");
  static readonly step = new AttributeKey("step");
  static readonly onSliderChange = new AttributeKey("onSliderChange");
  static readonly onStepperChange = new AttributeKey("onStepperChange");
  static readonly onPickerChange = new AttributeKey("onPickerChange");
  static readonly selection = new AttributeKey("selection");
  static readonly isExpanded = new AttributeKey("isExpanded");
  static readonly onExpandedChange = new AttributeKey("onExpandedChange");
  static readonly displayedComponents = new AttributeKey("displayedComponents");
  static readonly minimumDate = new AttributeKey("minimumDate");
  static readonly maximumDate = new AttributeKey("maximumDate");
  static readonly onDateChange = new AttributeKey("onDateChange");
  static readonly locale = new AttributeKey("locale");
  static readonly timeZone = new AttributeKey("timeZone");
  static readonly controlSize = new AttributeKey("controlSize");
  static readonly onColorChange = new AttributeKey("onColorChange");
  static readonly supportsOpacity = new AttributeKey("supportsOpacity");

  // Navigation modifiers
  static readonly sheet = new AttributeKey("sheet");
  static readonly fullScreenCover = new AttributeKey("fullScreenCover");
  static readonly alert = new AttributeKey("alert");
  static readonly confirmationDialog = new AttributeKey("confirmationDialog");
  static readonly popover = new AttributeKey("popover");
  static readonly navigationDestination = new AttributeKey("navigationDestination");
  static readonly navigationDestinations = new AttributeKey("navigationDestinations");
  static readonly toolbar = new AttributeKey("toolbar");
  static readonly navigationDestinationKey = new AttributeKey("navigationDestinationKey");
  static readonly navigationTitle = new AttributeKey("navigationTitle");
  static readonly navigationBarTitleDisplayMode = new AttributeKey("navigationBarTitleDisplayMode");
  static readonly navigationBarHidden = new AttributeKey("navigationBarHidden");
  static readonly navigationBarBackButtonHidden = new AttributeKey("navigationBarBackButtonHidden");
  static readonly content = new AttributeKey("content");
  static readonly presentedId = new AttributeKey("presentedId");
  static readonly isPresented = new AttributeKey("isPresented");
  static readonly onPresented = new AttributeKey("onPresented");
  static readonly onDismiss = new AttributeKey("onDismiss");
  static readonly animated = new AttributeKey("animated");
  static readonly presentationDetents = new AttributeKey("presentationDetents");
  static readonly presentationDragIndicator = new AttributeKey("presentationDragIndicator");
  static readonly interactiveDismissDisabled = new AttributeKey("interactiveDismissDisabled");
  static readonly buttons = new AttributeKey("buttons");
  static readonly role = new AttributeKey("role");
  static readonly action = new AttributeKey("action");

  // Accessibility
  static readonly accessibilityLabel = new AttributeKey("accessibilityLabel");
  static readonly accessibilityHint = new AttributeKey("accessibilityHint");
  static readonly accessibilityValue = new AttributeKey("accessibilityValue");
  static readonly accessibilityHidden = new AttributeKey("accessibilityHidden");
  static readonly accessibilityIdentifier = new AttributeKey("accessibilityIdentifier");
  static readonly accessibilityTraits = new AttributeKey("accessibilityTraits");
  static readonly accessibilityRemoveTraits = new AttributeKey("accessibilityRemoveTraits");
  static readonly accessibilitySortPriority = new AttributeKey("accessibilitySortPriority");
  static readonly accessibilityElement = new AttributeKey("accessibilityElement");
  static readonly accessibilityInputLabels = new AttributeKey("accessibilityInputLabels");
  static readonly accessibilityAction = new AttributeKey("accessibilityAction");

  // Webview
  static readonly html = new AttributeKey("html");
  static readonly javascriptBridge = new AttributeKey("javascriptBridge");
  static readonly allowlist = new AttributeKey("allowlist");
  static readonly injectionTime = new AttributeKey("injectionTime");
  static readonly mainFrameOnly = new AttributeKey("mainFrameOnly");
  static readonly isScrollEnabled = new AttributeKey("isScrollEnabled");
  static readonly isInspectable = new AttributeKey("isInspectable");

  // Animation
  static readonly animation = new AttributeKey("animation");
  static readonly attribute = new AttributeKey("attribute");
  static readonly next = new AttributeKey("next");
  static readonly duration = new AttributeKey("duration");
  static readonly delay = new AttributeKey("delay");
  static readonly speed = new AttributeKey("speed");
  static readonly response = new AttributeKey("response");
  static readonly dampingFraction = new AttributeKey("dampingFraction");
  static readonly blendDuration = new AttributeKey("blendDuration");
  static readonly count = new AttributeKey("count");
  static readonly autoreverses = new AttributeKey("autoreverses");
  static readonly edges = new AttributeKey("edges");
  static readonly visibility = new AttributeKey("visibility");

  // Factory method for custom keys
  static custom(value: string): AttributeKey {
    return new AttributeKey(value);
  }
}
