//
//  TestCase.swift
//  SwiftUIML
//
//  Test case ID constants for StandardizedSuite
//

struct TestCase {
  struct modifier {
    struct padding {
      static let uniform = "modifier.padding.uniform"
      static let edgeSpecific = "modifier.padding.edge-specific"
      static let none = "modifier.padding.none"
    }

    struct foregroundColor {
      static let conditional = "modifier.foreground-color.conditional"
      static let named = "modifier.foreground-color.named"
    }

    struct frame {
      static let fixedWidthHeight = "modifier.frame.fixed-width-height"
      static let widthOnly = "modifier.frame.width-only"
      static let heightOnly = "modifier.frame.height-only"
      static let maxWidthInfinity = "modifier.frame.max-width-infinity"
      static let maxHeightInfinity = "modifier.frame.max-height-infinity"
      static let multipleModifiers = "modifier.frame.multiple-modifiers"
      static let chainedConstraints = "modifier.frame.chained-constraints"
    }

    struct backgroundColor {
      static let solid = "modifier.background-color.solid"
      static let semiTransparent = "modifier.background-color.semi-transparent"
      static let multiple = "modifier.background-color.multiple"
    }

    struct background {
      static let color = "modifier.background.color"
      static let gradient = "modifier.background.gradient"
      static let aligned = "modifier.background.aligned"
    }

    struct opacity {
      static let full = "modifier.opacity.full"
      static let half = "modifier.opacity.half"
      static let low = "modifier.opacity.low"
      static let zero = "modifier.opacity.zero"
    }

    struct bold {
      static let text = "modifier.bold.text"
      static let withColor = "modifier.bold.with-color"
    }

    struct italic {
      static let text = "modifier.italic.text"
      static let withColor = "modifier.italic.with-color"
    }

    struct fontWeight {
      static let light = "modifier.font-weight.light"
      static let regular = "modifier.font-weight.regular"
      static let semibold = "modifier.font-weight.semibold"
      static let bold = "modifier.font-weight.bold"
      static let heavy = "modifier.font-weight.heavy"
      static let comparison = "modifier.font-weight.comparison"
    }

    struct border {
      static let thin = "modifier.border.thin"
      static let thick = "modifier.border.thick"
      static let colored = "modifier.border.colored"
    }

    struct cornerRadius {
      static let small = "modifier.corner-radius.small"
      static let medium = "modifier.corner-radius.medium"
      static let large = "modifier.corner-radius.large"
    }

    struct shadow {
      static let drop = "modifier.shadow.drop"
      static let colored = "modifier.shadow.colored"
      static let largeRadius = "modifier.shadow.large-radius"
      static let toGlow = "modifier.shadow.to-glow"
    }

    struct offset {
      static let x = "modifier.offset.x"
      static let y = "modifier.offset.y"
      static let xy = "modifier.offset.xy"
    }

    struct clipShape {
      static let circle = "modifier.clip-shape.circle"
      static let capsule = "modifier.clip-shape.capsule"
    }

    struct aspectRatio {
      static let fit = "modifier.aspect-ratio.fit"
      static let fill = "modifier.aspect-ratio.fill"
      static let wide = "modifier.aspect-ratio.wide"
    }

    struct overlay {
      static let centered = "modifier.overlay.centered"
      static let topLeading = "modifier.overlay.top-leading"
      static let bottomTrailing = "modifier.overlay.bottom-trailing"
      static let icon = "modifier.overlay.icon"
    }

    struct mask {
      static let circle = "modifier.mask.circle"
      static let roundedRectangle = "modifier.mask.rounded-rectangle"
      static let capsule = "modifier.mask.capsule"
    }

    struct fixedSize {
      static let bothAxes = "modifier.fixed-size.both-axes"
      static let horizontalOnly = "modifier.fixed-size.horizontal-only"
      static let verticalOnly = "modifier.fixed-size.vertical-only"
    }

    struct lineLimit {
      static let one = "modifier.line-limit.one"
      static let two = "modifier.line-limit.two"
      static let three = "modifier.line-limit.three"
      static let none = "modifier.line-limit.none"
    }

    struct multilineTextAlignment {
      static let leading = "modifier.multiline-text-alignment.leading"
      static let center = "modifier.multiline-text-alignment.center"
      static let trailing = "modifier.multiline-text-alignment.trailing"
    }

    struct underline {
      static let basic = "modifier.underline.basic"
      static let withColor = "modifier.underline.with-color"
      static let active = "modifier.underline.active"
    }

    struct strikethrough {
      static let basic = "modifier.strikethrough.basic"
      static let withColor = "modifier.strikethrough.with-color"
      static let active = "modifier.strikethrough.active"
    }

    struct kerning {
      static let variations = "modifier.kerning.variations"
      static let differentValues = "modifier.kerning.different-values"
    }

    struct lineSpacing {
      static let differentValues = "modifier.line-spacing.different-values"
    }

    struct baselineOffset {
      static let differentValues = "modifier.baseline-offset.different-values"
      static let subscriptSuperscript = "modifier.baseline-offset.subscript-superscript"
    }

    struct tracking {
      static let variations = "modifier.tracking.variations"
      static let differentValues = "modifier.tracking.different-values"
    }

    struct allowsTightening {
      static let basic = "modifier.allows-tightening.basic"
    }

    struct minimumScaleFactor {
      static let variations = "modifier.minimum-scale-factor.variations"
      static let differentValues = "modifier.minimum-scale-factor.different-values"
    }

    struct truncationMode {
      static let variations = "modifier.truncation-mode.variations"
      static let multiline = "modifier.truncation-mode.multiline"
    }

    struct brightness {
      static let variations = "modifier.brightness.variations"
      static let onImage = "modifier.brightness.on-image"
    }

    struct containerRelativeFrame {
      static let horizontal = "modifier.container-relative-frame.horizontal"
      static let vertical = "modifier.container-relative-frame.vertical"
      static let both = "modifier.container-relative-frame.both"
      static let spanMultiple = "modifier.container-relative-frame.span-multiple"
      static let withSpacing = "modifier.container-relative-frame.with-spacing"
      static let alignment = "modifier.container-relative-frame.alignment"
      static let complexLayout = "modifier.container-relative-frame.complex-layout"
    }

    struct position {
      static let center = "modifier.position.center"
      static let topLeft = "modifier.position.top-left"
      static let bottomRight = "modifier.position.bottom-right"
    }

    struct ignoresSafeArea {
      static let all = "modifier.ignores-safe-area.all"
      static let top = "modifier.ignores-safe-area.top"
      static let bottom = "modifier.ignores-safe-area.bottom"
    }

    struct buttonStyle {
      static let variations = "modifier.button-style.variations"
    }

    struct buttonBorderShape {
      static let variations = "modifier.button-border-shape.variations"
    }

    struct layoutPriority {
      static let inHStack = "modifier.layout-priority.in-hstack"
      static let comparison = "modifier.layout-priority.comparison"
      static let textTruncation = "modifier.layout-priority.text-truncation"
    }

    struct labelsHidden {
      static let comparison = "modifier.labels-hidden.comparison"
    }

    struct coordinateSpace {
      static let basic = "modifier.coordinate-space.basic"
      static let multiple = "modifier.coordinate-space.multiple"
    }

    struct safeAreaInset {
      static let top = "modifier.safe-area-inset.top"
      static let bottom = "modifier.safe-area-inset.bottom"
      static let multiple = "modifier.safe-area-inset.multiple"
    }

    struct badge {
      static let string = "modifier.badge.string"
      static let integer = "modifier.badge.integer"
      static let mixed = "modifier.badge.mixed"
    }

    struct redacted {
      static let placeholder = "modifier.redacted.placeholder"
    }

    struct colorScheme {
      static let forcedLight = "modifier.color-scheme.forced-light"
      static let forcedDark = "modifier.color-scheme.forced-dark"
    }

    struct controlSize {
      static let variations = "modifier.control-size.variations"
    }

    struct progressViewStyle {
      static let variations = "modifier.progress-view-style.variations"
    }

    struct toggleStyle {
      static let variations = "modifier.toggle-style.variations"
    }

    struct listRow {
      static let background = "modifier.list-row.background"
      static let insets = "modifier.list-row.insets"
      static let separator = "modifier.list-row.separator"
    }

    struct listStyle {
      static let variations = "modifier.list-style.variations"
    }

    struct pickerStyle {
      static let variations = "modifier.picker-style.variations"
    }

    struct responsive {
      static let cascadingWidth = "modifier.responsive.cascading-width"
      static let cascadingHeight = "modifier.responsive.cascading-height"
      static let cascadingWidthDescending = "modifier.responsive.cascading-width-descending"
      static let cascadingHeightDescending = "modifier.responsive.cascading-height-descending"
      static let mixedOperators = "modifier.responsive.mixed-operators"
      static let widthRanges = "modifier.responsive.width-ranges"
    }

    struct toolbar {
      static let withButtons = "modifier.toolbar.with-buttons"
    }

    struct colorInvert {
      static let basic = "modifier.color-invert.basic"
      static let onImage = "modifier.color-invert.on-image"
    }

    struct colorMultiply {
      static let variations = "modifier.color-multiply.variations"
      static let onImage = "modifier.color-multiply.on-image"
    }

    struct grayscale {
      static let variations = "modifier.grayscale.variations"
      static let onImage = "modifier.grayscale.on-image"
    }

    struct saturation {
      static let variations = "modifier.saturation.variations"
      static let onImage = "modifier.saturation.on-image"
    }

    struct contrast {
      static let variations = "modifier.contrast.variations"
      static let onImage = "modifier.contrast.on-image"
    }

    struct hueRotation {
      static let variations = "modifier.hue-rotation.variations"
      static let onImage = "modifier.hue-rotation.on-image"
    }

    struct blendMode {
      static let variations = "modifier.blend-mode.variations"
      static let colorDodge = "modifier.blend-mode.color-dodge"
    }

    struct luminanceToAlpha {
      static let basic = "modifier.luminance-to-alpha.basic"
      static let onImage = "modifier.luminance-to-alpha.on-image"
    }

    struct blur {
      static let variations = "modifier.blur.variations"
      static let onImage = "modifier.blur.on-image"
    }

    struct scaleEffect {
      static let variations = "modifier.scale-effect.variations"
      static let nonUniform = "modifier.scale-effect.non-uniform"
    }

    struct rotationEffect {
      static let variations = "modifier.rotation-effect.variations"
      static let onImage = "modifier.rotation-effect.on-image"
    }

    struct rotation3DEffect {
      static let xAxis = "modifier.rotation-3d-effect.x-axis"
      static let yAxis = "modifier.rotation-3d-effect.y-axis"
    }

    struct perspective {
      static let variations = "modifier.perspective.variations"
      static let onImage = "modifier.perspective.on-image"
    }

    struct font {
      static let styles = "modifier.font.styles"
      static let sizes = "modifier.font.sizes"
      static let weightsWithStyle = "modifier.font.weights-with-style"
      static let designs = "modifier.font.designs"
      static let customSize = "modifier.font.custom-size"
    }

    struct disabled {
      static let button = "modifier.disabled.button"
      static let text = "modifier.disabled.text"
      static let multipleControls = "modifier.disabled.multiple-controls"
      static let withColor = "modifier.disabled.with-color"
    }

    struct hidden {
      static let basic = "modifier.hidden.basic"
      static let inStack = "modifier.hidden.in-stack"
      static let conditional = "modifier.hidden.conditional"
    }

    struct clipped {
      static let basic = "modifier.clipped.basic"
      static let rotated = "modifier.clipped.rotated"
      static let scaled = "modifier.clipped.scaled"
    }

    struct tint {
      static let button = "modifier.tint.button"
      static let image = "modifier.tint.image"
      static let progressView = "modifier.tint.progress-view"
    }

    struct renderingMode {
      static let template = "modifier.rendering-mode.template"
      static let original = "modifier.rendering-mode.original"
      static let withTint = "modifier.rendering-mode.with-tint"
    }

    struct resizable {
      static let basic = "modifier.resizable.basic"
      static let aspectFit = "modifier.resizable.aspect-fit"
      static let symbol = "modifier.resizable.symbol"
      static let differentSizes = "modifier.resizable.different-sizes"
    }

    struct accessibility {
      static let label = "modifier.accessibility.label"
      static let hint = "modifier.accessibility.hint"
      static let value = "modifier.accessibility.value"
      static let identifier = "modifier.accessibility.identifier"
      static let hiddenTrue = "modifier.accessibility.hidden-true"
      static let hiddenFalse = "modifier.accessibility.hidden-false"
      static let traitsSingle = "modifier.accessibility.traits-single"
      static let traitsMultiple = "modifier.accessibility.traits-multiple"
      static let removeTraitsSingle = "modifier.accessibility.remove-traits-single"
      static let removeTraitsMultiple = "modifier.accessibility.remove-traits-multiple"
      static let sortPriority = "modifier.accessibility.sort-priority"
      static let elementContain = "modifier.accessibility.element-contain"
      static let elementIgnore = "modifier.accessibility.element-ignore"
      static let elementCombine = "modifier.accessibility.element-combine"
      static let inputLabels = "modifier.accessibility.input-labels"
      static let action = "modifier.accessibility.action"
      static let combined = "modifier.accessibility.combined"
    }

    struct navigationTitle {
      static let string = "modifier.navigation-title.string"
      static let long = "modifier.navigation-title.long"
      static let empty = "modifier.navigation-title.empty"
    }

    struct navigationBarBackButtonHidden {
      static let `true` = "modifier.navigation-bar-back-button-hidden.true"
      static let `false` = "modifier.navigation-bar-back-button-hidden.false"
    }

    struct navigationBarTitleDisplayMode {
      static let inline = "modifier.navigation-bar-title-display-mode.inline"
      static let large = "modifier.navigation-bar-title-display-mode.large"
      static let automatic = "modifier.navigation-bar-title-display-mode.automatic"
    }

    struct navigationBarHidden {
      static let `true` = "modifier.navigation-bar-hidden.true"
      static let `false` = "modifier.navigation-bar-hidden.false"
    }
  }

  struct view {
    struct text {
      static let basic = "view.text.basic"
      static let markdown = "view.text.markdown"
      static let customFont = "view.text.custom-font"
    }

    struct spacer {
      static let horizontal = "view.spacer.horizontal"
      static let vertical = "view.spacer.vertical"
    }

    struct divider {
      static let basic = "view.divider.basic"
    }

    struct label {
      static let basic = "view.label.basic"
      static let styled = "view.label.styled"
      static let inList = "view.label.in-list"
    }

    struct emptyView {
      static let spacing = "view.empty-view.spacing"
    }

    struct image {
      static let system = "view.image.system"
      static let systemColor = "view.image.system-color"
      static let local = "view.image.local"
    }

    struct asyncImage {
      static let customEmpty = "view.async-image.custom-empty"
    }

    struct hStack {
      static let basicSpacing = "view.hstack.basic-spacing"
      static let alignTop = "view.hstack.align-top"
      static let alignCenter = "view.hstack.align-center"
      static let alignBottom = "view.hstack.align-bottom"
    }

    struct vStack {
      static let basicSpacing = "view.vstack.basic-spacing"
      static let alignLeading = "view.vstack.align-leading"
      static let alignCenter = "view.vstack.align-center"
      static let alignTrailing = "view.vstack.align-trailing"
    }

    struct zStack {
      static let basicLayering = "view.zstack.basic-layering"
      static let alignTopLeading = "view.zstack.align-top-leading"
      static let alignBottomTrailing = "view.zstack.align-bottom-trailing"
    }

    struct lazyHStack {
      static let basicSpacing = "view.lazyhstack.basic-spacing"
      static let alignTop = "view.lazyhstack.align-top"
      static let alignCenter = "view.lazyhstack.align-center"
      static let alignBottom = "view.lazyhstack.align-bottom"
    }

    struct lazyVStack {
      static let basicSpacing = "view.lazyvstack.basic-spacing"
      static let alignLeading = "view.lazyvstack.align-leading"
      static let alignCenter = "view.lazyvstack.align-center"
      static let alignTrailing = "view.lazyvstack.align-trailing"
    }

    struct grid {
      static let basic = "view.grid.basic"
      static let variableColumns = "view.grid.variable-columns"
      static let cellColumns = "view.grid.cell-columns"
    }

    struct lazyHGrid {
      static let basic = "view.lazyhgrid.basic"
      static let alignment = "view.lazyhgrid.alignment"
    }

    struct lazyVGrid {
      static let basic = "view.lazyvgrid.basic"
      static let alignment = "view.lazyvgrid.alignment"
    }

    struct color {
      static let solid = "view.color.solid"
      static let alpha = "view.color.alpha"
      static let conditional = "view.color.conditional"
      static let conditionalAlpha = "view.color.conditional-alpha"
      static let systemColors = "view.color.system-colors"
    }

    struct linearGradient {
      static let basic = "view.lineargradient.basic"
      static let conditional = "view.lineargradient.conditional"
      static let leadingTrailing = "view.lineargradient.leading-trailing"
      static let alpha = "view.lineargradient.alpha"
    }

    struct radialGradient {
      static let basic = "view.radialgradient.basic"
      static let conditional = "view.radialgradient.conditional"
      static let topLeading = "view.radialgradient.top-leading"
      static let bottomTrailing = "view.radialgradient.bottom-trailing"
      static let alpha = "view.radialgradient.alpha"
    }

    struct angularGradient {
      static let basic = "view.angulargradient.basic"
      static let conditional = "view.angulargradient.conditional"
      static let topLeading = "view.angulargradient.top-leading"
      static let bottomTrailing = "view.angulargradient.bottom-trailing"
      static let alpha = "view.angulargradient.alpha"
    }

    struct circle {
      static let filled = "view.circle.filled"
      static let stroked = "view.circle.stroked"
      static let filledAndStroked = "view.circle.filled-and-stroked"
    }

    struct rectangle {
      static let filled = "view.rectangle.filled"
      static let stroked = "view.rectangle.stroked"
      static let filledAndStroked = "view.rectangle.filled-and-stroked"
    }

    struct roundedRectangle {
      static let filled = "view.rounded-rectangle.filled"
      static let stroked = "view.rounded-rectangle.stroked"
      static let smallRadius = "view.rounded-rectangle.small-radius"
      static let largeRadius = "view.rounded-rectangle.large-radius"
    }

    struct capsule {
      static let filled = "view.capsule.filled"
      static let stroked = "view.capsule.stroked"
      static let conditional = "view.capsule.conditional"
    }

    struct ellipse {
      static let filled = "view.ellipse.filled"
      static let stroked = "view.ellipse.stroked"
      static let filledAndStroked = "view.ellipse.filled-and-stroked"
    }

    struct list {
      static let basic = "view.list.basic"
    }

    struct group {
      static let basic = "view.group.basic"
      static let inList = "view.group.in-list"
    }

    struct section {
      static let basic = "view.section.basic"
      static let header = "view.section.header"
      static let footer = "view.section.footer"
      static let headerFooter = "view.section.header-footer"
      static let multiple = "view.section.multiple"
    }

    struct viewThatFits {
      static let horizontal = "view.view-that-fits.horizontal"
      static let vertical = "view.view-that-fits.vertical"
    }

    struct tabView {
      static let basic = "view.tab-view.basic"
    }

    struct groupBox {
      static let configurations = "view.group-box.configurations"
    }

    struct disclosureGroup {
      static let configurations = "view.disclosure-group.configurations"
    }

    struct controlGroup {
      static let basic = "view.control-group.basic"
    }

    struct form {
      static let mixedControls = "view.form.mixed-controls"
    }

    struct button {
      static let basic = "view.button.basic"
      static let styled = "view.button.styled"
    }

    struct colorPicker {
      static let configurations = "view.color-picker.configurations"
    }

    struct progressView {
      static let percentageBased = "view.progress-view.percentage-based"
    }

    struct gauge {
      static let variations = "view.gauge.variations"
    }

    struct datePicker {
      static let configurations = "view.date-picker.configurations"
    }

    struct picker {
      static let configurations = "view.picker.configurations"
    }

    struct textField {
      static let configurations = "view.text-field.configurations"
    }

    struct secureField {
      static let basic = "view.secure-field.basic"
    }

    struct slider {
      static let configurations = "view.slider.configurations"
    }

    struct stepper {
      static let configurations = "view.stepper.configurations"
    }

    struct toggle {
      static let configurations = "view.toggle.configurations"
    }

    struct textEditor {
      static let basic = "view.text-editor.basic"
    }

    struct link {
      static let basic = "view.link.basic"
      static let customLabel = "view.link.custom-label"
      static let styled = "view.link.styled"
      static let withIcon = "view.link.with-icon"
    }

    struct shareLink {
      static let basic = "view.share-link.basic"
      static let withTitle = "view.share-link.with-title"
      static let styled = "view.share-link.styled"
    }

    struct colorScheme {
      static let basicSwitch = "view.color-scheme.basic-switch"
      static let defaultsLight = "view.color-scheme.defaults-light"
      static let respectsOverride = "view.color-scheme.respects-override"
    }

    struct containerRelativeShape {
      static let filledAndStroked = "view.container-relative-shape.filled-and-stroked"
    }

    struct unevenRoundedRectangle {
      static let filled = "view.uneven-rounded-rectangle.filled"
      static let stroked = "view.uneven-rounded-rectangle.stroked"
      static let allCorners = "view.uneven-rounded-rectangle.all-corners"
      static let singleCorner = "view.uneven-rounded-rectangle.single-corner"
    }

    struct navigationLink {
      static let basic = "view.navigation-link.basic"
    }

    struct menu {
      static let basic = "view.menu.basic"
    }

    struct webView {
      static let basic = "view.web-view.basic"
    }
  }
}
