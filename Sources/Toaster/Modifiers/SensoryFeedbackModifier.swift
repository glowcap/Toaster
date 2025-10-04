//
//  SensoryFeedbackModifier.swift
//  Toaster
//
//  Created by Daymein Gregorio on 10/4/25.
//

import SwiftUI

private struct SensoryFeedbackModifier: ViewModifier {

  @Binding var toast: Toaster?

  /// Sensory feedback type based on toast type.
  /// - Note: Available for iOS 17+.
  @available(iOS 17.0, *)
  var feedback: SensoryFeedback {
    switch toast?.type {
    case .warning: .warning
    case .error: .error
    default: .success
    }
  }

  func body(content: Content) -> some View {
    if #available(iOS 17.0, *) {
      content
        .sensoryFeedback(feedback, trigger: toast) { _, newValue in
          newValue != nil
        }
    } else {
      content
    }
  }

}

extension View {

  /// Adds sensory feedback for users running iOS 17+.
  /// - Parameter toast: Toast.
  /// - Returns: Returns sensory feeback if available to user.
  func sensoryFeedback(_ toast: Binding<Toaster?>) -> some View {
      modifier(SensoryFeedbackModifier(toast: toast))
  }
}
