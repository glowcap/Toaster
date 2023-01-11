//
//  ToasterModifier.swift
//  Toaster
//
//  Created by Daymein Gregorio on 1/8/23.
//

import SwiftUI

struct ToasterModifier: ViewModifier {
  
  /// toast to be shown
  @Binding var toast: Toaster?
  
  /// needed to dismiss on tap
  @State private var workItem: DispatchWorkItem?
  
  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay(toasterOverlay)
      .onChange(of: toast) { _ in showToast() }
  }
  
  private var toasterOverlay: some View {
    ZStack {
      toasterView()
        .offset(y: -30)
    }.animation(.spring(), value: toast)
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
  
  private func showToast() {
    guard let toast else { return }
  
    UIImpactFeedbackGenerator(style: .light).impactOccurred()
    
    if toast.duration > 0 {
      workItem?.cancel()
      
      let task = DispatchWorkItem { dismissToast() }
  
      workItem = task
      DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
    }
  }
  
  private func dismissToast() {
    withAnimation() { toast = nil }
    workItem?.cancel()
    workItem = nil
  }
  
}


public extension View {
    func toast(_ toast: Binding<Toaster?>) -> some View {
        self.modifier(ToasterModifier(toast: toast))
    }
}
