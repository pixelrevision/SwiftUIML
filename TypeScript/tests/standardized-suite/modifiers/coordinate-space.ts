/**
 * CoordinateSpace modifier test definitions
 * Must match Swift CoordinateSpaceTests.swift
 */
import { Node, ZStack, VStack, Color, Text } from "../../../src/index";

export function generateCoordinateSpaceTests(): Record<string, Node> {
  return {
    "modifier.coordinate-space.basic": ZStack("topLeading", [
      Color("blue").frame(200, 200).coordinateSpace("container"),
      Text("Content").font(18).padding(20).backgroundColor("white").cornerRadius(8),
    ]),

    "modifier.coordinate-space.multiple": VStack(20, undefined, [
      ZStack(undefined, [
        Color("red").frame(150, 100).coordinateSpace("redSpace"),
        Text("Red Space").foregroundColor("white"),
      ]),

      ZStack(undefined, [
        Color("green").frame(150, 100).coordinateSpace("greenSpace"),
        Text("Green Space").foregroundColor("white"),
      ]),

      ZStack(undefined, [
        Color("blue").frame(150, 100).coordinateSpace("blueSpace"),
        Text("Blue Space").foregroundColor("white"),
      ]),
    ]),
  };
}
