/**
 * ZStack view test definitions
 * Must match Swift ZStackTests.swift
 */
import { Node, ZStack, Circle } from "../../../src/index";

export function generateZStackTests(): Record<string, Node> {
  return {
    "view.zstack.basic-layering": ZStack("center", [
      Circle().foregroundColor("#FF375F80:#FF648280").frame(60, 60),
      Circle().foregroundColor("#34C75980:#30D15880").frame(45, 45),
      Circle().foregroundColor("#007AFF80:#0A84FF80").frame(30, 30),
    ]),

    "view.zstack.align-top-leading": ZStack("topLeading", [
      Circle().foregroundColor("#FF375F80:#FF648280").frame(60, 60),
      Circle().foregroundColor("#34C75980:#30D15880").frame(45, 45),
      Circle().foregroundColor("#007AFF80:#0A84FF80").frame(30, 30),
    ]),

    "view.zstack.align-bottom-trailing": ZStack("bottomTrailing", [
      Circle().foregroundColor("#FF375F80:#FF648280").frame(60, 60),
      Circle().foregroundColor("#34C75980:#30D15880").frame(45, 45),
      Circle().foregroundColor("#007AFF80:#0A84FF80").frame(30, 30),
    ]),
  };
}
