/**
 * ColorPicker view test definitions
 * Must match Swift ColorPickerTests.swift
 */
import { Node, Form, Section, ColorPicker } from "../../../src/index";

export function generateColorPickerTests(): Record<string, Node> {
  return {
    "view.color-picker.configurations": Form([
      Section([
        // Basic ColorPicker
        ColorPicker("Pick a color").onColorChange("colorChanged"),

        // ColorPicker with initial color
        ColorPicker("Theme Color", "#FF5733").onColorChange({ action: "themeColorChanged" }),

        // ColorPicker without opacity
        ColorPicker("Solid Color", "#00AAFFFF")
          .supportsOpacity(false)
          .onColorChange("solidColorChanged"),
      ]),
    ]),
  };
}
