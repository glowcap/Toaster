//
//  ToastButtonModifier.swift
//  ToasterDemo
//
//  Created by Daymein Gregorio on 1/15/23.
//

import SwiftUI
import Toaster

struct ToastButtonModifier: ViewModifier {
  
  var toastType: ToastType
  
  var tint: Color {
    switch toastType {
    case .error: return .red
    case .info: return .blue
    case .success: return .green
    case .warning: return .orange
    }
  }
  
  func body(content: Content) -> some View {
    content
      .foregroundColor(.white)
      .buttonStyle(.borderedProminent)
      .tint(tint)
  }
}

extension View {
  func toastButtonStyle(_ toastType: ToastType) -> some View {
    modifier(ToastButtonModifier(toastType: toastType))
  }
}
