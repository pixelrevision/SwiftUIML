/**
 * Stepper view test definitions
 * Must match Swift StepperTests.swift
 */
import { Node, VStack, Stepper, Color } from "../../../src/index";

export function generateStepperTests(): Record<string, Node> {
  return {
    "view.stepper.configurations": VStack(20, "leading", [
      // Basic stepper with default range (0 to 100)
      Stepper("Volume"),

      // Stepper with custom value
      Stepper("Brightness", 50),

      // Stepper with custom range (0 to 10)
      Stepper("Level", 5, 0, 10),

      // Stepper with custom step value
      Stepper("Count", 10, 0, 100, 5),

      // Stepper with styling
      Stepper("Temperature", 72, 60, 80).padding(8).background(Color("#F0F0F0")).cornerRadius(6),
    ]).padding(20),
  };
}
