//
//  View+.swift
//  
//
//  Created by Daymein Gregorio on 1/14/23.
//

import SwiftUI

/// Adds device rotation listener to a view
struct DeviceRotationViewModifier: ViewModifier {
  let action: (UIDeviceOrientation) -> Void
  
  func body(content: Content) -> some View {
    content
      .onAppear()
      .onReceive(
        NotificationCenter
          .default
          .publisher(for: UIDevice.orientationDidChangeNotification)
      ) { _ in action(UIDevice.current.orientation) }
  }
  
}

extension View {
  
  func onRotate(
    perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
      modifier(DeviceRotationViewModifier(action: action))
  }
  
}
