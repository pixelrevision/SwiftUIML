// Animation types and builder functions for SwiftUIML animations
import { AttrValue } from "./node";
import { AttributeKey } from "./attribute-key";

/**
 * Animation types supported by SwiftUIML
 */
export type AnimationType =
  // Base animations - timing curves
  | "easeIn"
  | "easeOut"
  | "easeInOut"
  | "linear"
  // Base animations - spring
  | "spring"
  | "bouncy"
  | "smooth"
  | "snappy"
  // Animation modifiers
  | "delay"
  | "speed"
  | "repeatCount"
  | "repeatForever";

/**
 * Animation value that can be chained and converted to AttributeValue
 */
export interface AnimationValue {
  type: AnimationType;
  parameters: { [key: string]: AttrValue };
  next?: AnimationValue;
}

/**
 * Base class for building chainable animations
 */
class Animation {
  private animationValue: AnimationValue;

  constructor(type: AnimationType, parameters: { [key: string]: AttrValue } = {}) {
    this.animationValue = { type, parameters };
  }

  /**
   * Add a delay before the animation starts
   */
  delay(delay: number): Animation {
    return this.chain(new Animation("delay", { delay }));
  }

  /**
   * Modify the speed of the animation
   */
  speed(speed: number): Animation {
    return this.chain(new Animation("speed", { speed }));
  }

  /**
   * Repeat the animation a specific number of times
   */
  repeatCount(count: number, autoreverses: boolean = false): Animation {
    return this.chain(new Animation("repeatCount", { count, autoreverses }));
  }

  /**
   * Repeat the animation forever
   */
  repeatForever(autoreverses: boolean = false): Animation {
    return this.chain(new Animation("repeatForever", { autoreverses }));
  }

  /**
   * Convert to AttributeValue dictionary format
   */
  toAttributeValue(): { [key: string]: AttrValue } {
    const result: { [key: string]: AttrValue } = {
      type: this.animationValue.type,
      ...this.animationValue.parameters,
    };

    if (this.animationValue.next) {
      result.next = new Animation(
        this.animationValue.next.type,
        this.animationValue.next.parameters,
      ).toAttributeValue();

      // Copy over the next chain
      let current = this.animationValue.next;
      let resultCurrent = result.next as { [key: string]: AttrValue };

      while (current.next) {
        resultCurrent.next = {
          type: current.next.type,
          ...current.next.parameters,
        };
        current = current.next;
        resultCurrent = resultCurrent.next as { [key: string]: AttrValue };
      }
    }

    return result;
  }

  private chain(nextAnimation: Animation): Animation {
    // Find the end of the current chain
    let current = this.animationValue;
    while (current.next) {
      current = current.next;
    }

    // Append the new animation
    current.next = nextAnimation.animationValue;

    return this;
  }
}

// Timing curve animations

/**
 * An ease-in animation
 */
export function easeIn(duration: number = 0.35): Animation {
  return new Animation("easeIn", { duration });
}

/**
 * An ease-out animation
 */
export function easeOut(duration: number = 0.35): Animation {
  return new Animation("easeOut", { duration });
}

/**
 * An ease-in-out animation
 */
export function easeInOut(duration: number = 0.35): Animation {
  return new Animation("easeInOut", { duration });
}

/**
 * A linear animation
 */
export function linear(duration: number = 0.35): Animation {
  return new Animation("linear", { duration });
}

// Spring animations

/**
 * A spring animation
 */
export function spring(
  response: number = 0.55,
  dampingFraction: number = 0.825,
  blendDuration: number = 0,
): Animation {
  return new Animation("spring", { response, dampingFraction, blendDuration });
}

/**
 * A bouncy animation
 */
export function bouncy(duration: number = 0.5): Animation {
  return new Animation("bouncy", { duration });
}

/**
 * A smooth animation
 */
export function smooth(duration: number = 0.5): Animation {
  return new Animation("smooth", { duration });
}

/**
 * A snappy animation
 */
export function snappy(duration: number = 0.5): Animation {
  return new Animation("snappy", { duration });
}

// Animation modifiers (can also be used standalone)

/**
 * Delay modifier (can be used as standalone animation)
 */
export function delay(delay: number): Animation {
  return new Animation("delay", { delay });
}

/**
 * Speed modifier (can be used as standalone animation)
 */
export function speed(speed: number): Animation {
  return new Animation("speed", { speed });
}

/**
 * Repeat count modifier (can be used as standalone animation)
 */
export function repeatCount(count: number, autoreverses: boolean = false): Animation {
  return new Animation("repeatCount", { count, autoreverses });
}

/**
 * Repeat forever modifier (can be used as standalone animation)
 */
export function repeatForever(autoreverses: boolean = false): Animation {
  return new Animation("repeatForever", { autoreverses });
}
