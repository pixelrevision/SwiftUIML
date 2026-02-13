import {
  Color,
  HStack,
  Layout,
  Rectangle,
  Spacer,
  Text,
  VStack,
  ZStack
} from "swiftuiml-typescript";
import { Card, Header, NavTabs, Page, Section, Subhead } from "../components";
import { styles } from "../styles";

export function layoutDemo() {
  const layout = new Layout(
    styles,
    Page(
      [
        Header(
          "Layout Containers",
          "Arrange views in vertical, horizontal, and layered compositions",
        ),

        Section("VStack - Vertical", [
          Card([
            Subhead("Stacks views vertically with configurable spacing and alignment"),
            VStack(12, "leading", [
              Text("First")
                .style("body"),
              Text("Second")
                .style("body"),
              Text("Third")
                .style("body"),
            ])
              .padding(16)
              .background(Color("#F5F5F7:#2C2C2E"))
              .cornerRadius(8),
          ]),
        ]),

        Section("HStack - Horizontal", [
          Card([
            Subhead("Stacks views horizontally with alignment options"),
            HStack(12, "center", [
              Text("Left")
                .style("body"),
              Text("Center")
                .style("body"),
              Text("Right")
                .style("body"),
            ])
              .padding(16)
              .background(Color("#F5F5F7:#2C2C2E"))
              .cornerRadius(8),
          ]),
        ]),

        Section("Spacer", [
          Card([
            Subhead("Adds flexible spacing between elements"),
            HStack(undefined, "center", [
              Text("Left")
                .style("body"),
              Spacer(),
              Text("Right")
                .style("body")
              ])
              .frame(undefined, undefined, Infinity)
              .padding(16)
              .background(Color("#F5F5F7:#2C2C2E"))
              .cornerRadius(8),
          ]),
        ]),

        Section("ZStack - Layered", [
          Card([
            Subhead("Layers views on top of each other"),
            ZStack("center", [
              Rectangle()
                .fill("#007AFF20:#0A84FF20")
                .frame(200, 100)
                .cornerRadius(12),
              Text("Overlay Text")
                .customFont("Geist", 17)
                .fontWeight("semibold")
                .foregroundColor("#007AFF:#0A84FF"),
            ]),
          ]),
        ]),
        
        Section("Container Relative Frame", [
          Card([
            Subhead("Size views relative to their container using a 12-column grid"),
            HStack(0, "center", [
              Rectangle()
                .fill("#FFB4AB:#FFB4AB")
                .containerRelativeFrame("horizontal", 12, 4, 0)
                .frame(undefined, 60),
              Rectangle()
                .fill("#A8E6B8:#A8E6B8")
                .containerRelativeFrame("horizontal", 12, 5, 0)
                .frame(undefined, 60),
            ])
              .frame(undefined, undefined, Infinity) 
              .padding(16)
              .background(Color("#F5F5F7:#2C2C2E"))
              .cornerRadius(8),
          ]),
        ]),

        Section("Nested Layouts", [
          Card([
            Subhead("Combine stacks for complex layouts"),
            VStack(16, "leading", [
              HStack(12, "center", [
                VStack(8, "leading", [
                  Text("Card Title")
                    .fontWeight("semibold"),
                  Text("Subtitle")
                    .style("caption"),
                ]),
                Spacer(),
                Text("$99")
                  .fontWeight("bold")
                  .foregroundColor("#007AFF:#0A84FF"),
              ]),
            ])
              .padding(16)
              .background(Color("#F5F5F7:#2C2C2E"))
              .cornerRadius(12),
          ]),
        ]),
      ],
      NavTabs("Layout"),
    ),
  );

  return layout;
}
