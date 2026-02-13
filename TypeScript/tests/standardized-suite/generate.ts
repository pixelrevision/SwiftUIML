/**
 * Generate standardized test cases as individual JSON files
 * Output: ../../Tests/SwiftUIMLTests/ExternalTestCases/
 */
import * as fs from "fs";
import * as path from "path";
import { generateColorTests } from "./views/color";
import { generateTextTests } from "./views/text";
import { generateButtonTests } from "./views/button";
import { generateSpacerTests } from "./views/spacer";
import { generateCircleTests } from "./views/circle";
import { generateEllipseTests } from "./views/ellipse";
import { generateCapsuleTests } from "./views/capsule";
import { generateRectangleTests } from "./views/rectangle";
import { generateRoundedRectangleTests } from "./views/rounded-rectangle";
import { generateDividerTests } from "./views/divider";
import { generateImageTests } from "./views/image";
import { generateHStackTests } from "./views/hstack";
import { generateVStackTests } from "./views/vstack";
import { generateZStackTests } from "./views/zstack";
import { generateLinearGradientTests } from "./views/linear-gradient";
import { generateRadialGradientTests } from "./views/radial-gradient";
import { generateAngularGradientTests } from "./views/angular-gradient";
import { generateLazyHStackTests } from "./views/lazy-hstack";
import { generateLazyVStackTests } from "./views/lazy-vstack";
import { generateEmptyViewTests } from "./views/empty-view";
import { generateLabelTests } from "./views/label";
import { generateAsyncImageTests } from "./views/async-image";
import { generateGridTests } from "./views/grid";
import { generateLazyHGridTests } from "./views/lazy-hgrid";
import { generateLazyVGridTests } from "./views/lazy-vgrid";
import { generateListTests } from "./views/list";
import { generateGroupTests } from "./views/group";
import { generateSectionTests } from "./views/section";
import { generateViewThatFitsTests } from "./views/view-that-fits";
import { generateTabViewTests } from "./views/tab-view";
import { generateGroupBoxTests } from "./views/group-box";
import { generateDisclosureGroupTests } from "./views/disclosure-group";
import { generateControlGroupTests } from "./views/control-group";
import { generateFormTests } from "./views/form";
import { generateColorPickerTests } from "./views/color-picker";
import { generateProgressViewTests } from "./views/progress-view";
import { generateGaugeTests } from "./views/gauge";
import { generateDatePickerTests } from "./views/date-picker";
import { generatePickerTests } from "./views/picker";
import { generateTextFieldTests } from "./views/text-field";
import { generateSecureFieldTests } from "./views/secure-field";
import { generateToggleTests } from "./views/toggle";
import { generateSliderTests } from "./views/slider";
import { generateStepperTests } from "./views/stepper";
import { generateTextEditorTests } from "./views/text-editor";
import { generateLinkTests } from "./views/link";
import { generateShareLinkTests } from "./views/share-link";
import { generateColorSchemeTests } from "./views/color-scheme";
import { generateContainerRelativeShapeTests } from "./views/container-relative-shape";
import { generateUnevenRoundedRectangleTests } from "./views/uneven-rounded-rectangle";
import { generateNavigationLinkTests } from "./views/navigation-link";
import { generateMenuTests } from "./views/menu";
import { generateWebViewTests } from "./views/web-view";
import { generateAllowsTighteningTests } from "./modifiers/allows-tightening";
import { generateAspectRatioTests } from "./modifiers/aspect-ratio";
import { generateBackgroundTests } from "./modifiers/background";
import { generateBackgroundColorTests } from "./modifiers/background-color";
import { generateBadgeTests } from "./modifiers/badge";
import { generateBaselineOffsetTests } from "./modifiers/baseline-offset";
import { generateBlendModeTests } from "./modifiers/blend-mode";
import { generateBlurTests } from "./modifiers/blur";
import { generateBoldTests } from "./modifiers/bold";
import { generateBorderTests } from "./modifiers/border";
import { generateBrightnessTests } from "./modifiers/brightness";
import { generateButtonBorderShapeTests } from "./modifiers/button-border-shape";
import { generateClipShapeTests } from "./modifiers/clip-shape";
import { generateClippedTests } from "./modifiers/clipped";
import { generateColorInvertTests } from "./modifiers/color-invert";
import { generateColorMultiplyTests } from "./modifiers/color-multiply";
import { generateColorSchemeTests as generateColorSchemeModifierTests } from "./modifiers/color-scheme";
import { generateContrastTests } from "./modifiers/contrast";
import { generateCornerRadiusTests } from "./modifiers/corner-radius";
import { generateControlSizeTests } from "./modifiers/control-size";
import { generateCoordinateSpaceTests } from "./modifiers/coordinate-space";
import { generateDisabledTests } from "./modifiers/disabled";
import { generateFixedSizeTests } from "./modifiers/fixed-size";
import { generateGrayscaleTests } from "./modifiers/grayscale";
import { generateButtonStyleTests } from "./modifiers/button-style";
import { generateFontTests } from "./modifiers/font";
import { generateFontWeightTests } from "./modifiers/font-weight";
import { generateForegroundColorTests } from "./modifiers/foreground-color";
import { generateFrameTests } from "./modifiers/frame";
import { generateHiddenTests } from "./modifiers/hidden";
import { generateHueRotationTests } from "./modifiers/hue-rotation";
import { generateItalicTests } from "./modifiers/italic";
import { generateKerningTests } from "./modifiers/kerning";
import { generateLineLimitTests } from "./modifiers/line-limit";
import { generateLineSpacingTests } from "./modifiers/line-spacing";
import { generateOffsetTests } from "./modifiers/offset";
import { generateOpacityTests } from "./modifiers/opacity";
import { generateOverlayTests } from "./modifiers/overlay";
import { generatePaddingTests } from "./modifiers/padding";
import { generateRenderingModeTests } from "./modifiers/rendering-mode";
import { generateResizableTests } from "./modifiers/resizable";
import { generateRotationEffectTests } from "./modifiers/rotation-effect";
import { generateSaturationTests } from "./modifiers/saturation";
import { generateScaleEffectTests } from "./modifiers/scale-effect";
import { generateShadowTests } from "./modifiers/shadow";
import { generateStrikethroughTests } from "./modifiers/strikethrough";
import { generateTintTests } from "./modifiers/tint";
import { generateUnderlineTests } from "./modifiers/underline";
import { generateContainerRelativeFrameTests } from "./modifiers/container-relative-frame";
import { generateIgnoresSafeAreaTests } from "./modifiers/ignores-safe-area";
import { generateLabelsHiddenTests } from "./modifiers/labels-hidden";
import { generateLayoutPriorityTests } from "./modifiers/layout-priority";
import { generateMinimumScaleFactorTests } from "./modifiers/minimum-scale-factor";
import { generateMultilineTextAlignmentTests } from "./modifiers/multiline-text-alignment";
import { generatePerspectiveTests } from "./modifiers/perspective";
import { generatePositionTests } from "./modifiers/position";
import { generateRedactedTests } from "./modifiers/redacted";
import { generateResponsiveTests } from "./modifiers/responsive";
import { generateRotation3DEffectTests } from "./modifiers/rotation-3d-effect";
import { generateSafeAreaInsetTests } from "./modifiers/safe-area-inset";
import { generateListRowTests } from "./modifiers/list-row";
import { generateListStyleTests } from "./modifiers/list-style";
import { generateLuminanceToAlphaTests } from "./modifiers/luminance-to-alpha";
import { generateMaskTests } from "./modifiers/mask";
import { generatePickerStyleTests } from "./modifiers/picker-style";
import { generateProgressViewStyleTests } from "./modifiers/progress-view-style";
import { generateToggleStyleTests } from "./modifiers/toggle-style";
import { generateToolbarTests } from "./modifiers/toolbar";
import { generateTrackingTests } from "./modifiers/tracking";
import { generateTruncationModeTests } from "./modifiers/truncation-mode";
import { generateAccessibilityTests } from "./modifiers/accessibility";
import { generateNavigationTitleTests } from "./modifiers/navigation-title";
import { generateNavigationBarBackButtonHiddenTests } from "./modifiers/navigation-bar-back-button-hidden";
import { generateNavigationBarTitleDisplayModeTests } from "./modifiers/navigation-bar-title-display-mode";
import { generateNavigationBarHiddenTests } from "./modifiers/navigation-bar-hidden";

const allTests = {
  ...generateColorTests(),
  ...generateTextTests(),
  ...generateButtonTests(),
  ...generateSpacerTests(),
  ...generateCircleTests(),
  ...generateEllipseTests(),
  ...generateCapsuleTests(),
  ...generateRectangleTests(),
  ...generateRoundedRectangleTests(),
  ...generateDividerTests(),
  ...generateImageTests(),
  ...generateHStackTests(),
  ...generateVStackTests(),
  ...generateZStackTests(),
  ...generateLinearGradientTests(),
  ...generateRadialGradientTests(),
  ...generateAngularGradientTests(),
  ...generateLazyHStackTests(),
  ...generateLazyVStackTests(),
  ...generateEmptyViewTests(),
  ...generateLabelTests(),
  ...generateAsyncImageTests(),
  ...generateGridTests(),
  ...generateLazyHGridTests(),
  ...generateLazyVGridTests(),
  ...generateListTests(),
  ...generateGroupTests(),
  ...generateSectionTests(),
  ...generateViewThatFitsTests(),
  ...generateTabViewTests(),
  ...generateGroupBoxTests(),
  ...generateDisclosureGroupTests(),
  ...generateControlGroupTests(),
  ...generateFormTests(),
  ...generateColorPickerTests(),
  ...generateProgressViewTests(),
  ...generateGaugeTests(),
  ...generateDatePickerTests(),
  ...generatePickerTests(),
  ...generateTextFieldTests(),
  ...generateSecureFieldTests(),
  ...generateToggleTests(),
  ...generateSliderTests(),
  ...generateStepperTests(),
  ...generateTextEditorTests(),
  ...generateLinkTests(),
  ...generateShareLinkTests(),
  ...generateColorSchemeTests(),
  ...generateContainerRelativeShapeTests(),
  ...generateUnevenRoundedRectangleTests(),
  ...generateNavigationLinkTests(),
  ...generateMenuTests(),
  ...generateWebViewTests(),
  ...generateAllowsTighteningTests(),
  ...generateAspectRatioTests(),
  ...generateBackgroundTests(),
  ...generateBackgroundColorTests(),
  ...generateBadgeTests(),
  ...generateBaselineOffsetTests(),
  ...generateBlendModeTests(),
  ...generateBlurTests(),
  ...generateBoldTests(),
  ...generateBorderTests(),
  ...generateBrightnessTests(),
  ...generateButtonBorderShapeTests(),
  ...generateClipShapeTests(),
  ...generateClippedTests(),
  ...generateColorInvertTests(),
  ...generateColorMultiplyTests(),
  ...generateColorSchemeModifierTests(),
  ...generateContrastTests(),
  ...generateCornerRadiusTests(),
  ...generateControlSizeTests(),
  ...generateCoordinateSpaceTests(),
  ...generateDisabledTests(),
  ...generateFixedSizeTests(),
  ...generateGrayscaleTests(),
  ...generateButtonStyleTests(),
  ...generateFontTests(),
  ...generateFontWeightTests(),
  ...generateForegroundColorTests(),
  ...generateFrameTests(),
  ...generateHiddenTests(),
  ...generateHueRotationTests(),
  ...generateItalicTests(),
  ...generateKerningTests(),
  ...generateLineLimitTests(),
  ...generateLineSpacingTests(),
  ...generateOffsetTests(),
  ...generateOpacityTests(),
  ...generateOverlayTests(),
  ...generatePaddingTests(),
  ...generateRenderingModeTests(),
  ...generateResizableTests(),
  ...generateRotationEffectTests(),
  ...generateSaturationTests(),
  ...generateScaleEffectTests(),
  ...generateShadowTests(),
  ...generateStrikethroughTests(),
  ...generateTintTests(),
  ...generateUnderlineTests(),
  ...generateContainerRelativeFrameTests(),
  ...generateIgnoresSafeAreaTests(),
  ...generateLabelsHiddenTests(),
  ...generateLayoutPriorityTests(),
  ...generateMinimumScaleFactorTests(),
  ...generateMultilineTextAlignmentTests(),
  ...generatePerspectiveTests(),
  ...generatePositionTests(),
  ...generateRedactedTests(),
  ...generateResponsiveTests(),
  ...generateRotation3DEffectTests(),
  ...generateSafeAreaInsetTests(),
  ...generateListRowTests(),
  ...generateListStyleTests(),
  ...generateLuminanceToAlphaTests(),
  ...generateMaskTests(),
  ...generatePickerStyleTests(),
  ...generateProgressViewStyleTests(),
  ...generateToggleStyleTests(),
  ...generateToolbarTests(),
  ...generateTrackingTests(),
  ...generateTruncationModeTests(),
  ...generateAccessibilityTests(),
  ...generateNavigationTitleTests(),
  ...generateNavigationBarBackButtonHiddenTests(),
  ...generateNavigationBarTitleDisplayModeTests(),
  ...generateNavigationBarHiddenTests(),
};

// Output directory: Tests/SwiftUIMLTests/ExternalTestCases/TypeScript/
// __dirname is TypeScript/dist/tests/standardized-suite/
// Need to go up to project root: ../../../../
const outputDir = path.join(
  __dirname,
  "..",
  "..",
  "..",
  "..",
  "Tests",
  "SwiftUIMLTests",
  "ExternalTestCases",
  "TypeScript",
);

// Clean output directory
if (fs.existsSync(outputDir)) {
  fs.rmSync(outputDir, { recursive: true });
}
fs.mkdirSync(outputDir, { recursive: true });

// Write individual JSON files
let count = 0;
for (const [testId, node] of Object.entries(allTests)) {
  const filePath = path.join(outputDir, `${testId}.json`);
  fs.writeFileSync(filePath, JSON.stringify(node, null, 2));
  count++;
}

console.log(
  `✅ Generated ${count} test cases to Tests/SwiftUIMLTests/ExternalTestCases/TypeScript/`,
);
