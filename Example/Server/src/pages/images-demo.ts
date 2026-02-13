import {
  AsyncImage,
  HStack,
  Image,
  Layout,
  SystemImage,
  VStack
} from "swiftuiml-typescript";
import { Card, Header, NavTabs, Page, Section, Subhead } from "../components";
import { styles } from "../styles";

export function imagesDemo() {
  const layout = new Layout(
    styles,
    Page(
      [
        Header("Images & Media", "Display SF Symbols, remote images, and visual content"),

        Section("SF Symbols", [
          Card([
            Subhead("Apple's comprehensive symbol library with over 5000 icons"),
            HStack(24, "center", [
              SystemImage("star.fill")
                .foregroundColor("#FFD700:#FFD700")
                .font(32),
              SystemImage("heart.fill")
                .foregroundColor("#FF3B30:#FF453A")
                .font(32),
              SystemImage("bolt.fill")
                .foregroundColor("#FFCC00:#FFD60A")
                .font(32),
              SystemImage("checkmark.circle.fill")
                .foregroundColor("#34C759:#30D158")
                .font(32),
            ])
              .padding(20),
          ]),
        ]),

        Section("Symbol Sizes", [
          Card([
            Subhead("Scale symbols with font sizes"),
            HStack(16, "center", [
              SystemImage("flame.fill")
                .foregroundColor("#FF9500:#FF9F0A")
                .font(16),
              SystemImage("flame.fill")
                .foregroundColor("#FF9500:#FF9F0A")
                .font(24),
              SystemImage("flame.fill")
                .foregroundColor("#FF9500:#FF9F0A")
                .font(32),
              SystemImage("flame.fill")
                .foregroundColor("#FF9500:#FF9F0A")
                .font(48),
            ]),
          ]),
        ]),

        Section("Styled Symbols", [
          Card([
            Subhead("Combine with other modifiers for rich visuals"),
            VStack(16, "center", [
              SystemImage("cloud.sun.fill")
                .foregroundColor("#007AFF:#0A84FF")
                .font(64),
              SystemImage("moon.stars.fill")
                .foregroundColor("#5856D6:#5E5CE6")
                .font(64),
            ]),
          ]),
        ]),

        Section("Local Images", [
          Card([
            Subhead("Images bundled with the app"),
            Image("Abstract")
              .resizable()
              .aspectRatio(1.5, "fill")
              .frame(300, 200)
              .cornerRadius(12),
          ]),
        ]),

        Section("Async Images", [
          Card([
            Subhead("Load images from remote URLs"),
            AsyncImage("https://picsum.photos/300/200")
              .frame(300, 200)
              .cornerRadius(12),
          ]),
        ]),
      ],
      NavTabs("Images"),
    ),
  );

  return layout;
}
