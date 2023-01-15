//
//  Util.swift
//  Toaster
//
//  Created by Daymein Gregorio on 1/8/23.
//

import Foundation

struct Util {
  
  /// Loads Toaster Config from app's bundle
  /// - Returns: Dictionary of theme colors in hex
  static func loadedToasterConfig() -> [String: String]? {
    guard let toasterConfig = Bundle.main.url(forResource: "ToasterConfig", withExtension: "plist"),
          let configData = try? Data(contentsOf: toasterConfig),
          let dict = try? PropertyListSerialization
            .propertyList(from: configData, options: [], format: nil) as? [String: String]
    /// No need to trigger a failure here since Toaster will fallback to default colors
    else { return nil }
    return dict
  }

}
