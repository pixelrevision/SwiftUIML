// View type identifiers that match SwiftUIML ViewType
// These provide type-safe view type names

export class ViewType {
  readonly value: string;

  constructor(value: string) {
    this.value = value;
  }

  toString(): string {
    return this.value;
  }

  // Core views
  static readonly text = new ViewType("Text");
  static readonly button = new ViewType("Button");
  static readonly textField = new ViewType("TextField");
  static readonly textEditor = new ViewType("TextEditor");
  static readonly secureField = new ViewType("SecureField");
  static readonly toggle = new ViewType("Toggle");
  static readonly slider = new ViewType("Slider");
  static readonly stepper = new ViewType("Stepper");
  static readonly picker = new ViewType("Picker");
  static readonly datePicker = new ViewType("DatePicker");
  static readonly colorPicker = new ViewType("ColorPicker");
  static readonly link = new ViewType("Link");
  static readonly label = new ViewType("Label");
  static readonly shareLink = new ViewType("ShareLink");
  static readonly spacer = new ViewType("Spacer");
  static readonly divider = new ViewType("Divider");
  static readonly progressView = new ViewType("ProgressView");
  static readonly gauge = new ViewType("Gauge");
  static readonly emptyView = new ViewType("EmptyView");
  static readonly menu = new ViewType("Menu");

  // Containers
  static readonly hStack = new ViewType("HStack");
  static readonly vStack = new ViewType("VStack");
  static readonly zStack = new ViewType("ZStack");
  static readonly lazyHStack = new ViewType("LazyHStack");
  static readonly lazyVStack = new ViewType("LazyVStack");
  static readonly lazyVGrid = new ViewType("LazyVGrid");
  static readonly lazyHGrid = new ViewType("LazyHGrid");
  static readonly list = new ViewType("List");
  static readonly form = new ViewType("Form");
  static readonly disclosureGroup = new ViewType("DisclosureGroup");
  static readonly group = new ViewType("Group");
  static readonly groupBox = new ViewType("GroupBox");
  static readonly controlGroup = new ViewType("ControlGroup");
  static readonly section = new ViewType("Section");
  static readonly viewThatFits = new ViewType("ViewThatFits");
  static readonly grid = new ViewType("Grid");
  static readonly gridRow = new ViewType("GridRow");
  static readonly tabView = new ViewType("TabView");
  static readonly scrollView = new ViewType("ScrollView");
  static readonly navigationStack = new ViewType("NavigationStack");
  static readonly navigationLink = new ViewType("NavigationLink");
  static readonly webView = new ViewType("WebView");
  // Note: toolbarContent is not a renderable view type - but is used as a key for
  // toolbar children.
  static readonly toolbarContent = new ViewType("ToolbarContent");

  // Images and colors
  static readonly asyncImage = new ViewType("AsyncImage");
  static readonly asyncImageEmpty = new ViewType("AsyncImageEmpty");
  static readonly asyncImageSuccess = new ViewType("AsyncImageSuccess");
  static readonly asyncImageFailure = new ViewType("AsyncImageFailure");
  static readonly image = new ViewType("Image");
  static readonly color = new ViewType("Color");
  static readonly linearGradient = new ViewType("LinearGradient");
  static readonly radialGradient = new ViewType("RadialGradient");
  static readonly angularGradient = new ViewType("AngularGradient");

  // Shapes
  static readonly circle = new ViewType("Circle");
  static readonly rectangle = new ViewType("Rectangle");
  static readonly roundedRectangle = new ViewType("RoundedRectangle");
  static readonly unevenRoundedRectangle = new ViewType("UnevenRoundedRectangle");
  static readonly capsule = new ViewType("Capsule");
  static readonly ellipse = new ViewType("Ellipse");
  static readonly containerRelativeShape = new ViewType("ContainerRelativeShape");

  // Conditional rendering
  static readonly colorScheme = new ViewType("ColorScheme");

  // Factory method for custom view types
  static custom(value: string): ViewType {
    return new ViewType(value);
  }
}
