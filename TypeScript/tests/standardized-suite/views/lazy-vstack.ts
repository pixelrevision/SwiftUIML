/**
 * LazyVStack view test definitions
 * Must match Swift LazyVStackTests.swift
 */
import { Node, LazyVStack, Color } from "../../../src/index";

export function generateLazyVStackTests(): Record<string, Node> {
  return {
    "view.lazyvstack.basic-spacing": LazyVStack(10, undefined, [
      Color("#FF375F:#FF6482").frame(30, 30),
      Color("#34C759:#30D158").frame(30, 30),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.lazyvstack.align-leading": LazyVStack(10, "leading", [
      Color("#FF375F:#FF6482").frame(20, 30),
      Color("#34C759:#30D158").frame(40, 30),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.lazyvstack.align-center": LazyVStack(10, "center", [
      Color("#FF375F:#FF6482").frame(20, 30),
      Color("#34C759:#30D158").frame(40, 30),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),

    "view.lazyvstack.align-trailing": LazyVStack(10, "trailing", [
      Color("#FF375F:#FF6482").frame(20, 30),
      Color("#34C759:#30D158").frame(40, 30),
      Color("#007AFF:#0A84FF").frame(30, 30),
    ]),
  };
}
