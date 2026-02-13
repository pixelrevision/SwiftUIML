// Breakpoint pattern builder for responsive design
// Matches SwiftUIML BreakpointBuilder.swift

/**
 * Represents a responsive breakpoint pattern
 */
export class Breakpoint {
  readonly pattern: string;

  constructor(pattern: string) {
    this.pattern = pattern;
  }

  toString(): string {
    return this.pattern;
  }

  // Named breakpoints (matching Swift implementation)
  static readonly xs = new Breakpoint("xs"); // 0+
  static readonly sm = new Breakpoint("sm"); // 375+
  static readonly md = new Breakpoint("md"); // 768+
  static readonly lg = new Breakpoint("lg"); // 1024+
  static readonly xl = new Breakpoint("xl"); // 1366+

  // Width builders
  static w(value: number): Breakpoint {
    return new Breakpoint(`w>=${Math.floor(value)}`);
  }

  static wGreaterThan(value: number): Breakpoint {
    return new Breakpoint(`w>${Math.floor(value)}`);
  }

  static wLessThanOrEqual(value: number): Breakpoint {
    return new Breakpoint(`w<=${Math.floor(value)}`);
  }

  static wLessThan(value: number): Breakpoint {
    return new Breakpoint(`w<${Math.floor(value)}`);
  }

  // Height builders
  static h(value: number): Breakpoint {
    return new Breakpoint(`h>=${Math.floor(value)}`);
  }

  static hGreaterThan(value: number): Breakpoint {
    return new Breakpoint(`h>${Math.floor(value)}`);
  }

  static hLessThanOrEqual(value: number): Breakpoint {
    return new Breakpoint(`h<=${Math.floor(value)}`);
  }

  static hLessThan(value: number): Breakpoint {
    return new Breakpoint(`h<${Math.floor(value)}`);
  }

  // Combine with AND logic
  and(other: Breakpoint): Breakpoint {
    return new Breakpoint(`${this.pattern},${other.pattern}`);
  }

  // Convenience operator-like method
  plus(other: Breakpoint): Breakpoint {
    return this.and(other);
  }
}

// ============================================================================
// Standalone exports for better ergonomics
// ============================================================================

/**
 * Named breakpoint constants (standalone exports)
 * Use these directly without the Breakpoint. prefix
 *
 * @example
 * ```typescript
 * import { xs, sm, md, lg, xl } from "swiftuiml"
 *
 * Text("Hello").responsive(new Map([
 *   [sm, { font: "body" }],
 *   [lg, { font: "title" }]
 * ]))
 * ```
 */
export const xs = Breakpoint.xs;
export const sm = Breakpoint.sm;
export const md = Breakpoint.md;
export const lg = Breakpoint.lg;
export const xl = Breakpoint.xl;

/**
 * Width breakpoint builders (standalone exports)
 *
 * @example
 * ```typescript
 * import { w, h } from "swiftuiml"
 *
 * Text("Hello").responsive(new Map([
 *   [w(800), { padding: 20 }],
 *   [h(600), { fontSize: 18 }]
 * ]))
 * ```
 */
export const w = (value: number) => Breakpoint.w(value);
export const wGreaterThan = (value: number) => Breakpoint.wGreaterThan(value);
export const wLessThanOrEqual = (value: number) => Breakpoint.wLessThanOrEqual(value);
export const wLessThan = (value: number) => Breakpoint.wLessThan(value);

export const h = (value: number) => Breakpoint.h(value);
export const hGreaterThan = (value: number) => Breakpoint.hGreaterThan(value);
export const hLessThanOrEqual = (value: number) => Breakpoint.hLessThanOrEqual(value);
export const hLessThan = (value: number) => Breakpoint.hLessThan(value);
