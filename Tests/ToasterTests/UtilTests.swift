//
//  UtilTests.swift
//  
//
//  Created by Daymein Gregorio on 1/15/23.
//

import XCTest
import SwiftUI
@testable import Toaster

final class UtilTests: XCTestCase {

  func test_hex_color() {
    let white = Color.white
    let hexWhite = Color(hex: "FFFFFF")
    XCTAssertEqual(hexWhite, white, "Hex white color not set properly")

    let black = Color.black
    let hexBlack = Color(hex: "#000000")
    XCTAssertEqual(hexBlack, black, "Hex black color not set properly")
  }
  
  func test_hex_color_with_alpha() {
    guard let hexBlack50 = Color(hex: "00000080")
    else { return XCTFail("Failed to generate hexBlack50") }
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    /// split color components to get alpha value
    let _ = UIColor(hexBlack50)
      .getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    XCTAssertEqual(red, 0.0, "hexBlack50 red not set properly")
    XCTAssertEqual(green, 0.0, "hexBlack50 green not set properly")
    XCTAssertEqual(blue, 0.0, "hexBlack50 blue not set properly")
    
    /// truncating the alpha component for "close enough" comparison
    let truncatedAlpha = Double(String(format: "%.2f", alpha))
    XCTAssertEqual(truncatedAlpha, 0.5, "hexBlack50 green not set properly")
  }

}
