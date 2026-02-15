public extension Node {
  /// Alignment options for frames and containers
  enum Alignment: String, CaseIterable {
    case topLeading
    case top
    case topTrailing
    case leading
    case center
    case trailing
    case bottomLeading
    case bottom
    case bottomTrailing
  }
  
  /// Vertical alignment for HStack
  enum VerticalAlignment: String, CaseIterable {
    case top
    case center
    case bottom
    case firstTextBaseline
    case lastTextBaseline
  }
  
  /// Horizontal alignment for VStack
  enum HorizontalAlignment: String, CaseIterable {
    case leading
    case center
    case trailing
  }
  
  /// Axis for scroll views and layout
  enum Axis: String, CaseIterable {
    case vertical
    case horizontal
  }
  
  /// Axis set for multi-axis layouts
  enum AxisSet {
    case horizontal
    case vertical
    case both
    
    var stringValue: String {
      switch self {
      case .horizontal: return "horizontal"
      case .vertical: return "vertical"
      case .both: return "both"
      }
    }
  }

  /// Text alignment for multiline text
  enum TextAlignment: String, CaseIterable {
    case leading
    case center
    case trailing
  }

  /// Text truncation mode
  enum TruncationMode: String, CaseIterable {
    case head
    case tail
    case middle
  }

  /// Font text styles (system fonts)
  enum FontStyle: String, CaseIterable {
    case largeTitle
    case title
    case title2
    case title3
    case headline
    case subheadline
    case body
    case callout
    case caption
    case caption2
    case footnote
  }

  /// Font weights
  enum FontWeight: String, CaseIterable {
    case ultraLight
    case thin
    case light
    case regular
    case medium
    case semibold
    case bold
    case heavy
    case black
  }

  /// Font designs
  enum FontDesign: String, CaseIterable {
    case `default`
    case serif
    case rounded
    case monospaced
  }

  /// Content mode for images and aspect ratios
  enum ContentMode: String, CaseIterable {
    case fit
    case fill
  }

  /// Rendering mode for images
  enum RenderingMode: String, CaseIterable {
    case template
    case original
  }

  /// Blend mode for compositing views
  enum BlendMode: String, CaseIterable {
    case normal
    case multiply
    case screen
    case overlay
    case darken
    case lighten
    case colorDodge
    case colorBurn
    case softLight
    case hardLight
    case difference
    case exclusion
    case hue
    case saturation
    case color
    case luminosity
    case sourceAtop
    case destinationOver
    case destinationOut
    case plusDarker
    case plusLighter
  }

  /// Scroll bounce behavior
  enum ScrollBounceBehavior: String, CaseIterable {
    case always
    case basedOnSize
    case never
  }

  /// Scroll target behavior for snapping
  enum ScrollTargetBehavior: String, CaseIterable {
    case paging
    case viewAligned
  }

  /// General visibility options
  enum Visibility: String, CaseIterable {
    case automatic
    case visible
    case hidden
  }

  /// Scroll indicator visibility
  enum ScrollIndicatorVisibility: String, CaseIterable {
    case automatic
    case visible
    case hidden
    case never
  }

  /// Redaction reasons
  enum RedactionReasons: String, CaseIterable {
    case placeholder
    case privacy
  }

  /// TabView style
  enum TabViewStyle: String, CaseIterable {
    case automatic
    case page
  }

  /// TextField style
  enum TextFieldStyle: String, CaseIterable {
    case automatic
    case plain
    case roundedBorder
  }

  /// Button style
  enum ButtonStyle: String, CaseIterable {
    case automatic
    case plain
    case bordered
    case borderedProminent
    case borderless
  }

  /// ProgressView style
  enum ProgressViewStyle: String, CaseIterable {
    case automatic
    case linear
    case circular
  }

  /// List style
  enum ListStyle: String, CaseIterable {
    case automatic
    case plain
    case grouped
    case inset
    case insetGrouped
    case sidebar
  }

  /// Toggle style
  enum ToggleStyle: String, CaseIterable {
    case automatic
    case `switch`
    case button
  }

  /// Picker style
  enum PickerStyle: String, CaseIterable {
    case automatic
    case inline
    case menu
    case navigationLink
    case palette
    case segmented
    case wheel
  }

  /// Button border shape
  enum ButtonBorderShape: String, CaseIterable {
    case automatic
    case capsule
    case roundedRectangle
  }

  /// When to inject a javascript bridge for a WebView
  enum UserScriptInjectionTime: String, CaseIterable {
    case atDocumentStart
    case atDocumentEnd
  }

  /// Text selection behavior
  enum TextSelection: String, CaseIterable {
    case enabled
    case disabled
  }

  /// Safe area regions for insets
  enum SafeAreaRegion: String, CaseIterable {
    case top
    case bottom
    case leading
    case trailing
  }

  /// Vertical edges for list row separators
  enum VerticalEdges: String, CaseIterable {
    case top
    case bottom
    case all
  }

  /// Unit point for gradient positioning
  enum UnitPoint: String, CaseIterable {
    case topLeading
    case top
    case topTrailing
    case leading
    case center
    case trailing
    case bottomLeading
    case bottom
    case bottomTrailing
  }
  
  /// Color scheme options
  enum ColorScheme: String, CaseIterable {
    case light
    case dark
    case system
  }

  /// Control size options for buttons, pickers, and other controls
  enum ControlSize: String, CaseIterable {
    case mini
    case small
    case regular
    case large
    case extraLarge
  }

  /// Edge set for safe area and other edge-based modifiers
  enum Edge: String, CaseIterable {
    case all
    case top
    case bottom
    case leading
    case trailing
    case horizontal
    case vertical
  }

  /// DatePicker components to display
  enum DatePickerComponents: String, CaseIterable {
    case date
    case hourAndMinute
    case dateAndTime
  }

  /// Navigation bar title display mode
  enum NavigationBarTitleDisplayMode: String, CaseIterable {
    case automatic
    case inline
    case large
  }

  /// Angle for rotations and other angle-based modifiers
  enum Angle {
    case degrees(Double)
    case radians(Double)
    case zero

    var attributeValue: AttributeValue {
      switch self {
      case .degrees(let value):
        return .dict([.degrees: .number(value)])
      case .radians(let value):
        return .dict([.radians: .number(value)])
      case .zero:
        return .dict([.zero: .bool(true)])
      }
    }
  }

  /// Accessibility child behavior
  enum AccessibilityChildBehavior: String, CaseIterable {
    case contain
    case ignore
    case combine
  }

  /// Keyboard type for text input
  enum KeyboardType: String, CaseIterable {
    case `default`
    case asciiCapable
    case numbersAndPunctuation
    case URL
    case numberPad
    case phonePad
    case namePhonePad
    case emailAddress
    case decimalPad
    case twitter
    case webSearch
    case asciiCapableNumberPad
  }

  /// Autocapitalization type for text input
  enum AutocapitalizationType: String, CaseIterable {
    case none
    case words
    case sentences
    case allCharacters
  }

  /// Text content type for semantic meaning and AutoFill
  enum TextContentType: String, CaseIterable {
    // Names
    case name
    case namePrefix
    case givenName
    case middleName
    case familyName
    case nameSuffix
    case nickname

    // Contact information
    case emailAddress
    case telephoneNumber
    case URL

    // Address
    case streetAddressLine1
    case streetAddressLine2
    case fullStreetAddress
    case addressCity
    case addressState
    case addressCityAndState
    case postalCode
    case countryName

    // Organization
    case organizationName
    case jobTitle

    // Authentication
    case username
    case password
    case newPassword
    case oneTimeCode

    // Payment
    case creditCardNumber

    // Date and time
    case birthdate
    case birthdateDay
    case birthdateMonth
    case birthdateYear
    case dateTime

    // Location
    case location

    // Tracking
    case flightNumber
    case shipmentTrackingNumber
  }

  /// Submit label for the return key on the keyboard
  enum SubmitLabel: String, CaseIterable {
    case done
    case go
    case send
    case join
    case route
    case search
    case `return`
    case next
    case `continue`
  }

  /// Presentation detent for sheets and popovers
  enum PresentationDetent {
    /// Medium detent (approximately half height)
    case medium
    /// Large detent (full height)
    case large
    /// Custom fraction of available height (0.0 to 1.0)
    case fraction(Double)
    /// Custom fixed height
    case height(Double)

    /// Convert to AttributeValue for use in node attributes
    public var attributeValue: AttributeValue {
      switch self {
      case .medium:
        return .string("medium")
      case .large:
        return .string("large")
      case .fraction(let value):
        return .dict([.type: .string("fraction"), .value: .number(value)])
      case .height(let value):
        return .dict([.type: .string("height"), .value: .number(value)])
      }
    }
  }

  /// Color stop for gradients with precise color positioning
  /// - color: Color string (hex or named color)
  /// - location: Position along the gradient from 0.0 to 1.0
  typealias ColorStop = (color: String, location: Double)

  /// SceneKit light types
  enum LightType: String, CaseIterable {
    case omni
    case directional
    case spot
    case ambient
    case area
    case probe
    case ies
  }

  /// SceneKit texture wrapping modes
  enum TextureWrapMode: String, CaseIterable {
    case clamp
    case `repeat`
    case clampToBorder
    case mirror
  }

  /// SceneKit texture filtering modes
  enum TextureFilterMode: String, CaseIterable {
    case nearest
    case linear
  }
}
