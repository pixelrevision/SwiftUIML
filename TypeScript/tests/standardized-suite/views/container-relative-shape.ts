/**
 * ContainerRelativeShape view test definitions
 * Must match Swift ContainerRelativeShapeTests.swift
 */
import { Node, ZStack, ContainerRelativeShape } from "../../../src/index";

export function generateContainerRelativeShapeTests(): Record<string, Node> {
  return {
    "view.container-relative-shape.filled-and-stroked": ZStack(undefined, [
      ContainerRelativeShape().foregroundColor("#34C75980"),
      ContainerRelativeShape().stroke("#34C759", 3),
    ]),
  };
}
