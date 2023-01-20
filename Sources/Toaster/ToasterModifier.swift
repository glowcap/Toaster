//
//  ToasterModifier.swift
//  Toaster
//
//  Created by Daymein Gregorio on 1/8/23.
//

import SwiftUI

struct ToasterModifier: ViewModifier {
  
  /// toast content to be shown
  @Binding var toast: Toaster?
  
  /// needed to dismiss on tap
  @State private var workItem: DispatchWorkItem?
  
  func body(content: Content) -> some View {
    content
      .allowsHitTesting(toast == nil)
      .accessibilityHidden(toast != nil)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay(toasterOverlay)
      .onChange(of: toast) { _ in trackToast() }
      .onRotate { rotation in
        guard rotation != .unknown else { return }
        trackToast()
      }
  }
  
  private var toasterOverlay: some View {
    ZStack {
      if toast != nil {
        Color(.clear)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .disabled(true)
      }
      toasterView()
        .offset(y: -30)
        .accessibilitySortPriority(1000)
    }.animation(.spring(), value: toast)
    .accessibilityElement(children: .contain)
  }

  @ViewBuilder private func toasterView() -> some View {
    if let toast = toast {
      VStack {
        Spacer()
        ToasterView(
          type: toast.type,
          title: toast.title,
          message: toast.message)
        { dismissToast() }
      }
      .transition(.move(edge: .bottom))
    }
  }
  
  /// Tracks toast's life cycle
  private func trackToast() {
    guard let toast else { return }
  
    /// adds tactile feedback to notify the user that a toast is being displayed
    UIImpactFeedbackGenerator(style: .light).impactOccurred()
    
    guard toast.duration > 0 else { return }
    workItem = DispatchWorkItem { dismissToast() }
    DispatchQueue.main
      .asyncAfter(deadline: .now() + toast.duration, execute: workItem!)
  }
  
  
  /// Triggers toast dismissal with animation
  private func dismissToast() {
    withAnimation() { toast = nil }
    workItem?.cancel()
    workItem = nil
  }
  
}


extension View {
  
  /// Triggers the toast display with animation
  ///
  /// Once a ``Toaster`` State property is set, this method is called
  /// to trigger the display of the toast.
  ///
  /// ```swift
  /// toast($myInfoToast)
  /// ```
  ///
  /// - Parameter toast: Toaster struct with type, content and duration
  /// - Returns: A view with the toast animated over top
    public func toast(_ toast: Binding<Toaster?>) -> some View {
        modifier(ToasterModifier(toast: toast))
    }
  
}
