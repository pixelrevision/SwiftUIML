/// A type-safe wrapper for view type identifiers
public struct ViewType: RawRepresentable, Codable, Hashable, Sendable {
  public let rawValue: String

  public init(_ value: String) {
    self.rawValue = value
  }
  
  public init(rawValue: String) {
    self.rawValue = rawValue
  }
}

public extension ViewType {
  // core
  static let text = ViewType("Text")
  static let textField = ViewType("TextField")
  static let textEditor = ViewType("TextEditor")
  static let secureField = ViewType("SecureField")
  static let toggle = ViewType("Toggle")
  static let slider = ViewType("Slider")
  static let stepper = ViewType("Stepper")
  static let picker = ViewType("Picker")
  static let datePicker = ViewType("DatePicker")
  static let colorPicker = ViewType("ColorPicker")
  static let button = ViewType("Button")
  static let link = ViewType("Link")
  static let label = ViewType("Label")
  static let shareLink = ViewType("ShareLink")
  static let spacer = ViewType("Spacer")
  static let divider = ViewType("Divider")
  static let progressView = ViewType("ProgressView")
  static let gauge = ViewType("Gauge")
  static let emptyView = ViewType("EmptyView")
  static let menu = ViewType("Menu")

  // containers
  static let hStack = ViewType("HStack")
  static let vStack = ViewType("VStack")
  static let zStack = ViewType("ZStack")
  static let lazyHStack = ViewType("LazyHStack")
  static let lazyVStack = ViewType("LazyVStack")
  static let list = ViewType("List")
  static let form = ViewType("Form")
  static let group = ViewType("Group")
  static let groupBox = ViewType("GroupBox")
  static let controlGroup = ViewType("ControlGroup")
  static let disclosureGroup = ViewType("DisclosureGroup")
  static let section = ViewType("Section")
  static let viewThatFits = ViewType("ViewThatFits")
  static let grid = ViewType("Grid")
  static let gridRow = ViewType("GridRow")
  static let lazyVGrid = ViewType("LazyVGrid")
  static let lazyHGrid = ViewType("LazyHGrid")
  static let tabView = ViewType("TabView")
  static let scrollView = ViewType("ScrollView")
  static let sceneKit = ViewType("SceneKit")
  static let navigationStack = ViewType("NavigationStack")
  static let navigationLink = ViewType("NavigationLink")
  static let webView = ViewType("WebView")
  // Note: toolbarContent is not a renderable view type - but is used as a key for
  // toolbar children.
  static let toolbarContent = ViewType("ToolbarContent")

  // images and colors
  static let asyncImage = ViewType("AsyncImage")
  static let asyncImageEmpty = ViewType("AsyncImageEmpty")
  static let asyncImageSuccess = ViewType("AsyncImageSuccess")
  static let asyncImageFailure = ViewType("AsyncImageFailure")
  static let image = ViewType("Image")
  static let color = ViewType("Color")
  static let linearGradient = ViewType("LinearGradient")
  static let radialGradient = ViewType("RadialGradient")
  static let angularGradient = ViewType("AngularGradient")
  
  // Shapes
  static let circle = ViewType("Circle")
  static let rectangle = ViewType("Rectangle")
  static let roundedRectangle = ViewType("RoundedRectangle")
  static let unevenRoundedRectangle = ViewType("UnevenRoundedRectangle")
  static let capsule = ViewType("Capsule")
  static let ellipse = ViewType("Ellipse")
  static let containerRelativeShape = ViewType("ContainerRelativeShape")

  // Conditional rendering
  static let colorScheme = ViewType("ColorScheme")

  // SceneKit
  static let skCube = ViewType("SKCube")
  static let skSphere = ViewType("SKSphere")
  static let skCylinder = ViewType("SKCylinder")
  static let skCone = ViewType("SKCone")
  static let skPlane = ViewType("SKPlane")
  static let skTorus = ViewType("SKTorus")
  static let skCapsule = ViewType("SKCapsule")
  static let skPyramid = ViewType("SKPyramid")
  static let skGroup = ViewType("SKGroup")
  static let skCamera = ViewType("SKCamera")
  static let skLight = ViewType("SKLight")
  static let skTexture = ViewType("SKTexture")

  static func custom(_ value: String) -> ViewType {
    ViewType(value)
  }
}
