//
//  ToasterTheme.swift
//  
//
//  Created by Daymein Gregorio on 1/8/23.
//

import SwiftUI

/// Generates the toast theme.
/// - Note: Can be configured by the consumer with
///         the addtion of `ToasterConfig.plist`
///         in the app  bundle. Check `README.md`
///         for more information.
struct ToasterTheme {
  var textColor: Color = .primary
  var subtextColor: Color = .secondary
  var background: Color
  var accent: Color = Color(UIColor.systemGray)
  
  /// Generates the theming for the toast by either using the
  /// app's `ToasterConfig.plist` file or default colors
  /// - Parameters:
  ///   - type: Type of toast to be displayed
  ///   - colorScheme: Device color scheme (ie: `light`, `dark`)
  init(_ type: ToastType, colorScheme: ColorScheme) {
    let config = Util.loadedToasterConfig() ?? [String: String]()
    
    if let hex = config[type.configKey], let preferredColor = Color(hex: hex) {
      self.accent = preferredColor
    } else {
      self.accent = type.defaultColor
    }
    
    let isDark = colorScheme == .dark
    if let txtHex = config[isDark ? Config.textColorDark : Config.textColor],
       let textColor = Color(hex: txtHex)
    { self.textColor = textColor }
    
    if let subtxtHex = config[isDark ? Config.subtextColorDark : Config.subtextColor],
       let subtxtColor = Color(hex: subtxtHex)
    { self.subtextColor = subtxtColor }
    
    if let bgHex = config[isDark ? Config.backgroundDark : Config.background],
       let background = Color(hex: bgHex) {
      self.background = background
    } else {
      self.background = isDark ? Color(UIColor.systemGray5) : Color(UIColor.systemBackground)
    }
  }

}
