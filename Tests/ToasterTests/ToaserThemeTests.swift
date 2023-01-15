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

}
