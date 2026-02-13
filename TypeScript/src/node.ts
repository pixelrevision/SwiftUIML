import { AttributeKey } from "./attribute-key";
import { ViewType } from "./view-type";

// Attribute value types that match SwiftUIML AttributeValue enum
export type AttrValue =
  | string
  | number
  | boolean
  | null
  | AttrValue[]
  | { [key: string]: AttrValue }
  | Node;

// Attribute as a [key, value] tuple
// Key is always stored as a string internally
export type Attribute = [string | AttributeKey, AttrValue];

// Attributes are stored as a 2D array to support duplicate keys and preserve order
export type Attributes = Attribute[];

export class Node {
  type: string;
  private _attributes: [string, AttrValue][];
  children: Node[];

  constructor(
    type: string | ViewType,
    attributes: Attributes | Map<string, AttrValue> = [],
    children: Node[] = [],
  ) {
    // Normalize ViewType to string
    this.type = typeof type === "string" ? type : type.value;

    // Convert attributes to 2D array if needed
    if (attributes instanceof Map) {
      // Convert Map to 2D array (for backward compatibility)
      this._attributes = [];
      for (const [key, value] of attributes.entries()) {
        this._attributes.push([key, value]);
      }
    } else if (Array.isArray(attributes)) {
      // Normalize keys to strings
      this._attributes = [];
      for (const [key, value] of attributes) {
        const keyStr = typeof key === "string" ? key : key.value;
        this._attributes.push([keyStr, value]);
      }
    } else {
      this._attributes = [];
    }

    this.children = children;
  }

  // Helper method to get first attribute value by key
  getAttribute(key: string | AttributeKey): AttrValue | undefined {
    const keyStr = typeof key === "string" ? key : key.value;
    for (const [k, v] of this._attributes) {
      if (k === keyStr) {
        return v;
      }
    }
    return undefined;
  }

  // Helper method to get all values for a key (supports duplicates)
  getAttributes(key: string | AttributeKey): AttrValue[] {
    const keyStr = typeof key === "string" ? key : key.value;
    const values: AttrValue[] = [];
    for (const [k, v] of this._attributes) {
      if (k === keyStr) {
        values.push(v);
      }
    }
    return values;
  }

  // Helper method to set an attribute (replaces first occurrence or appends)
  setAttribute(key: string | AttributeKey, value: AttrValue): void {
    const keyStr = typeof key === "string" ? key : key.value;
    for (let i = 0; i < this._attributes.length; i++) {
      if (this._attributes[i][0] === keyStr) {
        this._attributes[i] = [keyStr, value];
        return;
      }
    }
    // If not found, append
    this._attributes.push([keyStr, value]);
  }

  // Add an attribute (returns new Node, immutable) - always appends
  addingAttribute(key: string | AttributeKey, value: AttrValue): Node {
    const keyStr = typeof key === "string" ? key : key.value;
    const newAttributes = [...this._attributes, [keyStr, value] as [string, AttrValue]];
    return new Node(this.type, newAttributes, this.children);
  }

  // Custom JSON serialization to handle nested nodes
  toJSON(): any {
    const result: any = {
      type: this.type,
      attributes: this._attributes.map(([key, value]) => [key, serializeValue(value)]),
    };
    // Only include children if non-empty
    if (this.children.length > 0) {
      result.children = this.children.map((child) => child.toJSON());
    }
    return result;
  }
}

// Helper function to serialize attribute values (handles nested Nodes and special numeric values)
function serializeValue(value: AttrValue): any {
  // Handle special numeric values that aren't representable in JSON
  if (typeof value === "number") {
    if (value === Infinity) {
      return "$infinity";
    } else if (value === -Infinity) {
      return "$-infinity";
    } else if (Number.isNaN(value)) {
      return "$nan";
    }
    return value;
  }

  if (value instanceof Node) {
    return {
      $type: "node",
      value: value.toJSON(),
    };
  } else if (Array.isArray(value)) {
    return value.map((v) => serializeValue(v));
  } else if (value !== null && typeof value === "object") {
    const result: { [key: string]: any } = {};
    for (const [k, v] of Object.entries(value)) {
      result[k] = serializeValue(v);
    }
    return result;
  }
  return value;
}
