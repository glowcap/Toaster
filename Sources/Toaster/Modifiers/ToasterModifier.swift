//
//  ToasterModifier.swift
//  Toaster
//
//  Created by Daymein Gregorio on 1/8/23.
//

import SwiftUI

struct ToasterModifier: ViewModifier {
  
  /// Toast content to be shown.
  @Binding var toast: Toaster?

  /// needed to dismiss on tap.
  @State private var workItem: DispatchWorkItem?

  /// Vertical drag gesture amount.
  @State private var verticalDragAmount: CGFloat = .zero

  func body(content: Content) -> some View {
    content
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
          .allowsHitTesting(false)
      }
      toasterView()
        .offset(y: -30 + verticalDragAmount)
        .accessibilitySortPriority(1000)
        .gesture(
          DragGesture(coordinateSpace: .local)
            .onChanged(handleDragChanged)
            .onEnded(handleDragEnded)
        )
    }
    .animation(.spring, value: toast)
    .accessibilityElement(children: .contain)
  }

  @ViewBuilder private func toasterView() -> some View {
    if let toast = toast {
      VStack {
        ToasterView(
          type: toast.type,
          title: toast.title,
          message: toast.message)
        { dismissToast() }
      }
      .frame(maxHeight: .infinity, alignment: .bottom)
      .transition(.move(edge: .bottom))
    }
  }
  
  /// Handles drag changes while drag is active.
  /// - Parameter drag: Drag value.
  private func handleDragChanged(_ drag: DragGesture.Value) {
    let dragHeight = drag.translation.height
    // ignore drags that would move the toast up
    guard dragHeight > 0 else { return }
    verticalDragAmount = dragHeight
  }
  
  /// Handles end of drag.
  /// - Parameter drag: Drag value
  private func handleDragEnded(_ drag: DragGesture.Value) {
    withAnimation(.smooth) {
      if drag.translation.height > 80 {
        dismissToast()
      }
      // always reset the drag amount
      verticalDragAmount = .zero
    }
  }

  /// Tracks toast's life cycle
  private func trackToast() {
    guard let toast,
          toast.duration > 0
    else { return }
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
      self.modifier(ToasterModifier(toast: toast))
        .sensoryFeedback(toast)
    }
  
}
