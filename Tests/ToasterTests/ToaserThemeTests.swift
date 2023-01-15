//
//  ToaserThemeTests.swift
//  
//
//  Created by Daymein Gregorio on 1/15/23.
//

import XCTest
import SwiftUI
@testable import Toaster

final class ToaserThemeTests: XCTestCase {

  func test_toasterThemes_default_light() {
    let allTypes = ToastType.allCases
    
    allTypes.forEach { type in
      let sut = ToasterTheme(type, colorScheme: .light)
      XCTAssertEqual(
        sut.textColor, Color.primary,
        "textColor incorrectly set for \(type)"
      )
      XCTAssertEqual(
        sut.subtextColor, Color.secondary,
        "subtextColor incorrectly set for \(type)"
      )
      XCTAssertEqual(
        sut.background, Color(UIColor.systemBackground),
        "background incorrectly set for \(type)"
      )
      XCTAssertEqual(
        sut.accent, type.defaultColor,
        "accent incorrectly set for \(type)"
      )
    }
  }
  
  func test_toasterThemes_default_dark() {
    let allTypes = ToastType.allCases
    
    allTypes.forEach { type in
      let sut = ToasterTheme(type, colorScheme: .dark)
      XCTAssertEqual(
        sut.textColor, Color.primary,
        "textColor incorrectly set for \(type)"
      )
      XCTAssertEqual(
        sut.subtextColor, Color.secondary,
        "subtextColor incorrectly set for \(type)"
      )
      XCTAssertEqual(
        sut.background, Color(UIColor.systemGray5),
        "background incorrectly set for \(type)"
      )
      XCTAssertEqual(
        sut.accent, type.defaultColor,
        "accent incorrectly set for \(type)"
      )
    }
  }
  
  func test_toasterTheme_custom_light() {
    let allTypes = ToastType.allCases
    
    allTypes.forEach { type in
      let sut = ToasterTheme(
        type,
        colorScheme: .light,
        bundleURL: Bundle.module.url(forResource: "ToasterConfig", withExtension: "plist")
      )
      let textStr = String(describing: sut.textColor)
      let subTextStr = String(describing: sut.subtextColor)
      let backgroundStr = String(describing: sut.background)
      
      XCTAssertEqual(
        textStr, "#666666FF",
        "textColor incorrectly set for \(type)"
      )
      XCTAssertEqual(
        subTextStr, "#888888FF",
        "textColor incorrectly set for \(type)"
      )
      XCTAssertEqual(
        backgroundStr, "#444444FF",
        "textColor incorrectly set for \(type)"
      )
      
      /// ⚠️ Don't use "000000" to test becuase the
      /// returned String is `black` instead of `#000000FF`
      var expectedAccentStr: String {
        switch type {
        case .error: return "#101010FF"
        case .info: return "#222222FF"
        case .success: return "#333333FF"
        case .warning: return "#111111FF"
        }
      }
      let accentStr = String(describing: sut.accent)
      XCTAssertEqual(
        accentStr, expectedAccentStr,
        "accentColor incorrectly set for \(type)"
      )
    }
  }

}
