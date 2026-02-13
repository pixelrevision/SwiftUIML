/**
 * Slider view test definitions
 * Must match Swift SliderTests.swift
 */
import { Node, VStack, Slider, Color } from "../../../src/index";

export function generateSliderTests(): Record<string, Node> {
  return {
    "view.slider.configurations": VStack(20, "leading", [
      // Basic slider with default range (0.0 to 1.0)
      Slider(),

      // Slider with custom value
      Slider(0.75),

      // Slider with custom range (0 to 100)
      Slider(50, 0, 100),

      // Slider with step value
      Slider(5, 0, 10, 1),

      // Slider with styling
      Slider(0.6).padding(8).background(Color("#F0F0F0")).cornerRadius(6),
    ]).padding(20),
  };
}
