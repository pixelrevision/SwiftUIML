import SwiftUI
import SwiftUIMLCore
public struct FontModifierRenderer: ModifierRenderer {
  public static let key: AttributeKey = .font

  public static func apply(
    to view: any View,
    node: borrowing Node,
    value: AttributeValue,
    messageHandler: MessageHandler?
  ) -> (any View)? {
    if let fontName = value.string {
      return baseFont(for: view, fontName: fontName)
    }
    if let fontInfo = value.dict {
      if fontInfo[.type]?.string == "system" {
        return systemFont(for: view, attr: fontInfo)
      }
      else {
        return customFont(for: view, attr: fontInfo)
      }
    }
    return nil
  }

  private static func baseFont(for view: any View, fontName: String) -> (any View)? {
    switch fontName {
    case "headline": return view.font(.headline)
    case "subheadline": return view.font(.subheadline)
    case "body": return view.font(.body)
    case "callout": return view.font(.callout)
    case "caption": return view.font(.caption)
    case "caption2": return view.font(.caption2)
    case "title": return view.font(.title)
    case "title2": return view.font(.title2)
    case "title3": return view.font(.title3)
    case "largeTitle": return view.font(.largeTitle)
    default: return nil
    }
  }

  private static func systemFont(for view: any View, attr: [AttributeKey: AttributeValue]) -> (any View)? {
    guard let size = attr[.size]?.cgFloat else {
      return nil
    }
    return view.font(.system(
      size: size,
      weight: .init(attr[.weight]?.string),
      design: .init(attr[.design]?.string)
    ))
  }

  static func customFont(for view: any View, attr: [AttributeKey: AttributeValue]) -> (any View)? {
    guard let name = attr[.name]?.string else {
      return nil
    }
    if let fixedSize = attr[.fixedSize]?.cgFloat {
      return view.font(.custom(name, fixedSize: fixedSize))
    }
    guard let size = attr[.size]?.cgFloat else {
      return nil
    }
    if let relativeTo = attr[.relativeTo]?.string {
      return view.font(.custom(name, size: size, relativeTo: .init(relativeTo) ?? .body))
    }
    return view.font(.custom(name, size: size))
  }
}

#Preview {
  DebugView {
    TextNode("Title")
      .font(.title)
    
    TextNode("Body")
      .font(.body)
    
    TextNode("Caption")
      .font(.caption)
    
    TextNode("Footnote")
      .font(.footnote)
  }
}
