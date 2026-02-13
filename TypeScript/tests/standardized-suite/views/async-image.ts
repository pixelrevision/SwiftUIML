/**
 * AsyncImage view test definitions
 * Must match Swift AsyncImageTests.swift
 */
import { Node, AsyncImage, AsyncImageEmpty, Text, VStack } from "../../../src/index";

export function generateAsyncImageTests(): Record<string, Node> {
  return {
    "view.async-image.custom-empty": AsyncImage("https://example.com/image.jpg", [
      AsyncImageEmpty([
        VStack(8, undefined, [Text("Loading...").foregroundColor("#000000:#FFFFFF")]),
      ]),
    ]).frame(100, 100),
  };
}
