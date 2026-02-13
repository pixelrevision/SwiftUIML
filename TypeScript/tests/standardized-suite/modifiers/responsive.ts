/**
 * Responsive modifier test definitions
 * Must match Swift ResponsiveTests.swift
 */
import { Node, VStack, HStack, Text, Color, Breakpoint } from "../../../src/index";

const bp = Breakpoint;

/**
 * Creates a VStack showing a responsive node at different widths
 */
function widthProgression(
  widths: number[],
  spacing: number = 8,
  content: (width: number) => Node,
): Node {
  const children: Node[] = [];

  for (const width of widths) {
    children.push(
      VStack(2, undefined, [
        // Label showing the width
        Text(`${Math.floor(width)}w`)
          .font("caption2")
          .foregroundColor("#8E8E93:#98989D")
          .frame(40, undefined), // Fixed width of 40

        // Container at specific width
        content(width).frame(width, undefined),
      ]).backgroundColor("#AEAEB233:#3A3A3C33"),
    );
  }

  return VStack(spacing, undefined, children).padding(8);
}

/**
 * Creates an HStack showing a responsive node at different heights
 */
function heightProgression(
  heights: number[],
  spacing: number = 8,
  content: (height: number) => Node,
): Node {
  const children: Node[] = [];

  for (const height of heights) {
    children.push(
      VStack(2, undefined, [
        // Label showing the height
        Text(`${Math.floor(height)}h`)
          .font("caption2")
          .foregroundColor("#8E8E93:#98989D")
          .frame(undefined, 20),

        // Container at specific height
        content(height).frame(undefined, height),
      ]).backgroundColor("#AEAEB233:#3A3A3C33"),
    );
  }

  return HStack(spacing, undefined, children).padding(8);
}

export function generateResponsiveTests(): Record<string, Node> {
  return {
    // Width-based cascading (mobile-first, >= operators)
    "modifier.responsive.cascading-width": widthProgression([25, 50, 75, 100, 125], 8, (_width) => {
      return Color("clear")
        .frame(undefined, undefined, Infinity, undefined)
        .responsive(
          new Map([
            [
              bp.w(0),
              {
                backgroundColor: "#FF3B30:#FF453A",
              },
            ],
            [
              bp.w(50),
              {
                backgroundColor: "#FF9500:#FF9F0A",
              },
            ],
            [
              bp.w(100),
              {
                backgroundColor: "#34C759:#30D158",
              },
            ],
          ]),
        );
    }),

    // Height-based cascading (mobile-first, >= operators)
    "modifier.responsive.cascading-height": heightProgression(
      [25, 50, 75, 100, 125],
      8,
      (_height) => {
        return Color("clear")
          .frame(undefined, undefined, Infinity, undefined)
          .responsive(
            new Map([
              [
                bp.h(0),
                {
                  backgroundColor: "#FF3B30:#FF453A",
                },
              ],
              [
                bp.h(50),
                {
                  backgroundColor: "#FF9500:#FF9F0A",
                },
              ],
              [
                bp.h(100),
                {
                  backgroundColor: "#34C759:#30D158",
                },
              ],
            ]),
          );
      },
    ),

    // Width-based descending (desktop-first, < operators)
    "modifier.responsive.cascading-width-descending": widthProgression(
      [125, 100, 75, 50, 25],
      8,
      (_width) => {
        return Color("clear")
          .frame(undefined, undefined, Infinity, undefined)
          .responsive(
            new Map([
              [
                bp.wLessThan(50),
                {
                  backgroundColor: "#FF3B30:#FF453A",
                },
              ],
              [
                bp.wLessThan(75),
                {
                  backgroundColor: "#FF9500:#FF9F0A",
                },
              ],
              [
                bp.wLessThan(110),
                {
                  backgroundColor: "#34C759:#30D158",
                },
              ],
            ]),
          );
      },
    ),

    // Height-based descending (desktop-first, < operators)
    "modifier.responsive.cascading-height-descending": heightProgression(
      [125, 100, 75, 50, 25],
      8,
      (_height) => {
        return Color("clear")
          .frame(undefined, undefined, Infinity, undefined)
          .responsive(
            new Map([
              [
                bp.hLessThan(50),
                {
                  backgroundColor: "#FF3B30:#FF453A",
                },
              ],
              [
                bp.hLessThan(75),
                {
                  backgroundColor: "#FF9500:#FF9F0A",
                },
              ],
              [
                bp.hLessThan(110),
                {
                  backgroundColor: "#34C759:#30D158",
                },
              ],
            ]),
          );
      },
    ),

    // Mixed >= and < operators (first-match-wins)
    "modifier.responsive.mixed-operators": widthProgression(
      [50, 100, 150, 200, 250],
      8,
      (_width) => {
        return Color("clear")
          .frame(undefined, undefined, Infinity, undefined)
          .responsive(
            new Map([
              [
                bp.w(100),
                {
                  backgroundColor: "#FF3B30:#FF453A",
                },
              ],
              [
                bp.wLessThan(200),
                {
                  backgroundColor: "#34C759:#30D158",
                },
              ],
            ]),
          );
      },
    ),

    // Width ranges using compound breakpoints (AND logic)
    "modifier.responsive.width-ranges": widthProgression(
      [25, 50, 75, 100, 125, 150],
      8,
      (_width) => {
        return Color("clear")
          .frame(undefined, undefined, Infinity, undefined)
          .responsive(
            new Map([
              [
                bp.w(50).plus(bp.wLessThan(100)),
                {
                  backgroundColor: "#FF3B30:#FF453A",
                },
              ],
              [
                bp.w(100).plus(bp.wLessThan(150)),
                {
                  backgroundColor: "#FF9500:#FF9F0A",
                },
              ],
              [
                bp.w(150),
                {
                  backgroundColor: "#34C759:#30D158",
                },
              ],
            ]),
          );
      },
    ),
  };
}
