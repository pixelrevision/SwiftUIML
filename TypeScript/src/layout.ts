import { Node, Attributes, Attribute, AttrValue } from "./node";
import { AttributeKey } from "./attribute-key";

// Styles dictionary: style name -> attributes
export type Styles = { [styleName: string]: Attributes };

// Helper function to create style attributes more ergonomically
export function attr(key: string | AttributeKey, value: AttrValue): Attribute {
  return [key, value];
}

// Helper to create a style with attributes
export function style(...attributes: Attribute[]): Attribute[] {
  return attributes;
}

export class Layout {
  styles: Styles;
  content: Node;

  constructor(styles: Styles, content: Node) {
    this.styles = styles;
    this.content = content;
  }

  // Custom JSON serialization
  toJSON(): any {
    const serializedStyles: { [styleName: string]: any[][] } = {};

    for (const [styleName, attributes] of Object.entries(this.styles)) {
      // Convert Attributes to 2D array with serialized values
      serializedStyles[styleName] = attributes.map(([key, value]) => {
        const keyStr = typeof key === "string" ? key : (key as any).value;
        return [keyStr, serializeAttributeValue(value)];
      });
    }

    return {
      styles: serializedStyles,
      content: this.content.toJSON(),
    };
  }
}

// Helper to serialize attribute values (handles nested Nodes and special numeric values)
function serializeAttributeValue(value: AttrValue): any {
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
    return value.map((v) => serializeAttributeValue(v));
  } else if (value !== null && typeof value === "object") {
    const result: { [key: string]: any } = {};
    for (const [k, v] of Object.entries(value)) {
      result[k] = serializeAttributeValue(v);
    }
    return result;
  }
  return value;
}
