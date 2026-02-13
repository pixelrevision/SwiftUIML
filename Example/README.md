# SwiftUIML Demo

Interactive demo showcasing server-driven SwiftUI with a TypeScript backend and native iOS app.

## Quick Start

### 1. Start the Server

```bash
cd Server
npm install
npm run dev
```

Server runs at `http://localhost:3000` with demo pages for:
- Text & Typography
- Buttons & Actions
- Layout Containers
- Images & Media
- Shapes & Graphics
- Styles & Responsive Design
- Bidirectional Messaging

### 2. Run the iOS App

```bash
open SwiftUIMLExample.xcodeproj
```

1. Select the `SwiftUIMLExample` target
2. Choose an iOS 17+ simulator  
3. Build and run (⌘R)

The app fetches layouts from your local server and renders them as native SwiftUI!

## Explore the Code

### Server (`Server/src/`)

**Pages** - Each page is a TypeScript function returning a Layout object:
```
pages/
  welcome.ts         - Main landing page
  text-demo.ts       - Typography examples
  buttons-demo.ts    - Button styles & states
  layout-demo.ts     - VStack/HStack/ZStack
  images-demo.ts     - SF Symbols & images
  shapes-demo.ts     - Shapes & gradients
  styles-demo.ts     - Responsive & theming
  messaging-demo.ts  - Bidirectional messaging
```

**Reusable Components** (`components.ts`):
- `Page`, `Header`, `Section`, `Card`
- `NavButton`, `NavTabs`
- `PrimaryButton`, `SecondaryButton`

**Styles** (`styles.ts`):
- Centralized style definitions
- Geist custom font usage
- Dark mode support with `light:dark` color format

### iOS App

**SwiftUIMLExampleApp.swift** - Main app entry point

**DemoView.swift** - Fetches layouts from server and renders with `NodeView`

**Things to note:**
- Pull-to-refresh to reload content
- Navigation between demo pages
- Message handling for user interactions
- Alert support for demo buttons
