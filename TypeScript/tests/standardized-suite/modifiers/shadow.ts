/**
 * Shadow modifier test definitions
 * Must match Swift ShadowTests.swift
 */
import { Node, Text, Color } from "../../../src/index";

export function generateShadowTests(): Record<string, Node> {
  return {
    "modifier.shadow.drop": Text("Shadow")
      .padding(16)
      .background(Color("#FFFFFF:#1C1C1E"))
      .cornerRadius(8)
      .shadow("#00000033:#00000033", 4, 0, 2),

    "modifier.shadow.colored": Text("Shadow")
      .padding(16)
      .background(Color("#FFFFFF:#1C1C1E"))
      .cornerRadius(8)
      .shadow("#007AFF66:#0A84FF66", 6, 0, 0),

    "modifier.shadow.large-radius": Text("Shadow")
      .padding(16)
      .background(Color("#FFFFFF:#1C1C1E"))
      .cornerRadius(8)
      .shadow("#00000044:#00000044", 12, 0, 4),

    "modifier.shadow.to-glow": Text("Glow")
      .padding(16)
      .background(Color("#FFFFFF:#1C1C1E"))
      .cornerRadius(8)
      .shadow("#00000066:#FFFFFFAA", 8, 0, 0),
  };
}
