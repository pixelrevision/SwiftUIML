#!/usr/bin/env node

/**
 * Generates SwiftUIML view combinations from TypeScript and saves them as JSON
 * for use in Swift snapshot tests.
 *
 * Run with: npm run generate-tests
 */

const { writeFileSync, mkdirSync } = require("fs");
const { join, dirname } = require("path");

// Import SwiftUIML (from dist/scripts to dist/src/index)
const {
  Text,
  VStack,
  HStack,
  Button,
  SystemImage,
  Color,
  Circle,
  LinearGradient,
  sm,
  md,
  lg,
  w,
} = require("../src/index.js");

// __dirname is available in CommonJS by default
// From dist/scripts/generate-test-views.js, go up to project root then into Tests
const OUTPUT_DIR = join(__dirname, "../../../Tests/SwiftUIMLTests/Resources/TypescriptGenerated");

interface TestView {
  name: string;
  description: string;
  node: any;
  width: number;
  height: number;
  /** Optional: test in multiple color schemes */
  colorSchemes?: ("light" | "dark")[];
  /** Optional: test at multiple sizes for responsive testing */
  sizes?: Array<{ width: number; height: number; suffix: string }>;
}

/**
 * Generate all test views
 */
function generateTestViews(): TestView[] {
  const views: TestView[] = [];

  // 1. Simple Text
  views.push({
    name: "simple-text",
    description: "Basic text with font and color",
    node: Text("Hello").font("body").foregroundColor("#007AFF"),
    width: 80,
    height: 40,
  });

  // 2. VStack with Multiple Children
  views.push({
    name: "vstack-basic",
    description: "Vertical stack with text hierarchy",
    node: VStack(8, "leading", [
      Text("Title").font("title").bold(),
      Text("Subtitle").font("body").foregroundColor("#666666"),
      Text("Description").font("caption"),
    ]).padding(20),
    width: 250,
    height: 150,
  });

  // 3. HStack with Icon
  views.push({
    name: "hstack-icon",
    description: "Horizontal stack with icon and text",
    node: HStack(8, "center", [
      SystemImage("star.fill").foregroundColor("#FFD700"),
      Text("Rating").font("body"),
    ]).padding(12),
    width: 120,
    height: 50,
  });

  // 4. Styled Button
  views.push({
    name: "styled-button",
    description: "Button with background",
    node: Button("Tap Me", { action: "tap" })
      .foregroundColor("#FFFFFF")
      .padding(10)
      .background(Color("#007AFF"))
      .cornerRadius(5),
    width: 120,
    height: 60,
  });

  // 5. Color Fills
  views.push({
    name: "color-fills",
    description: "VStack with colored backgrounds",
    node: VStack(10, "center", [
      Color("#FF375F").frame(30, 30),
      Color("#34C759").frame(30, 30),
      Color("#007AFF").frame(30, 30),
    ]),
    width: 60,
    height: 130,
  });

  // 6. Responsive Text (test at multiple sizes)
  views.push({
    name: "responsive-text",
    description: "Text with breakpoint-based font sizes",
    node: Text("Responsive").responsive(
      new Map([
        [sm, { font: "body" }],
        [md, { font: "title" }],
        [lg, { font: "largeTitle" }],
      ]),
    ),
    width: 300,
    height: 60,
    sizes: [
      { width: 300, height: 60, suffix: "sm" },
      { width: 800, height: 60, suffix: "md" },
      { width: 1200, height: 60, suffix: "lg" },
    ],
  });

  // 7. Themed Text (Light/Dark)
  views.push({
    name: "themed-text",
    description: "Text with color scheme conditional",
    node: Text("Themed Text")
      .font("title")
      .colorSchemeConditional({
        light: { foregroundColor: "#000000" },
        dark: { foregroundColor: "#FFFFFF" },
      })
      .padding(20),
    width: 200,
    height: 80,
    colorSchemes: ["light", "dark"],
  });

  // 8. Gradient
  views.push({
    name: "gradient",
    description: "Linear gradient background",
    node: Text("Gradient")
      .font("title")
      .foregroundColor("#FFFFFF")
      .padding(16)
      .background(LinearGradient(["#FF375F", "#FF9500"], "topLeading", "bottomTrailing"))
      .cornerRadius(8),
    width: 180,
    height: 80,
  });

  // 9. Circle with Icon
  views.push({
    name: "circle-icon",
    description: "Circle shape with overlay icon",
    node: Circle()
      .fill("#FF375F")
      .frame(60, 60)
      .overlay(SystemImage("heart.fill").foregroundColor("#FFFFFF")),
    width: 80,
    height: 80,
  });

  // 10. Nested Layout
  views.push({
    name: "nested-layout",
    description: "HStack with icon columns",
    node: HStack(16, "center", [
      VStack(8, "center", [
        SystemImage("heart.fill").foregroundColor("#FF375F"),
        Text("Health").font("caption"),
      ]),
      VStack(8, "center", [
        SystemImage("star.fill").foregroundColor("#FFD700"),
        Text("Favorites").font("caption"),
      ]),
      VStack(8, "center", [
        SystemImage("bell.fill").foregroundColor("#007AFF"),
        Text("Alerts").font("caption"),
      ]),
    ]).padding(20),
    width: 280,
    height: 80,
  });

  return views;
}

/**
 * Save a test view to JSON file
 */
function saveTestView(view: TestView, outputDir: string) {
  const json = JSON.stringify(view.node, null, 2);
  const filename = `${view.name}.json`;
  const filepath = join(outputDir, filename);

  writeFileSync(filepath, json, "utf8");
  console.log(`✅ Generated: ${filename}`);
}

/**
 * Generate manifest file with metadata about all test views
 */
function generateManifest(views: TestView[], outputDir: string) {
  const manifest = {
    count: views.length,
    views: views.map((v) => ({
      name: v.name,
      description: v.description,
      file: `${v.name}.json`,
      width: v.width,
      height: v.height,
      colorSchemes: v.colorSchemes,
      sizes: v.sizes,
    })),
  };

  const filepath = join(outputDir, "manifest.json");
  writeFileSync(filepath, JSON.stringify(manifest, null, 2), "utf8");
  console.log(`✅ Generated: manifest.json`);
}

/**
 * Main execution
 */
function main() {
  console.log("🚀 Generating TypeScript test views for Swift snapshots...\n");

  // Ensure output directory exists
  mkdirSync(OUTPUT_DIR, { recursive: true });

  // Generate all views
  const views = generateTestViews();

  // Save each view to JSON
  views.forEach((view) => saveTestView(view, OUTPUT_DIR));

  // Generate manifest
  generateManifest(views, OUTPUT_DIR);

  console.log(`\n✨ Generated ${views.length} test views in:`);
  console.log(`   ${OUTPUT_DIR}`);
  console.log("\n💡 Next steps:");
  console.log("   1. Run Swift tests to generate snapshots from these JSON files");
  console.log("   2. Review snapshots to ensure TypeScript → Swift rendering matches expectations");
}

main();
