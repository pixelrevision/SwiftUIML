# SwiftUIML TypeScript

TypeScript DSL for building SwiftUI layouts. Define native iOS UIs using a fluent, declarative API.

Use it to build UI layouts in TypeScript or JavaScript, serialize them as JSON, and render them as native SwiftUI. Works from a Node.js server, an embedded JavaScriptCore runtime on-device, or anywhere JavaScript runs.

## Installation

Install from GitHub:

```bash
npm install github:pixelrevision/SwiftUIML#main:TypeScript
```

Or add to your `package.json`:

```json
{
  "dependencies": {
    "swiftuiml-typescript": "github:pixelrevision/SwiftUIML#main:TypeScript"
  }
}
```

## Quick Example

```typescript
import { Layout, VStack, Text, Button, Color } from 'swiftuiml-typescript';

const layout = new Layout(
  styles,
  VStack(20, "leading", [
    Text("Hello World")
      .customFont("Geist", 34)
      .bold()
      .foregroundColor("#000000:#FFFFFF"),

    Button("Tap Me", { action: "buttonTapped" })
      .padding(12, 20, 12, 20)
      .background(Color("#007AFF:#0A84FF"))
      .cornerRadius(10)
  ])
);

return layout;
```

## Core Concepts

### Views

Create views with helper functions:
```typescript
Text("Hello")
Button("Click", { action: "click" })
VStack(spacing, alignment, children)
HStack(spacing, alignment, children)
ZStack(alignment, children)
ScrollView(axis, children)
Image("imageName")
SystemImage("star.fill")
AsyncImage("https://example.com/image.jpg")
```

### Modifiers

Chain modifiers for styling:
```typescript
Text("Styled")
  .customFont("Helvetica", 17)
  .fontWeight("bold")
  .foregroundColor("#007AFF")
  .padding(16)
  .background(Color("#F5F5F7"))
  .cornerRadius(8)
  .shadow("#00000020", 4, 0, 2)
```

### Styles & Layouts

Define reusable styles:
```typescript
import { Attr, Color } from 'swiftuiml-typescript';

const styles = {
  "title": [
    [Attr.font, { name: "Helvetica", fixedSize: 24 }],
    [Attr.fontWeight, "bold"],
    [Attr.foregroundColor, "#000000:#FFFFFF"]
  ],
  "card": [
    [Attr.padding, 16],
    [Attr.background, Color("#FFFFFF:#1C1C1E")],
    [Attr.cornerRadius, 12]
  ]
};

// Apply styles
Text("Title").style("title")
VStack(12, "leading", [...]).style("card")
```

### Responsive Design

Use breakpoint helpers:
```typescript
import { Attr, w, wLessThan } from 'swiftuiml-typescript';

Text("Responsive")
  .responsive(new Map([
    [wLessThan(768), [[Attr.font, { fixedSize: 14 }]]],
    [w(768), [[Attr.font, { fixedSize: 17 }]]],
    [w(1024), [[Attr.font, { fixedSize: 20 }]]]
  ]))
```

**Breakpoint helpers:**
- `w(768)` - width >= 768
- `wLessThan(768)` - width < 768
- `wGreaterThan(768)` - width > 768
- `wLessThanOrEqual(768)` - width <= 768
- Named: `xs`, `sm`, `md`, `lg`, `xl`

### Dark Mode

Use colon-separated colors for automatic light/dark mode:
```typescript
Text("Themed")
  .foregroundColor("#000000:#FFFFFF")  // Black in light, white in dark
  .background(Color("#FFFFFF:#1C1C1E"))  // White in light, dark gray in dark
```

Or use conditional attributes:
```typescript
Text("Conditional")
  .colorSchemeConditional({
    light: { foregroundColor: "#007AFF", fontWeight: "regular" },
    dark: { foregroundColor: "#0A84FF", fontWeight: "bold" }
  })
```

### Messaging

Components send messages to the host application on user interactions:
```typescript
Button("Navigate", { path: "/home" })
Button("Show Alert", { alert: "Hello!", priority: "high" })
Button("Complex", {
  action: "purchase",
  data: { itemId: 123, price: 9.99 }
})
```

Messages can be any JSON-serializable structure. The host application handles message routing and responses.

See **[Messages Guide](../Docs/Messages.md)** for bidirectional messaging patterns.

## Type Safety

Use `Attr` constants for type-safe attribute keys:
```typescript
import { Attr } from 'swiftuiml-typescript';

const styles = {
  "myStyle": [
    [Attr.padding, 16],
    [Attr.foregroundColor, "#007AFF"],
    [Attr.background, Color("#F5F5F7")]
  ]
};
```

## Available Views

| View | Description |
|------|-------------|
| **Text & Input** |
| `Text` | Display text with formatting |
| `TextField` | Single-line text input |
| `TextEditor` | Multi-line text input |
| `SecureField` | Password input field |
| **Buttons & Controls** |
| `Button` | Tappable button with action |
| `Toggle` | On/off switch control |
| `Slider` | Value selection slider |
| `Stepper` | Increment/decrement control |
| `Picker` | Selection from options |
| `DatePicker` | Date and time picker |
| `ColorPicker` | Color selection control |
| `Link` | Navigation link to URL |
| `ShareLink` | System share sheet trigger |
| **Layout Containers** |
| `VStack` | Vertical stack layout |
| `HStack` | Horizontal stack layout |
| `ZStack` | Overlapping layer layout |
| `LazyVStack` | Lazy vertical stack |
| `LazyHStack` | Lazy horizontal stack |
| `LazyVGrid` | Lazy vertical grid |
| `LazyHGrid` | Lazy horizontal grid |
| `ScrollView` | Scrollable container |
| `Grid` | Grid layout container |
| `List` | Scrollable list of items |
| `Form` | Grouped form layout |
| `Section` | Grouped section in list/form |
| `Group` | Transparent layout group |
| `GroupBox` | Labeled box container |
| `ControlGroup` | Related controls group |
| `DisclosureGroup` | Expandable content group |
| `TabView` | Tabbed interface |
| `ViewThatFits` | Auto-fitting view selection |
| **Navigation** |
| `NavigationStack` | Navigation hierarchy |
| `NavigationLink` | Navigation trigger |
| `Menu` | Popup menu |
| **Images & Graphics** |
| `Image` | Display image asset |
| `SystemImage` | SF Symbol icon |
| `AsyncImage` | Load remote image |
| `Label` | Icon with text label |
| **Shapes** |
| `Circle` | Circle shape |
| `Rectangle` | Rectangle shape |
| `RoundedRectangle` | Rounded rectangle |
| `UnevenRoundedRectangle` | Custom corner radii |
| `Capsule` | Pill-shaped capsule |
| `Ellipse` | Ellipse shape |
| `ContainerRelativeShape` | Adaptive container shape |
| **Colors & Gradients** |
| `Color` | Solid color fill |
| `LinearGradient` | Linear color gradient |
| `RadialGradient` | Radial color gradient |
| `AngularGradient` | Angular color gradient |
| **Progress & Indicators** |
| `ProgressView` | Progress indicator |
| `Gauge` | Value gauge display |
| **Utilities** |
| `Spacer` | Flexible spacing |
| `Divider` | Visual separator line |
| `EmptyView` | Invisible placeholder |
| `ColorScheme` | Light/dark mode switcher |
| `WebView` | Web content display |

## Available Modifiers

| Modifier | Description |
|----------|-------------|
| **Layout** |
| `frame()` | Set width/height constraints |
| `padding()` | Add spacing around view |
| `offset()` | Move view by x/y offset |
| `position()` | Set absolute position |
| `fixedSize()` | Prevent view compression |
| `containerRelativeFrame()` | Frame relative to container |
| `layoutPriority()` | Set layout priority |
| `coordinateSpace()` | Define coordinate space |
| `aspectRatio()` | Constrain aspect ratio |
| `ignoresSafeArea()` | Extend into safe areas |
| `safeAreaInset()` | Add safe area inset |
| **Text Formatting** |
| `font()` | Set text font style |
| `fontWeight()` | Set font weight |
| `bold()` | Apply bold weight |
| `italic()` | Apply italic style |
| `underline()` | Add underline |
| `strikethrough()` | Add strikethrough |
| `kerning()` | Adjust letter spacing |
| `tracking()` | Adjust character spacing |
| `lineSpacing()` | Set line spacing |
| `lineLimit()` | Limit text lines |
| `minimumScaleFactor()` | Allow text scaling |
| `multilineTextAlignment()` | Align multi-line text |
| `truncationMode()` | Set text truncation |
| `allowsTightening()` | Allow character tightening |
| `baselineOffset()` | Offset text baseline |
| `textSelection()` | Enable text selection |
| **Colors & Appearance** |
| `foregroundColor()` | Set text/icon color |
| `background()` | Set background view |
| `backgroundColor()` | Set background color |
| `tint()` | Set accent tint color |
| `opacity()` | Set transparency level |
| `hidden()` | Hide view conditionally |
| `colorScheme()` | Force light/dark mode |
| `preferredColorScheme()` | Prefer color scheme |
| `colorSchemeConditional()` | Conditional by color scheme |
| **Visual Effects** |
| `shadow()` | Add drop shadow |
| `blur()` | Apply blur effect |
| `brightness()` | Adjust brightness |
| `contrast()` | Adjust contrast |
| `saturation()` | Adjust saturation |
| `grayscale()` | Apply grayscale |
| `hueRotation()` | Rotate hue |
| `colorInvert()` | Invert colors |
| `colorMultiply()` | Multiply color |
| `luminanceToAlpha()` | Convert luminance to alpha |
| `blendMode()` | Set blend mode |
| `redacted()` | Redact content |
| `privacySensitive()` | Mark as privacy-sensitive |
| **Borders & Clipping** |
| `border()` | Add border stroke |
| `cornerRadius()` | Round corners |
| `clipShape()` | Clip to shape |
| `clipped()` | Clip to bounds |
| `mask()` | Apply mask view |
| **Transforms** |
| `rotationEffect()` | Rotate view |
| `rotation3DEffect()` | 3D rotation |
| `scaleEffect()` | Scale view |
| `perspective()` | Apply 3D perspective |
| **Interaction** |
| `onTapGesture()` | Handle tap events |
| `onLongPressGesture()` | Handle long press |
| `onAppear()` | Trigger on appear |
| `onDisappear()` | Trigger on disappear |
| `disabled()` | Disable interaction |
| `animation()` | Apply animation |
| **Navigation & Presentation** |
| `sheet()` | Present modal sheet |
| `fullScreenCover()` | Present full screen modal |
| `popover()` | Present popover |
| `alert()` | Show alert dialog |
| `confirmationDialog()` | Show action sheet |
| `presentationDetents()` | Set sheet detents |
| `presentationDragIndicator()` | Show drag indicator |
| `interactiveDismissDisabled()` | Disable swipe dismiss |
| `navigationDestination()` | Define nav destination |
| `navigationDestinations()` | Define multiple destinations |
| `navigationTitle()` | Set navigation title |
| `navigationBarTitleDisplayMode()` | Set title display mode |
| `navigationBarHidden()` | Hide navigation bar |
| `navigationBarBackButtonHidden()` | Hide back button |
| `toolbar()` | Configure toolbar |
| **Tabs & Badges** |
| `tabItem()` | Define tab bar item |
| `tag()` | Set selection tag |
| `badge()` | Add badge indicator |
| `tabViewStyle()` | Set tab view style |
| **Images** |
| `resizable()` | Enable image resizing |
| `renderingMode()` | Set rendering mode |
| **Lists** |
| `listStyle()` | Set list style |
| `listRowBackground()` | Set row background |
| `listRowInsets()` | Set row insets |
| `listRowSeparator()` | Configure separator |
| **Scrolling** |
| `scrollDisabled()` | Disable scrolling |
| `scrollIndicators()` | Show/hide indicators |
| `scrollBounceBehavior()` | Set bounce behavior |
| `scrollTargetBehavior()` | Set scroll target |
| `scrollTargetLayout()` | Enable scroll targeting |
| **Forms & Controls** |
| `buttonStyle()` | Set button style |
| `buttonBorderShape()` | Set button border shape |
| `toggleStyle()` | Set toggle style |
| `pickerStyle()` | Set picker style |
| `progressViewStyle()` | Set progress style |
| `textFieldStyle()` | Set text field style |
| `labelsHidden()` | Hide control labels |
| `controlSize()` | Set control size |
| `keyboardType()` | Set keyboard type |
| `autocapitalization()` | Set autocapitalization |
| `textContentType()` | Set content type hint |
| `submitLabel()` | Set submit button label |
| **Accessibility** |
| `accessibilityLabel()` | Set accessibility label |
| `accessibilityHint()` | Set accessibility hint |
| `accessibilityValue()` | Set accessibility value |
| `accessibilityHidden()` | Hide from accessibility |
| `accessibilityIdentifier()` | Set identifier |
| `accessibilityElement()` | Make accessibility element |
| `accessibilityTraits()` | Add traits |
| `accessibilityRemoveTraits()` | Remove traits |
| `accessibilitySortPriority()` | Set sort priority |
| `accessibilityInputLabels()` | Set input labels |
| `accessibilityAction()` | Add custom action |
| **Responsive & Styling** |
| `responsive()` | Apply breakpoint styles |
| `style()` | Apply named style |
| **Localization** |
| `locale()` | Set locale |
| `timeZone()` | Set time zone |
| **Utility** |
| `id()` | Set view identifier |

## Example: Complete Page

```typescript
import {
  Layout, VStack, HStack, Text, Button, SystemImage,
  Color, Attr
} from 'swiftuiml-typescript';

const styles = {
  "header": [
    [Attr.font, { name: "Helvetica", fixedSize: 28 }],
    [Attr.fontWeight, "bold"]
  ],
  "card": [
    [Attr.padding, 20],
    [Attr.background, Color("#FFFFFF:#1C1C1E")],
    [Attr.cornerRadius, 16],
    [Attr.shadow, { radius: 8, x: 0, y: 2, color: "#00000010:#FFFFFF10" }]
  ]
};

export function homePage() {
  const layout = new Layout(
    styles,
    VStack(24, "leading", [
      Text("Welcome Back")
        .style("header"),

      VStack(16, "leading", [
        HStack(12, "center", [
          SystemImage("star.fill")
            .foregroundColor("#FFD700")
            .font(24),
          Text("Featured Item"),
          Spacer(),
          Text("$9.99")
            .fontWeight("bold")
        ]),

        Button("Purchase", { action: "purchase", itemId: 123 })
          .padding(12, 24, 12, 24)
          .background(Color("#007AFF:#0A84FF"))
          .foregroundColor("#FFFFFF")
          .cornerRadius(10)
      ])
      .style("card")
    ])
  );

  return layout;
}
```

## JSON Output

Layouts automatically serialize to JSON via `toJSON()` methods. When used with Express `res.json()` or `JSON.stringify()`.

```json
{
  "styles": [
    ["header", [["font", {"name": "Helvetica", "fixedSize": 28}], ["fontWeight", "bold"]]]
  ],
  "content": {
    "type": "VStack",
    "attributes": [["spacing", 24], ["alignment", "leading"]],
    "children": [...]
  }
}
```

## Learn More

- [Main README](../README.md) - Architecture and concepts
- [Example Server](../Example/Server) - Complete demo with all features
- [SwiftUIML Framework](../Sources) - iOS rendering implementation

## License

MIT
