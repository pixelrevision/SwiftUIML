import { describe, test } from "node:test";
import assert from "node:assert";
import {
  Node,
  Text,
  TextMarkdown,
  Button,
  TextField,
  TextEditor,
  SecureField,
  Toggle,
  Slider,
  Stepper,
  Picker,
  DatePicker,
  ColorPicker,
  Link,
  Label,
  ShareLink,
  Spacer,
  Divider,
  ProgressView,
  Gauge,
  EmptyView,
  Menu,
  VStack,
  HStack,
  ZStack,
  LazyVStack,
  LazyHStack,
  ScrollView,
  List,
  Form,
  DisclosureGroup,
  Group,
  GroupBox,
  ControlGroup,
  Section,
  SectionWithFooter,
  Grid,
  GridRow,
  TabView,
  ViewThatFits,
  NavigationStack,
  NavigationLink,
  WebView,
  Image,
  SystemImage,
  AsyncImage,
  Color,
  LinearGradient,
  RadialGradient,
  AngularGradient,
  LinearGradientWithStops,
  RadialGradientWithStops,
  AngularGradientWithStops,
  Circle,
  Rectangle,
  RoundedRectangle,
  UnevenRoundedRectangle,
  Capsule,
  Ellipse,
  ContainerRelativeShape,
  ColorScheme,
  ColorSchemeConditional,
  AttributeKey,
} from "../src/index";

describe("View Builder Functions", () => {
  describe("Text Views", () => {
    test("Text creates text node", () => {
      const node = Text("Hello World");

      assert.strictEqual(node.type, "Text");
      assert.strictEqual(node.getAttribute(AttributeKey.text), "Hello World");
    });

    test("TextMarkdown creates markdown text node", () => {
      const node = TextMarkdown("**Bold** text");

      assert.strictEqual(node.type, "Text");
      assert.strictEqual(node.getAttribute(AttributeKey.markdown), "**Bold** text");
    });
  });

  describe("Basic Views", () => {
    test("Button creates button node with string action", () => {
      const node = Button("Click Me", "handleClick");

      assert.strictEqual(node.type, "Button");
      assert.strictEqual(node.getAttribute(AttributeKey.title), "Click Me");
      assert.strictEqual(node.getAttribute(AttributeKey.onTap), "handleClick");
    });

    test("Button creates button node with object action", () => {
      const action = { type: "navigate", screen: "home" };
      const node = Button("Go Home", action);

      assert.strictEqual(node.type, "Button");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onTap), action);
    });

    test("Link creates link node with title and url", () => {
      const node = Link("Visit Apple", "https://apple.com");

      assert.strictEqual(node.type, "Link");
      assert.strictEqual(node.getAttribute(AttributeKey.title), "Visit Apple");
      assert.strictEqual(node.getAttribute(AttributeKey.url), "https://apple.com");
      assert.strictEqual(node.children?.length, 0);
    });

    test("Link creates link node with custom content", () => {
      const node = Link("https://github.com", [Text("GitHub"), SystemImage("link")]);

      assert.strictEqual(node.type, "Link");
      assert.strictEqual(node.getAttribute(AttributeKey.url), "https://github.com");
      assert.strictEqual(node.children?.length, 2);
      assert.strictEqual(node.children?.[0].type, "Text");
      assert.strictEqual(node.children?.[1].type, "Image");
    });

    test("Label creates label node", () => {
      const node = Label("Home", "house");

      assert.strictEqual(node.type, "Label");
      assert.strictEqual(node.getAttribute(AttributeKey.title), "Home");
      assert.strictEqual(node.getAttribute(AttributeKey.systemName), "house");
    });

    test("ShareLink with URL only", () => {
      const node = ShareLink("https://apple.com");

      assert.strictEqual(node.type, "ShareLink");
      assert.strictEqual(node.getAttribute(AttributeKey.url), "https://apple.com");
      assert.strictEqual(node.getAttribute(AttributeKey.title), undefined);
    });

    test("ShareLink with title and URL", () => {
      const node = ShareLink("Share this", "https://apple.com");

      assert.strictEqual(node.type, "ShareLink");
      assert.strictEqual(node.getAttribute(AttributeKey.title), "Share this");
      assert.strictEqual(node.getAttribute(AttributeKey.url), "https://apple.com");
    });

    test("Spacer creates spacer node", () => {
      const node = Spacer();

      assert.strictEqual(node.type, "Spacer");
    });

    test("Divider creates divider node", () => {
      const node = Divider();

      assert.strictEqual(node.type, "Divider");
    });

    test("ProgressView creates indeterminate progress node", () => {
      const node = ProgressView();

      assert.strictEqual(node.type, "ProgressView");
    });

    test("ProgressView creates indeterminate progress node with label", () => {
      const node = ProgressView("Loading...");

      assert.strictEqual(node.type, "ProgressView");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Loading...");
    });

    test("ProgressView creates determinate progress node with values", () => {
      const node = ProgressView(undefined, 50, 100);

      assert.strictEqual(node.type, "ProgressView");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 50);
      assert.strictEqual(node.getAttribute(AttributeKey.total), 100);
    });

    test("ProgressView creates determinate progress node with label and values", () => {
      const node = ProgressView("Loading...", 0.75, 1.0);

      assert.strictEqual(node.type, "ProgressView");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Loading...");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 0.75);
      assert.strictEqual(node.getAttribute(AttributeKey.total), 1.0);
    });

    test("Gauge creates gauge node with default range", () => {
      const node = Gauge("Speed", 0.7);

      assert.strictEqual(node.type, "Gauge");
      const label = node.getAttribute(AttributeKey.label) as Node;
      assert.ok(label instanceof Node);
      assert.strictEqual(label.type, "Text");
      assert.strictEqual(label.getAttribute(AttributeKey.text), "Speed");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 0.7);
      assert.strictEqual(node.getAttribute(AttributeKey.minimumValue), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.maximumValue), 1);
    });

    test("Gauge creates gauge node with custom range", () => {
      const node = Gauge("Temperature", 75, 0, 100);

      assert.strictEqual(node.type, "Gauge");
      const label = node.getAttribute(AttributeKey.label) as Node;
      assert.ok(label instanceof Node);
      assert.strictEqual(label.type, "Text");
      assert.strictEqual(label.getAttribute(AttributeKey.text), "Temperature");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 75);
      assert.strictEqual(node.getAttribute(AttributeKey.minimumValue), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.maximumValue), 100);
    });

    test("Gauge accepts Node as label", () => {
      const customLabel = Text("Speed").bold().foregroundColor("blue");
      const node = Gauge(customLabel, 0.5);

      assert.strictEqual(node.type, "Gauge");
      const label = node.getAttribute(AttributeKey.label) as Node;
      assert.strictEqual(label, customLabel);
      assert.strictEqual(node.getAttribute(AttributeKey.value), 0.5);
    });

    test("EmptyView creates empty view node", () => {
      const node = EmptyView();

      assert.strictEqual(node.type, "EmptyView");
    });

    test("Menu creates menu with text label", () => {
      const node = Menu("Options", Button("Action 1", "action1"), Button("Action 2", "action2"));

      assert.strictEqual(node.type, "Menu");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Options");
      assert.strictEqual(node.children.length, 2);
    });

    test("Menu creates menu with custom label", () => {
      const node = Menu(
        Label("Settings", "gear"),
        Button("Profile", "profile"),
        Button("Preferences", "preferences"),
      );

      assert.strictEqual(node.type, "Menu");
      assert.strictEqual(node.children.length, 2); // Only menu items are children
      const labelAttr = node.getAttribute(AttributeKey.label);
      assert.ok(labelAttr && typeof labelAttr === "object" && "$type" in labelAttr);
      assert.strictEqual((labelAttr as any).$type, "node");
    });
  });

  describe("Form Controls", () => {
    test("TextField creates text field node", () => {
      const node = TextField("Enter your name");

      assert.strictEqual(node.type, "TextField");
      assert.strictEqual(node.getAttribute(AttributeKey.placeholder), "Enter your name");
      assert.strictEqual(node.getAttribute(AttributeKey.value), undefined);
    });

    test("TextField creates text field node with value", () => {
      const node = TextField("Email", "user@example.com");

      assert.strictEqual(node.type, "TextField");
      assert.strictEqual(node.getAttribute(AttributeKey.placeholder), "Email");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "user@example.com");
    });

    test("TextField can be styled with modifiers", () => {
      const node = TextField("Search")
        .onTextChange({ action: "search" })
        .onSubmit({ action: "submitSearch" })
        .padding(8)
        .backgroundColor("#F0F0F0");

      assert.strictEqual(node.type, "TextField");
      assert.strictEqual(node.getAttribute(AttributeKey.placeholder), "Search");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onTextChange), { action: "search" });
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onSubmit), { action: "submitSearch" });
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 8);
      assert.strictEqual(node.getAttribute(AttributeKey.backgroundColor), "#F0F0F0");
    });

    test("TextEditor creates text editor node", () => {
      const node = TextEditor();

      assert.strictEqual(node.type, "TextEditor");
      assert.strictEqual(node.getAttribute(AttributeKey.value), undefined);
    });

    test("TextEditor creates text editor node with value", () => {
      const node = TextEditor("Initial text content");

      assert.strictEqual(node.type, "TextEditor");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "Initial text content");
    });

    test("TextEditor can be styled with modifiers", () => {
      const node = TextEditor("Some text")
        .onTextChange({ action: "editorChanged" })
        .onFocus({ action: "editorFocused" })
        .onBlur({ action: "editorBlurred" })
        .frame(undefined, 150)
        .padding(10);

      assert.strictEqual(node.type, "TextEditor");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "Some text");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onTextChange), {
        action: "editorChanged",
      });
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onFocus), { action: "editorFocused" });
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onBlur), { action: "editorBlurred" });
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 10);
    });

    test("SecureField creates secure field node", () => {
      const node = SecureField("Enter password");

      assert.strictEqual(node.type, "SecureField");
      assert.strictEqual(node.getAttribute(AttributeKey.placeholder), "Enter password");
      assert.strictEqual(node.getAttribute(AttributeKey.value), undefined);
    });

    test("SecureField creates secure field node with value", () => {
      const node = SecureField("Password", "secret123");

      assert.strictEqual(node.type, "SecureField");
      assert.strictEqual(node.getAttribute(AttributeKey.placeholder), "Password");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "secret123");
    });

    test("SecureField can be styled with modifiers", () => {
      const node = SecureField("Confirm password", "abc123")
        .onTextChange({ action: "passwordChanged" })
        .onSubmit({ action: "submitPassword" })
        .onFocus({ action: "passwordFocused" })
        .padding(8)
        .backgroundColor("#F0F0F0");

      assert.strictEqual(node.type, "SecureField");
      assert.strictEqual(node.getAttribute(AttributeKey.placeholder), "Confirm password");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "abc123");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onTextChange), {
        action: "passwordChanged",
      });
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onSubmit), {
        action: "submitPassword",
      });
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onFocus), {
        action: "passwordFocused",
      });
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 8);
      assert.strictEqual(node.getAttribute(AttributeKey.backgroundColor), "#F0F0F0");
    });

    test("Toggle creates toggle node", () => {
      const node = Toggle("Enable notifications");

      assert.strictEqual(node.type, "Toggle");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Enable notifications");
      assert.strictEqual(node.getAttribute(AttributeKey.isOn), false);
    });

    test("Toggle creates toggle node with isOn", () => {
      const node = Toggle("Dark mode", true);

      assert.strictEqual(node.type, "Toggle");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Dark mode");
      assert.strictEqual(node.getAttribute(AttributeKey.isOn), true);
    });

    test("Toggle can have onToggle handler", () => {
      const node = Toggle("Wi-Fi", false).onToggle({ action: "wifiToggled" });

      assert.strictEqual(node.type, "Toggle");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Wi-Fi");
      assert.strictEqual(node.getAttribute(AttributeKey.isOn), false);
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onToggle), { action: "wifiToggled" });
    });

    test("Slider creates slider node with defaults", () => {
      const node = Slider();

      assert.strictEqual(node.type, "Slider");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 0.5);
      assert.strictEqual(node.getAttribute(AttributeKey.minimumValue), 0.0);
      assert.strictEqual(node.getAttribute(AttributeKey.maximumValue), 1.0);
      assert.strictEqual(node.getAttribute(AttributeKey.step), undefined);
    });

    test("Slider creates slider node with custom values", () => {
      const node = Slider(75, 0, 100);

      assert.strictEqual(node.type, "Slider");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 75);
      assert.strictEqual(node.getAttribute(AttributeKey.minimumValue), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.maximumValue), 100);
    });

    test("Slider creates slider node with step", () => {
      const node = Slider(5, 0, 10, 1);

      assert.strictEqual(node.type, "Slider");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 5);
      assert.strictEqual(node.getAttribute(AttributeKey.minimumValue), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.maximumValue), 10);
      assert.strictEqual(node.getAttribute(AttributeKey.step), 1);
    });

    test("Slider can have onSliderChange handler", () => {
      const node = Slider(50, 0, 100).onSliderChange({ action: "volumeChanged" });

      assert.strictEqual(node.type, "Slider");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 50);
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onSliderChange), {
        action: "volumeChanged",
      });
    });

    test("Slider can be styled with modifiers", () => {
      const node = Slider(0.6)
        .onSliderChange("brightnessChanged")
        .padding(8)
        .backgroundColor("#F0F0F0")
        .cornerRadius(6);

      assert.strictEqual(node.type, "Slider");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 0.6);
      assert.strictEqual(node.getAttribute(AttributeKey.onSliderChange), "brightnessChanged");
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 8);
      assert.strictEqual(node.getAttribute(AttributeKey.backgroundColor), "#F0F0F0");
      assert.strictEqual(node.getAttribute(AttributeKey.cornerRadius), 6);
    });

    test("Stepper creates stepper node with defaults", () => {
      const node = Stepper("Volume");

      assert.strictEqual(node.type, "Stepper");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Volume");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.minimumValue), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.maximumValue), 100);
      assert.strictEqual(node.getAttribute(AttributeKey.step), 1);
    });

    test("Stepper creates stepper node with custom values", () => {
      const node = Stepper("Brightness", 50, 0, 100, 5);

      assert.strictEqual(node.type, "Stepper");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Brightness");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 50);
      assert.strictEqual(node.getAttribute(AttributeKey.minimumValue), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.maximumValue), 100);
      assert.strictEqual(node.getAttribute(AttributeKey.step), 5);
    });

    test("Stepper can have onStepperChange handler", () => {
      const node = Stepper("Volume", 5, 0, 10, 1).onStepperChange({ action: "volumeChanged" });

      assert.strictEqual(node.type, "Stepper");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Volume");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 5);
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onStepperChange), {
        action: "volumeChanged",
      });
    });

    test("Stepper can be styled with modifiers", () => {
      const node = Stepper("Count", 10, 0, 20, 2)
        .onStepperChange("countChanged")
        .padding(8)
        .backgroundColor("#F0F0F0");

      assert.strictEqual(node.type, "Stepper");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Count");
      assert.strictEqual(node.getAttribute(AttributeKey.value), 10);
      assert.strictEqual(node.getAttribute(AttributeKey.onStepperChange), "countChanged");
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 8);
      assert.strictEqual(node.getAttribute(AttributeKey.backgroundColor), "#F0F0F0");
    });

    test("Picker creates picker node without selection", () => {
      const node = Picker("Fruit", [Text("Apple").tag("apple"), Text("Banana").tag("banana")]);

      assert.strictEqual(node.type, "Picker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Fruit");
      assert.strictEqual(node.getAttribute(AttributeKey.selection), undefined);
      assert.strictEqual(node.children.length, 2);
    });

    test("Picker creates picker node with selection", () => {
      const node = Picker(
        "Color",
        [Text("Red").tag("red"), Text("Green").tag("green"), Text("Blue").tag("blue")],
        "red",
      );

      assert.strictEqual(node.type, "Picker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Color");
      assert.strictEqual(node.getAttribute(AttributeKey.selection), "red");
      assert.strictEqual(node.children.length, 3);
    });

    test("Picker can have onPickerChange handler", () => {
      const node = Picker(
        "Size",
        [Text("Small").tag("small"), Text("Large").tag("large")],
        "small",
      ).onPickerChange({
        action: "sizeChanged",
      });

      assert.strictEqual(node.type, "Picker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Size");
      assert.strictEqual(node.getAttribute(AttributeKey.selection), "small");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onPickerChange), {
        action: "sizeChanged",
      });
    });

    test("Picker can be styled with modifiers", () => {
      const node = Picker("Fruit", [Text("Apple").tag("apple")], "apple")
        .onPickerChange("fruitChanged")
        .padding(8)
        .backgroundColor("#F0F0F0");

      assert.strictEqual(node.type, "Picker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Fruit");
      assert.strictEqual(node.getAttribute(AttributeKey.selection), "apple");
      assert.strictEqual(node.getAttribute(AttributeKey.onPickerChange), "fruitChanged");
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 8);
      assert.strictEqual(node.getAttribute(AttributeKey.backgroundColor), "#F0F0F0");
    });
  });

  describe("DatePicker", () => {
    test("DatePicker creates datepicker node with string label", () => {
      const node = DatePicker("Select Date");

      assert.strictEqual(node.type, "DatePicker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Select Date");
      assert.strictEqual(node.getAttribute(AttributeKey.value), undefined);
    });

    test("DatePicker creates datepicker node with Date value", () => {
      const date = new Date("2000-01-01T00:00:00.000Z");
      const node = DatePicker("Birthday", date);

      assert.strictEqual(node.type, "DatePicker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Birthday");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "2000-01-01T00:00:00.000Z");
    });

    test("DatePicker creates datepicker node with string value", () => {
      const node = DatePicker("Appointment", "2025-10-25T14:30:00.000Z");

      assert.strictEqual(node.type, "DatePicker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Appointment");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "2025-10-25T14:30:00.000Z");
    });

    test("DatePicker creates datepicker node with custom label", () => {
      const labelNode = HStack(undefined, undefined, [SystemImage("calendar"), Text("Pick Date")]);
      const node = DatePicker({ label: labelNode }, "2025-10-25T12:00:00.000Z");

      assert.strictEqual(node.type, "DatePicker");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.label), labelNode);
      assert.strictEqual(node.getAttribute(AttributeKey.value), "2025-10-25T12:00:00.000Z");
    });

    test("DatePicker can have modifiers", () => {
      const minDate = new Date("2025-01-01T00:00:00.000Z");
      const maxDate = new Date("2025-12-31T23:59:59.000Z");
      const node = DatePicker("Event Date")
        .displayedComponents("dateAndTime")
        .minimumDate(minDate)
        .maximumDate(maxDate)
        .onDateChange({ action: "dateChanged" });

      assert.strictEqual(node.type, "DatePicker");
      assert.strictEqual(node.getAttribute(AttributeKey.displayedComponents), "dateAndTime");
      assert.strictEqual(node.getAttribute(AttributeKey.minimumDate), "2025-01-01T00:00:00.000Z");
      assert.strictEqual(node.getAttribute(AttributeKey.maximumDate), "2025-12-31T23:59:59.000Z");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onDateChange), {
        action: "dateChanged",
      });
    });

    test("DatePicker modifiers accept string dates", () => {
      const node = DatePicker("Meeting")
        .minimumDate("2025-01-01T00:00:00.000Z")
        .maximumDate("2025-12-31T23:59:59.000Z");

      assert.strictEqual(node.getAttribute(AttributeKey.minimumDate), "2025-01-01T00:00:00.000Z");
      assert.strictEqual(node.getAttribute(AttributeKey.maximumDate), "2025-12-31T23:59:59.000Z");
    });
  });

  describe("ColorPicker", () => {
    test("ColorPicker creates colorpicker node without value", () => {
      const node = ColorPicker("Select Color");

      assert.strictEqual(node.type, "ColorPicker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Select Color");
      assert.strictEqual(node.getAttribute(AttributeKey.value), undefined);
    });

    test("ColorPicker creates colorpicker node with value", () => {
      const node = ColorPicker("Theme Color", "#FF5733");

      assert.strictEqual(node.type, "ColorPicker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Theme Color");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "#FF5733");
    });

    test("ColorPicker creates colorpicker node with alpha channel", () => {
      const node = ColorPicker("Background", "#00AAFFFF");

      assert.strictEqual(node.type, "ColorPicker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Background");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "#00AAFFFF");
    });

    test("ColorPicker can have onColorChange handler", () => {
      const node = ColorPicker("Pick Color").onColorChange({ action: "colorChanged" });

      assert.strictEqual(node.type, "ColorPicker");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onColorChange), {
        action: "colorChanged",
      });
    });

    test("ColorPicker can disable opacity support", () => {
      const node = ColorPicker("Solid Color").supportsOpacity(false);

      assert.strictEqual(node.type, "ColorPicker");
      assert.strictEqual(node.getAttribute(AttributeKey.supportsOpacity), false);
    });

    test("ColorPicker can have modifiers", () => {
      const node = ColorPicker("Theme Color", "#FF5733")
        .supportsOpacity(false)
        .onColorChange({ action: "themeColorChanged" });

      assert.strictEqual(node.type, "ColorPicker");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Theme Color");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "#FF5733");
      assert.strictEqual(node.getAttribute(AttributeKey.supportsOpacity), false);
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onColorChange), {
        action: "themeColorChanged",
      });
    });
  });

  describe("Container Views", () => {
    test("VStack creates vertical stack", () => {
      const node = VStack(20, "center", [Text("Child 1"), Text("Child 2")]);

      assert.strictEqual(node.type, "VStack");
      assert.strictEqual(node.getAttribute(AttributeKey.spacing), 20);
      assert.strictEqual(node.getAttribute(AttributeKey.alignment), "center");
      assert.strictEqual(node.children.length, 2);
    });

    test("VStack works without spacing", () => {
      const node = VStack(undefined, "center", [Text("Child")]);

      assert.strictEqual(node.type, "VStack");
      assert.strictEqual(node.children.length, 1);
    });

    test("HStack creates horizontal stack", () => {
      const node = HStack(10, "top", [Text("Child 1"), Text("Child 2")]);

      assert.strictEqual(node.type, "HStack");
      assert.strictEqual(node.getAttribute(AttributeKey.spacing), 10);
      assert.strictEqual(node.getAttribute(AttributeKey.alignment), "top");
      assert.strictEqual(node.children.length, 2);
    });

    test("ZStack creates z stack", () => {
      const node = ZStack("center", [Circle(), Text("Overlay")]);

      assert.strictEqual(node.type, "ZStack");
      assert.strictEqual(node.getAttribute(AttributeKey.alignment), "center");
      assert.strictEqual(node.children.length, 2);
    });

    test("LazyVStack creates lazy vertical stack", () => {
      const node = LazyVStack(5, "leading");

      assert.strictEqual(node.type, "LazyVStack");
      assert.strictEqual(node.getAttribute(AttributeKey.spacing), 5);
      assert.strictEqual(node.getAttribute(AttributeKey.alignment), "leading");
    });

    test("LazyHStack creates lazy horizontal stack", () => {
      const node = LazyHStack(5, "center");

      assert.strictEqual(node.type, "LazyHStack");
      assert.strictEqual(node.getAttribute(AttributeKey.spacing), 5);
    });

    test("ScrollView creates scroll view", () => {
      const node = ScrollView("vertical", [Text("Content")]);

      assert.strictEqual(node.type, "ScrollView");
      assert.strictEqual(node.getAttribute(AttributeKey.axis), "vertical");
      assert.strictEqual(node.children.length, 1);
    });

    test("List creates list node", () => {
      const node = List([Text("Item 1"), Text("Item 2")]);

      assert.strictEqual(node.type, "List");
      assert.strictEqual(node.children.length, 2);
    });

    test("Form creates form node", () => {
      const node = Form([Picker("Fruit", [Text("Apple").tag("apple")]), Toggle("Dark Mode")]);

      assert.strictEqual(node.type, "Form");
      assert.strictEqual(node.children.length, 2);
    });

    test("DisclosureGroup creates disclosure group node without isExpanded", () => {
      const node = DisclosureGroup("Details", [Text("Content 1"), Text("Content 2")]);

      assert.strictEqual(node.type, "DisclosureGroup");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Details");
      assert.strictEqual(node.getAttribute(AttributeKey.isExpanded), undefined);
      assert.strictEqual(node.children.length, 2);
    });

    test("DisclosureGroup creates disclosure group node with isExpanded", () => {
      const node = DisclosureGroup("Settings", [Toggle("Dark Mode"), Slider(0.5)], true);

      assert.strictEqual(node.type, "DisclosureGroup");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Settings");
      assert.strictEqual(node.getAttribute(AttributeKey.isExpanded), true);
      assert.strictEqual(node.children.length, 2);
    });

    test("DisclosureGroup can have onExpandedChange handler", () => {
      const node = DisclosureGroup("Options", [Text("Option 1")]).onExpandedChange(
        "optionsExpanded",
      );

      assert.strictEqual(node.getAttribute(AttributeKey.onExpandedChange), "optionsExpanded");
    });

    test("DisclosureGroup can be styled with modifiers", () => {
      const node = DisclosureGroup("Advanced", [Text("Advanced option")], false)
        .onExpandedChange({ action: "advancedExpanded" })
        .padding(16);

      assert.strictEqual(node.getAttribute(AttributeKey.label), "Advanced");
      assert.strictEqual(node.getAttribute(AttributeKey.isExpanded), false);
      assert.deepStrictEqual(node.getAttribute(AttributeKey.onExpandedChange), {
        action: "advancedExpanded",
      });
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 16);
    });

    test("Group creates group node", () => {
      const node = Group([Text("Item 1"), Text("Item 2")]);

      assert.strictEqual(node.type, "Group");
      assert.strictEqual(node.children.length, 2);
    });

    test("GroupBox creates group box node without label", () => {
      const node = GroupBox([Text("Item 1"), Text("Item 2")]);

      assert.strictEqual(node.type, "GroupBox");
      assert.strictEqual(node.getAttribute(AttributeKey.label), undefined);
      assert.strictEqual(node.children.length, 2);
    });

    test("GroupBox creates group box node with string label", () => {
      const node = GroupBox("Settings", [Text("Option 1"), Text("Option 2")]);

      assert.strictEqual(node.type, "GroupBox");
      assert.strictEqual(node.getAttribute(AttributeKey.label), "Settings");
      assert.strictEqual(node.children.length, 2);
    });

    test("GroupBox creates group box node with custom label node", () => {
      const labelNode = HStack(6, "center", [SystemImage("star.fill"), Text("Premium")]);
      const node = GroupBox({ label: labelNode }, [Text("Feature 1"), Text("Feature 2")]);

      assert.strictEqual(node.type, "GroupBox");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.label), labelNode);
      assert.strictEqual(node.children.length, 2);
    });

    test("GroupBox can be styled with modifiers", () => {
      const node = GroupBox("Info", [Text("Details")])
        .padding(16)
        .backgroundColor("#F0F0F0");

      assert.strictEqual(node.getAttribute(AttributeKey.label), "Info");
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 16);
      assert.strictEqual(node.getAttribute(AttributeKey.backgroundColor), "#F0F0F0");
    });

    test("GroupBox with empty children", () => {
      const node = GroupBox("Empty", []);

      assert.strictEqual(node.type, "GroupBox");
      assert.strictEqual(node.children.length, 0);
    });

    test("ControlGroup creates control group node", () => {
      const node = ControlGroup([Button("Bold", "bold"), Button("Italic", "italic")]);

      assert.strictEqual(node.type, "ControlGroup");
      assert.strictEqual(node.children.length, 2);
      assert.strictEqual(node.children[0].type, "Button");
      assert.strictEqual(node.children[1].type, "Button");
    });

    test("ControlGroup with empty children", () => {
      const node = ControlGroup([]);

      assert.strictEqual(node.type, "ControlGroup");
      assert.strictEqual(node.children.length, 0);
    });

    test("ControlGroup with toggles", () => {
      const node = ControlGroup([Toggle("WiFi", true), Toggle("Bluetooth", false)]);

      assert.strictEqual(node.type, "ControlGroup");
      assert.strictEqual(node.children.length, 2);
    });

    test("ControlGroup can be styled with modifiers", () => {
      const node = ControlGroup([Button("Edit", "edit"), Button("Delete", "delete")])
        .buttonStyle("bordered")
        .padding(16);

      assert.strictEqual(node.getAttribute(AttributeKey.buttonStyle), "bordered");
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 16);
    });

    test("Section creates section node", () => {
      const node = Section([Text("Item 1"), Text("Item 2")]);

      assert.strictEqual(node.type, "Section");
      assert.strictEqual(node.children.length, 2);
    });

    test("Section with header creates section with header", () => {
      const header = Text("Header");
      const node = Section(header, [Text("Item 1"), Text("Item 2")]);

      assert.strictEqual(node.type, "Section");
      assert.strictEqual(node.children.length, 2);
      const headerAttr = node.getAttribute(AttributeKey.header);
      assert.ok(headerAttr);
    });

    test("Section with header and footer creates section with both", () => {
      const header = Text("Header");
      const footer = Text("Footer");
      const node = Section(header, footer, [Text("Item 1"), Text("Item 2")]);

      assert.strictEqual(node.type, "Section");
      assert.strictEqual(node.children.length, 2);
      assert.ok(node.getAttribute(AttributeKey.header));
      assert.ok(node.getAttribute(AttributeKey.footer));
    });

    test("SectionWithFooter creates section with only footer", () => {
      const footer = Text("Footer Text");
      const node = SectionWithFooter(footer, [Text("Item 1"), Text("Item 2"), Text("Item 3")]);

      assert.strictEqual(node.type, "Section");
      assert.strictEqual(node.children.length, 3);
      assert.strictEqual(node.getAttribute(AttributeKey.header), undefined);

      const footerAttr = node.getAttribute(AttributeKey.footer) as Node;
      assert.ok(footerAttr);
      assert.strictEqual(footerAttr.type, "Text");
    });

    test("Grid creates grid node", () => {
      const node = Grid(undefined, undefined, undefined, [GridRow(undefined, [Text("Cell")])]);

      assert.strictEqual(node.type, "Grid");
      assert.strictEqual(node.children.length, 1);
    });

    test("Grid with all parameters creates grid with alignment and spacing", () => {
      const node = Grid("topLeading", 8, 12, [
        GridRow(undefined, [Text("Cell 1"), Text("Cell 2")]),
        GridRow(undefined, [Text("Cell 3"), Text("Cell 4")]),
      ]);

      assert.strictEqual(node.type, "Grid");
      assert.strictEqual(node.children.length, 2);
      assert.strictEqual(node.getAttribute(AttributeKey.alignment), "topLeading");
      assert.strictEqual(node.getAttribute(AttributeKey.horizontalSpacing), 8);
      assert.strictEqual(node.getAttribute(AttributeKey.verticalSpacing), 12);
    });

    test("GridRow creates grid row node", () => {
      const node = GridRow(undefined, [Text("Cell 1"), Text("Cell 2")]);

      assert.strictEqual(node.type, "GridRow");
      assert.strictEqual(node.children.length, 2);
    });

    test("GridRow with alignment creates grid row with alignment", () => {
      const node = GridRow("bottom", [Text("Cell 1"), Text("Cell 2"), Text("Cell 3")]);

      assert.strictEqual(node.type, "GridRow");
      assert.strictEqual(node.children.length, 3);
      assert.strictEqual(node.getAttribute(AttributeKey.alignment), "bottom");
    });

    test("TabView creates tab view node", () => {
      const node = TabView([Text("Tab 1"), Text("Tab 2")]);

      assert.strictEqual(node.type, "TabView");
      assert.strictEqual(node.children.length, 2);
    });

    test("ViewThatFits creates view that fits node", () => {
      const node = ViewThatFits([Text("Option 1"), Text("Option 2")]);

      assert.strictEqual(node.type, "ViewThatFits");
      assert.strictEqual(node.children.length, 2);
    });

    test("WebView creates web view with URL", () => {
      const node = WebView("https://example.com");

      assert.strictEqual(node.type, "WebView");
      assert.strictEqual(node.getAttribute(AttributeKey.url), "https://example.com");
    });

    test("WebView creates web view with URL and HTML", () => {
      const node = WebView("https://example.com", "<h1>Hello</h1>");

      assert.strictEqual(node.type, "WebView");
      assert.strictEqual(node.getAttribute(AttributeKey.url), "https://example.com");
      assert.strictEqual(node.getAttribute(AttributeKey.html), "<h1>Hello</h1>");
    });
  });

  describe("Images and Colors", () => {
    test("Image creates image with named asset", () => {
      const node = Image("logo");

      assert.strictEqual(node.type, "Image");
      assert.strictEqual(node.getAttribute(AttributeKey.Name), "logo");
    });

    test("Image creates image with named asset and bundle", () => {
      const node = Image("logo", "com.example.app");

      assert.strictEqual(node.type, "Image");
      assert.strictEqual(node.getAttribute(AttributeKey.Name), "logo");
      assert.strictEqual(node.getAttribute(AttributeKey.bundle), "com.example.app");
    });

    test("SystemImage creates image with system name", () => {
      const node = SystemImage("star.fill");

      assert.strictEqual(node.type, "Image");
      assert.strictEqual(node.getAttribute(AttributeKey.systemName), "star.fill");
    });

    test("AsyncImage creates async image node", () => {
      const node = AsyncImage("https://example.com/image.png");

      assert.strictEqual(node.type, "AsyncImage");
      assert.strictEqual(node.getAttribute(AttributeKey.url), "https://example.com/image.png");
    });

    test("Color creates color node", () => {
      const node = Color("blue");

      assert.strictEqual(node.type, "Color");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "blue");
    });

    test("LinearGradient creates linear gradient", () => {
      const node = LinearGradient(["red", "blue"], "top", "bottom");

      assert.strictEqual(node.type, "LinearGradient");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.colors), ["red", "blue"]);
      assert.strictEqual(node.getAttribute(AttributeKey.startPoint), "top");
      assert.strictEqual(node.getAttribute(AttributeKey.endPoint), "bottom");
    });

    test("RadialGradient creates radial gradient", () => {
      const node = RadialGradient(["red", "blue"], "center", 0, 300);

      assert.strictEqual(node.type, "RadialGradient");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.colors), ["red", "blue"]);
      assert.strictEqual(node.getAttribute(AttributeKey.center), "center");
      assert.strictEqual(node.getAttribute(AttributeKey.startRadius), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.endRadius), 300);
    });

    test("RadialGradient uses default endRadius of 300", () => {
      const node = RadialGradient(["red", "blue"]);

      assert.strictEqual(node.getAttribute(AttributeKey.endRadius), 300);
    });

    test("AngularGradient creates angular gradient", () => {
      const node = AngularGradient(["red", "blue"], "center", 0, 360);

      assert.strictEqual(node.type, "AngularGradient");
      assert.deepStrictEqual(node.getAttribute(AttributeKey.colors), ["red", "blue"]);
      assert.strictEqual(node.getAttribute(AttributeKey.startAngle), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.endAngle), 360);
    });

    test("LinearGradientWithStops creates linear gradient with color stops", () => {
      const node = LinearGradientWithStops(
        [
          { color: "#FF0000", location: 0.0 },
          { color: "#0000FF", location: 0.8 },
          { color: "#FFFFFF", location: 1.0 },
        ],
        "top",
        "bottom",
      );

      assert.strictEqual(node.type, "LinearGradient");
      assert.strictEqual(node.getAttribute(AttributeKey.colors), undefined);
      const stops = node.getAttribute(AttributeKey.colorStops) as Array<{
        color: string;
        location: number;
      }>;
      assert.strictEqual(stops.length, 3);
      assert.strictEqual(stops[0].color, "#FF0000");
      assert.strictEqual(stops[0].location, 0.0);
      assert.strictEqual(stops[1].color, "#0000FF");
      assert.strictEqual(stops[1].location, 0.8);
      assert.strictEqual(stops[2].color, "#FFFFFF");
      assert.strictEqual(stops[2].location, 1.0);
      assert.strictEqual(node.getAttribute(AttributeKey.startPoint), "top");
      assert.strictEqual(node.getAttribute(AttributeKey.endPoint), "bottom");
    });

    test("RadialGradientWithStops creates radial gradient with color stops", () => {
      const node = RadialGradientWithStops(
        [
          { color: "#FF0000", location: 0.0 },
          { color: "#00FF00", location: 0.5 },
          { color: "#0000FF", location: 1.0 },
        ],
        "topLeading",
        0,
        500,
      );

      assert.strictEqual(node.type, "RadialGradient");
      assert.strictEqual(node.getAttribute(AttributeKey.colors), undefined);
      const stops = node.getAttribute(AttributeKey.colorStops) as Array<{
        color: string;
        location: number;
      }>;
      assert.strictEqual(stops.length, 3);
      assert.strictEqual(stops[0].color, "#FF0000");
      assert.strictEqual(stops[0].location, 0.0);
      assert.strictEqual(stops[1].color, "#00FF00");
      assert.strictEqual(stops[1].location, 0.5);
      assert.strictEqual(node.getAttribute(AttributeKey.center), "topLeading");
      assert.strictEqual(node.getAttribute(AttributeKey.endRadius), 500);
    });

    test("AngularGradientWithStops creates angular gradient with color stops", () => {
      const node = AngularGradientWithStops(
        [
          { color: "#FF0000", location: 0.0 },
          { color: "#00FF00", location: 0.33 },
          { color: "#0000FF", location: 0.66 },
          { color: "#FF0000", location: 1.0 },
        ],
        "center",
        0,
        360,
      );

      assert.strictEqual(node.type, "AngularGradient");
      assert.strictEqual(node.getAttribute(AttributeKey.colors), undefined);
      const stops = node.getAttribute(AttributeKey.colorStops) as Array<{
        color: string;
        location: number;
      }>;
      assert.strictEqual(stops.length, 4);
      assert.strictEqual(stops[1].color, "#00FF00");
      assert.strictEqual(stops[1].location, 0.33);
      assert.strictEqual(node.getAttribute(AttributeKey.center), "center");
      assert.strictEqual(node.getAttribute(AttributeKey.startAngle), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.endAngle), 360);
    });
  });

  describe("Shapes", () => {
    test("Circle creates circle node", () => {
      const node = Circle();

      assert.strictEqual(node.type, "Circle");
    });

    test("Rectangle creates rectangle node", () => {
      const node = Rectangle();

      assert.strictEqual(node.type, "Rectangle");
    });

    test("RoundedRectangle creates rounded rectangle", () => {
      const node = RoundedRectangle(10);

      assert.strictEqual(node.type, "RoundedRectangle");
      assert.strictEqual(node.getAttribute(AttributeKey.cornerRadius), 10);
    });

    test("RoundedRectangle with default cornerRadius creates rounded rectangle with 8", () => {
      const node = RoundedRectangle();

      assert.strictEqual(node.type, "RoundedRectangle");
      assert.strictEqual(node.getAttribute(AttributeKey.cornerRadius), 8);
    });

    test("RoundedRectangle with custom cornerRadius creates rounded rectangle with value", () => {
      const node = RoundedRectangle(20);

      assert.strictEqual(node.type, "RoundedRectangle");
      assert.strictEqual(node.getAttribute(AttributeKey.cornerRadius), 20);
    });

    test("UnevenRoundedRectangle creates uneven rounded rectangle with default radii", () => {
      const node = UnevenRoundedRectangle();

      assert.strictEqual(node.type, "UnevenRoundedRectangle");
      assert.strictEqual(node.getAttribute(AttributeKey.topLeading), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.bottomLeading), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.bottomTrailing), 0);
      assert.strictEqual(node.getAttribute(AttributeKey.topTrailing), 0);
    });

    test("UnevenRoundedRectangle creates uneven rounded rectangle with custom radii", () => {
      const node = UnevenRoundedRectangle(30, 10, 30, 10);

      assert.strictEqual(node.type, "UnevenRoundedRectangle");
      assert.strictEqual(node.getAttribute(AttributeKey.topLeading), 30);
      assert.strictEqual(node.getAttribute(AttributeKey.bottomLeading), 10);
      assert.strictEqual(node.getAttribute(AttributeKey.bottomTrailing), 30);
      assert.strictEqual(node.getAttribute(AttributeKey.topTrailing), 10);
    });

    test("Capsule creates capsule node", () => {
      const node = Capsule();

      assert.strictEqual(node.type, "Capsule");
    });

    test("Ellipse creates ellipse node", () => {
      const node = Ellipse();

      assert.strictEqual(node.type, "Ellipse");
    });

    test("ContainerRelativeShape creates container-relative shape node", () => {
      const node = ContainerRelativeShape();

      assert.strictEqual(node.type, "ContainerRelativeShape");
    });
  });

  describe("Conditional Rendering", () => {
    test("ColorScheme creates color scheme node with array", () => {
      const node = ColorScheme([Text("Light Mode"), Text("Dark Mode")]);

      assert.strictEqual(node.type, "ColorScheme");
      assert.strictEqual(node.children.length, 2);
      assert.strictEqual(node.children[0].type, "Text");
      assert.strictEqual(node.children[1].type, "Text");
    });

    test("ColorSchemeConditional creates color scheme node (convenience)", () => {
      const node = ColorSchemeConditional(Text("Light Mode"), Text("Dark Mode"));

      assert.strictEqual(node.type, "ColorScheme");
      assert.strictEqual(node.children.length, 2);
      assert.strictEqual(node.children[0].type, "Text");
      assert.strictEqual(node.children[1].type, "Text");
    });
  });

  describe("Complex Nested Structures", () => {
    test("creates complex nested UI structure", () => {
      const ui = VStack(20, "center", [
        Text("Title").bold(),
        HStack(10, "center", [SystemImage("star.fill"), Text("5 stars")]),
        Button("Click Me", "handleClick"),
      ]);

      assert.strictEqual(ui.type, "VStack");
      assert.strictEqual(ui.children.length, 3);
      assert.strictEqual(ui.children[1].type, "HStack");
      assert.strictEqual(ui.children[1].children.length, 2);
    });

    test("serializes and deserializes complex structure", () => {
      const original = VStack(20, "center", [
        Text("Title"),
        HStack(10, "center", [Circle(), Text("Content")]),
      ]);

      const json = JSON.stringify(original);
      const parsed = JSON.parse(json);

      assert.strictEqual(parsed.type, "VStack");
      assert.strictEqual(parsed.children.length, 2);
      assert.strictEqual(parsed.children[1].children.length, 2);
    });
  });

  describe("Navigation", () => {
    test("NavigationStack creates navigation stack with single child", () => {
      const node = NavigationStack([Text("Home")]);

      assert.strictEqual(node.type, "NavigationStack");
      assert.strictEqual(node.children.length, 1);
      assert.strictEqual(node.children[0].type, "Text");
    });

    test("NavigationStack creates navigation stack with multiple children", () => {
      const node = NavigationStack([Text("Title"), Text("Subtitle"), Button("Tap", "action")]);

      assert.strictEqual(node.type, "NavigationStack");
      assert.strictEqual(node.children.length, 3);
      assert.strictEqual(node.children[0].type, "Text");
      assert.strictEqual(node.children[1].type, "Text");
      assert.strictEqual(node.children[2].type, "Button");
    });

    test("NavigationStack with VStack content", () => {
      const node = NavigationStack([
        VStack(20, "leading", [Text("Home"), Button("Navigate", "push")]),
      ]);

      assert.strictEqual(node.type, "NavigationStack");
      assert.strictEqual(node.children.length, 1);
      assert.strictEqual(node.children[0].type, "VStack");
      assert.strictEqual(node.children[0].children.length, 2);
    });

    test("NavigationStack serializes correctly", () => {
      const node = NavigationStack([
        VStack(undefined, "center", [Text("Home")]).navigationTitle("Home Screen"),
      ]);

      const json = JSON.parse(JSON.stringify(node));

      assert.strictEqual(json.type, "NavigationStack");
      assert.strictEqual(json.children.length, 1);
      assert.strictEqual(json.children[0].type, "VStack");
    });

    test("complete navigation stack example", () => {
      const node = NavigationStack([
        VStack(20, "leading", [Text("Welcome"), Button("Go to Detail", "navigate")])
          .navigationTitle("Home")
          .navigationDestination("detail", VStack(undefined, "center", [Text("Detail Screen")])),
      ]);

      assert.strictEqual(node.type, "NavigationStack");
      assert.strictEqual(node.children.length, 1);

      const rootView = node.children[0];
      assert.strictEqual(rootView.type, "VStack");
      assert.strictEqual(rootView.getAttribute(AttributeKey.navigationTitle), "Home");
      assert.ok(rootView.getAttribute(AttributeKey.navigationDestination));
    });

    test("NavigationLink with text label", () => {
      const node = NavigationLink("detail", "Go to Detail");

      assert.strictEqual(node.type, "NavigationLink");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "detail");
      assert.strictEqual(node.children.length, 1);
      assert.strictEqual(node.children[0].type, "Text");
    });

    test("NavigationLink with single node", () => {
      const label = VStack(undefined, "center", [Text("Navigate")]);
      const node = NavigationLink("profile", label);

      assert.strictEqual(node.type, "NavigationLink");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "profile");
      assert.strictEqual(node.children.length, 1);
      assert.strictEqual(node.children[0].type, "VStack");
    });

    test("NavigationLink with array of nodes", () => {
      const nodes = [Text("Icon"), Text("Label")];
      const node = NavigationLink("settings", nodes);

      assert.strictEqual(node.type, "NavigationLink");
      assert.strictEqual(node.getAttribute(AttributeKey.value), "settings");
      assert.strictEqual(node.children.length, 2);
      assert.strictEqual(node.children[0].type, "Text");
      assert.strictEqual(node.children[1].type, "Text");
    });

    test("NavigationLink can be styled", () => {
      const node = NavigationLink("detail", "Go to Detail")
        .padding(12)
        .backgroundColor("#007AFF")
        .foregroundColor("#FFFFFF")
        .cornerRadius(8);

      assert.strictEqual(node.type, "NavigationLink");
      assert.strictEqual(node.getAttribute(AttributeKey.padding), 12);
      assert.strictEqual(node.getAttribute(AttributeKey.backgroundColor), "#007AFF");
      assert.strictEqual(node.getAttribute(AttributeKey.foregroundColor), "#FFFFFF");
      assert.strictEqual(node.getAttribute(AttributeKey.cornerRadius), 8);
    });
  });
});
