//
//  ToastType.swift
//  Toaster
//
//  Created by Daymein Gregorio on 1/8/23.
//

import SwiftUI

/// Types of toasts that can be displayed.
public enum ToastType: CaseIterable {
  case error
  case info
  case success
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
  /// Title prefix for screen readers.
  var prefix: String {
    switch self {
    case .error: return "error,"
    case .info: return "information,"
    case .success: return "success,"
    case .warning: return "warning,"
    }
  }
  
}
