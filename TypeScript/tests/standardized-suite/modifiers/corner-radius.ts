/**
 * CornerRadius modifier test definitions
 * Must match Swift CornerRadiusTests.swift
 */
import { Node, Color } from "../../../src/index";

export function generateCornerRadiusTests(): Record<string, Node> {
  return {
    "modifier.corner-radius.small": Color("#007AFF:#0A84FF").frame(80, 60).cornerRadius(4),

    "modifier.corner-radius.medium": Color("#34C759:#30D158").frame(80, 60).cornerRadius(12),

    "modifier.corner-radius.large": Color("#FF9500:#FF9F0A").frame(80, 60).cornerRadius(24),
  };
}
