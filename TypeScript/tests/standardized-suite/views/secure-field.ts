/**
 * SecureField view test definitions
 * Must match Swift SecureFieldTests.swift
 */
import { Node, SecureField, Color } from "../../../src/index";

export function generateSecureFieldTests(): Record<string, Node> {
  return {
    "view.secure-field.basic": SecureField("Enter password", "secret123")
      .padding(10)
      .background(Color("#F5F5F5"))
      .cornerRadius(8)
      .padding(20),
  };
}
