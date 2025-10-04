//
//  SwipeToDismissModifier.swift
//  Toaster
//
//  Created by Daymein Gregorio on 10/4/25.
//

import SwiftUI

struct SwipeToDismiss: ViewModifier {
  @Binding var isPresented: Bool

  @State private var verticalDragAmount: CGFloat = .zero
  @State private var opacityAmount: CGFloat = 1

  func body(content: Content) -> some View {
    content
      .offset(y: verticalDragAmount)
      .opacity(opacityAmount)
      .gesture(
        DragGesture()
          .onChanged { drag in
            withAnimation {
              verticalDragAmount = drag.translation.height
              if drag.translation.height < 100 {
                // fade out
                opacityAmount = (100 - verticalDragAmount) / 100
              } else {
                opacityAmount = 0
              }
            }
          }
          .onEnded { drag in
            withAnimation {
              if drag.translation.height > 100 {
                isPresented = false
                opacityAmount = 0
              } else {
                verticalDragAmount = 0
                opacityAmount = 1
              }
            }
          }
      )
  }

}

extension View {

  func swipeToDismiss(isPresented: Binding<Bool>) -> some View {
    modifier(SwipeToDismiss(isPresented: isPresented))
  }
}
