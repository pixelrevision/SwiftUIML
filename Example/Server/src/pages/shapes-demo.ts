import {
  Capsule,
  Circle,
  HStack,
  Layout,
  LinearGradient,
  RadialGradient,
  Rectangle,
  RoundedRectangle,
  VStack
} from "swiftuiml-typescript";
import { Card, Header, NavTabs, Page, Section, Subhead } from "../components";
import { styles } from "../styles";

export function shapesDemo() {
  const layout = new Layout(
    styles,
    Page(
      [
        Header("Shapes & Graphics", "Built-in geometric shapes and drawing primitives"),

        Section("Basic Shapes", [
          Card([
            Subhead("Rectangle, Circle, Capsule, and RoundedRectangle"),
            HStack(20, "center", [
              Rectangle()
                .fill("#007AFF:#0A84FF")
                .frame(60, 60),
              Circle()
                .fill("#34C759:#30D158")
                .frame(60, 60),
              RoundedRectangle(12)
                .fill("#FF9500:#FF9F0A")
                .frame(60, 60),
              Capsule()
                .fill("#FF3B30:#FF453A")
                .frame(80, 40),
            ])
              .padding(20),
          ]),
        ]),

        Section("Stroked Shapes", [
          Card([
            Subhead("Outline variants for borders and frames"),
            HStack(20, "center", [
              Circle()
                .stroke("#007AFF:#0A84FF")
                .frame(60, 60),
              RoundedRectangle(12)
                .stroke("#5856D6:#5E5CE6")
                .frame(60, 60),
              Capsule()
                .stroke("#FF2D55:#FF375F")
                .frame(80, 40),
            ])
              .padding(20),
          ]),
        ]),

        Section("Gradients", [
          Card([
            Subhead("Linear gradients for smooth color transitions"),
            VStack(16, "center", [
              LinearGradient(["#007AFF:#0A84FF", "#5856D6:#5E5CE6"], "leading", "trailing")
                .frame(300, 60)
                .cornerRadius(12),
              LinearGradient(
                ["#FF3B30:#FF453A", "#FF9500:#FF9F0A", "#FFCC00:#FFD60A"],
                "top",
                "bottom",
              )
                .frame(300, 60)
                .cornerRadius(12),
            ]),
          ]),
        ]),

        Section("Radial Gradient", [
          Card([
            Subhead("Circular gradient emanating from center"),
            RadialGradient(["#34C759:#30D158", "#007AFF:#0A84FF"], "center", 0, 100)
              .frame(200, 200)
              .cornerRadius(100),
          ]),
        ]),

        Section("Combined Effects", [
          Card([
            Subhead("Shapes with shadows and overlays"),
            HStack(20, "center", [
              RoundedRectangle(16)
                .fill("#FFFFFF:#1C1C1E")
                .frame(80, 80)
                .shadow("#00000020:#FFFFFF10", 8, 0, 4),
              Circle()
                .fill("#007AFF:#0A84FF")
                .frame(80, 80)
                .shadow("#007AFF40:#0A84FF40", 12, 0, 6),
            ]),
          ]),
        ]),
      ],
      NavTabs("Shapes"),
    ),
  );

  return layout;
}
