//
//  ToastType.swift
//  Toaster
//
//  Created by Daymein Gregorio on 1/8/23.
//

import SwiftUI

/// Type of toast to be displayed.
///
/// Internal variables key off of the case selected to
/// generated the icon, color, and accessibility prefix
/// to be used.
public enum ToastType: CaseIterable {
  /// Error Toast should be displayed
  ///
  /// Displayed with an 􀁡 icon and defaults to `Color.red`
  case error
  
  /// Info Toast should be displayed
  ///
  /// Displayed with an 􀅵 icon and defaults to `Color.blue`
  case info
  
  /// Success Toast should be displayed
  ///
  /// Displayed with an 􀁣 icon and defaults to `Color.green`
  case success
  
  /// Warning Toast should be displayed
  ///
  /// Displayed with an 􀇿 icon and defaults to `Color.orange`
  case warning
}

extension ToastType {
  
  var iconSystemName: String {
    /// SF Symbol Names
    switch self {
    case .error: return "xmark.circle.fill"
    case .info: return "info.circle.fill"
    case .success: return "checkmark.circle.fill"
    case .warning: return "exclamationmark.triangle.fill"
    }
  }
  
  // Color key for toast type
  var configKey: String {
    switch self {
    case .error: return Config.error
    case .info: return Config.info
    case .success: return Config.success
    case .warning: return Config.warning
    }
  }
  
  // Default colors for toasts
  var defaultColor: Color {
    switch self {
    case .error: return Color.red
    case .info: return Color.blue
    case .success: return Color.green
    case .warning: return Color.orange
    }
  }
  
  // TODO: - localization needed
  /// Accessibility label for icon when shown.
  var accessibilityLabel: String {
    switch self {
    case .error: return "Error"
    case .info: return "Information"
    case .success: return "Success"
    case .warning: return "Warning"
    }
  }

}
