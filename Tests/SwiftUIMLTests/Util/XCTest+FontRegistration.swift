import XCTest
import UIKit

enum FontLoadError: Error {
  case resourceNotFound
  case couldNotCreateCGFont
  case couldNotRegisterFont
}

extension XCTest {
  func registerFont(name: String, ext: String = "ttf") throws -> String {
    guard let fontURL = Bundle.module.url(forResource: name, withExtension: ext) else {
      throw FontLoadError.resourceNotFound
    }
    guard
      let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
      let font = CGFont(fontDataProvider)
    else {
      throw FontLoadError.couldNotCreateCGFont
    }
    var error: Unmanaged<CFError>?
    guard CTFontManagerRegisterGraphicsFont(font, &error) else {
      throw FontLoadError.couldNotRegisterFont
    }
    return font.postScriptName as String? ?? ""
  }
}
