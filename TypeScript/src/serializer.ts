/**
 * Utility functions for SwiftUIML.
 *
 * Note: For JSON serialization, use JSON.stringify() with the built-in toJSON() methods on Node and Layout.
 */

import { Node } from "./node";

export type AttrValue = any;

/**
 * Recursively applies stable IDs to nodes that don't have an explicit ID attribute.
 * IDs are generated as "ViewType.index" (e.g., "Text.0", "VStack.1", etc.)
 */
export function addStableIds(node: any): any {
  const result = applyStableIds(node, {});
  return result.node;
}

function applyStableIds(
  node: any,
  counters: { [key: string]: number },
): { node: any; counters: { [key: string]: number } } {
  const updatedCounters = { ...counters };
  let updatedAttributes = [...node._attributes];

  // Check if this node has an explicit ID
  const hasId = updatedAttributes.some(([key]) => key === "id");

  if (!hasId) {
    const typeKey = node.type;
    const index = updatedCounters[typeKey] ?? 0;
    updatedCounters[typeKey] = index + 1;
    updatedAttributes.push(["id", `${typeKey}.${index}`]);
  }

  // Recursively process children
  let updatedChildren: any[] = [];
  let childCounters = updatedCounters;

  for (const child of node.children) {
    const result = applyStableIds(child, childCounters);
    updatedChildren.push(result.node);
    childCounters = result.counters;
  }

  // Create new node with updated attributes and children
  const NodeClass = node.constructor;
  const updatedNode = new NodeClass(node.type, updatedAttributes, updatedChildren);

  return { node: updatedNode, counters: childCounters };
}
