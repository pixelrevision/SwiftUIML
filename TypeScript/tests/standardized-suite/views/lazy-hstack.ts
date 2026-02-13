/**
 * LazyHStack view test definitions
 * Must match Swift LazyHStackTests.swift
 */
import { Node, LazyHStack, Color } from "../../../src/index";

export function generateLazyHStackTests(): Record<string, Node> {
  return {
    "view.lazyhstack.basic-spacing": LazyHStack(10, undefined, [
      Color("#FF375F:#FF6482").frame(30, 30),
      Color("#34C759:#30D158").frame(30, 30),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.lazyhstack.align-top": LazyHStack(10, "top", [
      Color("#FF375F:#FF6482").frame(30, 20),
      Color("#34C759:#30D158").frame(30, 40),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.lazyhstack.align-center": LazyHStack(10, "center", [
      Color("#FF375F:#FF6482").frame(30, 20),
      Color("#34C759:#30D158").frame(30, 40),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.lazyhstack.align-bottom": LazyHStack(10, "bottom", [
      Color("#FF375F:#FF6482").frame(30, 20),
      Color("#34C759:#30D158").frame(30, 40),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),
  };
}
