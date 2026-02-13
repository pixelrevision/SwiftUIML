import {
  Button,
  Color,
  Layout,
  NavigationLink,
  NavigationStack,
  Node,
  Text,
  VStack,
  Spacer,
} from "swiftuiml-typescript";
import { Card, Header, NavTabs, Page, Section, Subhead } from "../components";
import { styles } from "../styles";

export function navigationDemo(target?: string, presented: boolean = true) {
  // If target=stack, return NavigationStack demo instead
  if (target === "stack") {
    const navStack = NavigationStack([
      DemoNavigationStackRoot()
        .navigationTitle("Home")
        .navigationDestination(
          "detail",
          DemoNavigationDetailScreen(),
          undefined,
          presented,
          { action: "navPushed", presentedId: "detail-screen" },
          { action: "navPopped", presentedId: "detail-screen" },
        ),
    ]);

    const layout = new Layout(styles, navStack);
    return layout;
  }

  // If target=stack-multi, return NavigationStack with multiple destinations demo
  if (target === "stack-multi") {
    const navStack = NavigationStack([
      DemoNavigationStackMultiRoot()
        .navigationTitle("Multi-Nav Demo")
        .navigationDestinations(
          DemoNavigationScreen1().navigationDestinationKey("nav1"),
          DemoNavigationScreen2().navigationDestinationKey("nav2"),
        ),
    ]);

    const layout = new Layout(styles, navStack);
    return layout;
  }

  let pageContent = Page(
    [
      Header("Navigation", "Explore sheets, modals, and navigation patterns"),

      Section("Sheet Navigation", [
        Card([
          Subhead("Sheets present content modally over your app"),
          Button("Open Sheet", { path: "/navigation-demo?target=sheet" })
            .padding(12)
            .background(Color("#007AFF:#0A84FF"))
            .foregroundColor("#FFFFFF:#FFFFFF")
            .cornerRadius(10)
            .customFont("Geist", 17)
            .fontWeight("medium"),
        ]),
      ]),

      Section("Full Screen Cover", [
        Card([
          Subhead("Full screen covers take over the entire screen"),
          Button("Open Cover", { path: "/navigation-demo?target=cover" })
            .padding(12)
            .background(Color("#FF9500:#FF9F0A"))
            .foregroundColor("#FFFFFF:#FFFFFF")
            .cornerRadius(10)
            .customFont("Geist", 17)
            .fontWeight("medium"),
        ]),
      ]),

      Section("Alerts", [
        Card([
          Subhead("Alerts present important messages and confirmations"),
          Button("Show Alert", { path: "/navigation-demo?target=alert" })
            .padding(12)
            .background(Color("#FF3B30:#FF453A"))
            .foregroundColor("#FFFFFF:#FFFFFF")
            .cornerRadius(10)
            .customFont("Geist", 17)
            .fontWeight("medium"),
        ]),
      ]),

      Section("Confirmation Dialogs", [
        Card([
          Subhead("Confirmation dialogs present action sheets for contextual choices"),
          Button("Show Dialog", { path: "/navigation-demo?target=dialog" })
            .padding(12)
            .background(Color("#5856D6:#5E5CE6"))
            .foregroundColor("#FFFFFF:#FFFFFF")
            .cornerRadius(10)
            .customFont("Geist", 17)
            .fontWeight("medium"),
        ]),
      ]),

      Section("Popovers", [
        Card([
          Subhead("Popovers display content in a floating bubble anchored to a view"),
          Button("Show Popover", { path: "/navigation-demo?target=popover" })
            .padding(12)
            .background(Color("#AF52DE:#BF5AF2"))
            .foregroundColor("#FFFFFF:#FFFFFF")
            .cornerRadius(10)
            .customFont("Geist", 17)
            .fontWeight("medium"),
        ]),
      ]),

      Section("Navigation Stack", [
        Card([
          Subhead("Navigate between screens with automatic back navigation"),
          Button("Open Navigation Stack", { path: "/navigation-demo?target=stack" })
            .padding(12)
            .background(Color("#34C759:#30D158"))
            .foregroundColor("#FFFFFF:#FFFFFF")
            .cornerRadius(10)
            .customFont("Geist", 17)
            .fontWeight("medium"),
        ]),
      ]),
    ],
    NavTabs("Navigation"),
  );

  // If target=sheet, wrap the page with a sheet
  if (target === "sheet") {
    pageContent = pageContent.sheet(
      DemoSheetContent(),
      "demo-sheet",
      presented,
      true,
      { action: "sheetPresented", presentedId: "demo-sheet" },
      { action: "sheetDismissed", presentedId: "demo-sheet" },
    );
  }

  // If target=cover, wrap the page with a full screen cover
  if (target === "cover") {
    pageContent = pageContent.fullScreenCover(
      DemoFullScreenCoverContent(),
      "demo-cover",
      presented,
      true,
      { action: "coverPresented", presentedId: "demo-cover" },
      { action: "coverDismissed", presentedId: "demo-cover" },
    );
  }

  // If target=alert, wrap the page with an alert
  if (target === "alert") {
    pageContent = pageContent.alert(
      "Delete Item?",
      "This action cannot be undone. This will permanently delete the selected item from your account.",
      presented,
      DemoAlertButtons(),
      { action: "alertDismissed", presentedId: "demo-alert" },
    );
  }

  // If target=dialog, wrap the page with a confirmation dialog
  if (target === "dialog") {
    pageContent = pageContent.confirmationDialog(
      "Choose Action",
      "What would you like to do with this item? This action sheet provides multiple options.",
      presented,
      DemoConfirmationDialogButtons(),
      { action: "dialogDismissed", presentedId: "demo-dialog" },
    );
  }

  // If target=popover, wrap the page with a popover
  if (target === "popover") {
    pageContent = pageContent.popover(
      DemoPopoverContent(),
      "demo-popover",
      presented,
      true,
      { action: "popoverPresented", presentedId: "demo-popover" },
      { action: "popoverDismissed", presentedId: "demo-popover" },
    );
  }

  const layout = new Layout(styles, pageContent);

  return layout;
}

function DemoSheetContent(): Node {
  return VStack(16, "leading", [
    Text("Sheet Content")
      .font("largeTitle")
      .fontWeight("bold")
      .padding(20),

    Text("This is a sheet presented over the main content.")
      .customFont("Geist", 17)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    Button("Close Sheet (Navigate)", { path: "/navigation-demo" })
      .padding(12)
      .background(Color("#007AFF:#0A84FF"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Button("Close Sheet (Animate)", { path: "/navigation-demo?target=sheet&presented=false" })
      .padding(12)
      .background(Color("#34C759:#30D158"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Text("Try swiping down to dismiss")
      .customFont("Geist", 15)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),
  ]);
}

function DemoFullScreenCoverContent(): Node {
  return VStack(16, "leading", [
    Text("Full Screen Cover")
      .font("largeTitle")
      .fontWeight("bold")
      .padding(20),

    Text("This cover takes over the entire screen. Unlike sheets, it doesn't show the content behind it.")
      .customFont("Geist", 17)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    Button("Close Cover (Navigate)", { path: "/navigation-demo" })
      .padding(12)
      .background(Color("#FF9500:#FF9F0A"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Button("Close Cover (Animate)", { path: "/navigation-demo?target=cover&presented=false" })
      .padding(12)
      .background(Color("#34C759:#30D158"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Text("You must use a button to dismiss")
      .customFont("Geist", 15)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),
  ]);
}

function DemoAlertButtons() {
  return [
    {
      label: "Default",
      action: { path: "/navigation-demo" }
    },
    {
      label: "Cancel",
      role: "cancel" as const,
      action: { path: "/navigation-demo" }
    },
    {
      label: "Delete",
      role: "destructive" as const,
      action: { path: "/navigation-demo" }
    },
  ];
}

function DemoConfirmationDialogButtons() {
  return [
    {
      label: "Share",
      action: { path: "/navigation-demo" }
    },
    {
      label: "Duplicate",
      action: { path: "/navigation-demo" }
    },
    {
      label: "Move to Folder",
      action: { path: "/navigation-demo" }
    },
    {
      label: "Delete",
      role: "destructive" as const,
      action: { path: "/navigation-demo" }
    },
    {
      label: "Cancel",
      role: "cancel" as const,
      action: { path: "/navigation-demo" }
    },
  ];
}

function DemoPopoverContent(): Node {
  return VStack(16, "leading", [
    Text("Popover Content")
      .font("largeTitle")
      .fontWeight("bold")
      .padding(20),

    Text("This is a popover presented as a floating bubble. On iPad it appears anchored to the source view, on iPhone it's presented as a sheet.")
      .customFont("Geist", 17)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    Button("Close Popover (Navigate)", { path: "/navigation-demo" })
      .padding(12)
      .background(Color("#AF52DE:#BF5AF2"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Button("Close Popover (Animate)", { path: "/navigation-demo?target=popover&presented=false" })
      .padding(12)
      .background(Color("#34C759:#30D158"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Text("Tap outside to dismiss on iPad")
      .customFont("Geist", 15)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),
  ]);
}

function DemoNavigationStackRoot(): Node {
  return VStack(20, "leading", [
    Text("This is the root view of the navigation stack. Tap the button below to push a new screen onto the stack.")
      .customFont("Geist", 17)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    Button("Push Detail Screen", { path: "/navigation-demo?target=stack&presented=true" })
      .padding(12)
      .background(Color("#34C759:#30D158"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Button("Multiple Destinations Demo", { path: "/navigation-demo?target=stack-multi" })
      .padding(12)
      .background(Color("#007AFF:#0A84FF"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Button("Back to Navigation Demo", { path: "/navigation-demo" })
      .padding(12)
      .background(Color("#8E8E93:#8E8E93"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

      Spacer(),
  ])
    .frame(undefined, undefined, "topLeading")
    .padding(0, 0, 40, 0);
}

function DemoNavigationDetailScreen(): Node {
  return VStack(20, "leading", [
    Text("You've navigated to the detail screen! The navigation bar automatically shows a back button.")
      .customFont("Geist", 17)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    Text("You can tap the back button or swipe from the left edge to go back.")
      .customFont("Geist", 15)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    Button("Pop Back (Animate)", { path: "/navigation-demo?target=stack&presented=false" })
      .padding(12)
      .background(Color("#FF9500:#FF9F0A"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Spacer(),
  ])
    .navigationTitle("Detail")
    .frame(undefined, undefined, "topLeading")
    .padding(0, 0, 40, 0);
}

function DemoNavigationStackMultiRoot(): Node {
  return VStack(20, "leading", [
    Text("This demonstrates using navigationDestinations (plural) with NavigationLink. Multiple destinations are registered at once.")
      .customFont("Geist", 17)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    NavigationLink("nav1", "Go to Profile")
      .padding(12)
      .background(Color("#34C759:#30D158"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    NavigationLink("nav2", "Go to Settings")
      .padding(12)
      .background(Color("#007AFF:#0A84FF"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Button("Back to Navigation Demo", { path: "/navigation-demo" })
      .padding(12)
      .background(Color("#8E8E93:#8E8E93"))
      .foregroundColor("#FFFFFF:#FFFFFF")
      .cornerRadius(10)
      .customFont("Geist", 17)
      .fontWeight("medium")
      .padding(20),

    Spacer(),
  ])
    .frame(undefined, undefined, "topLeading")
    .padding(0, 0, 40, 0);
}

function DemoNavigationScreen1(): Node {
  return VStack(20, "leading", [
    Text("This is the Profile screen. It was registered using navigationDestinationKey('nav1').")
      .customFont("Geist", 17)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    Text("Both destinations are handled by a single navigationDestinations modifier.")
      .customFont("Geist", 15)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    Spacer(),
  ])
    .navigationTitle("Profile")
    .frame(undefined, undefined, "topLeading")
    .padding(0, 0, 40, 0);
}

function DemoNavigationScreen2(): Node {
  return VStack(20, "leading", [
    Text("This is the Settings screen. It was registered using navigationDestinationKey('nav2').")
      .customFont("Geist", 17)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    Text("This pattern allows you to define multiple destinations without the first one overriding the second.")
      .customFont("Geist", 15)
      .foregroundColor("#8E8E93:#8E8E93")
      .padding(20),

    Spacer(),
  ])
    .navigationTitle("Settings")
    .frame(undefined, undefined, "topLeading")
    .padding(0, 0, 40, 0);
}
