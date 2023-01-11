//
//  Util.swift
//  Toaster
//
//  Created by Daymein Gregorio on 1/8/23.
//

import Foundation

struct Util {
  
  static func loadedToasterConfig() -> [String: String]? {
    guard let toasterConfig = Bundle.main.url(forResource: "ToasterConfig", withExtension: "plist"),
          let configData = try? Data(contentsOf: toasterConfig),
          let dict = try? PropertyListSerialization
            .propertyList(from: configData, options: [], format: nil) as? [String: String]
    else { return nil }
    return dict
  }

}
