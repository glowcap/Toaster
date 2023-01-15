//
//  ContentView.swift
//  ToasterDemo
//
//  Created by Daymein Gregorio on 1/9/23.
//

import SwiftUI
import Toaster

struct ToastDemoView: View {
  
  @State private var toast: Toaster? = nil
  
  var body: some View {
    NavigationStack {
      VStack(spacing: 16) {
        infoButton
        successButton
        warningButton
        errorButton
      }
      .navigationTitle("Toaster Demo")
      .toast($toast)
    }
  }
  
  private func showToast(_ type: ToastType) -> Toaster? {
    guard toast == nil else { return toast }
    return Toaster(
      type,
      title: "This is Toaster",
      message: "Toaster provides information with accessibility in mind"
    )
  }
  
}

extension ToastDemoView {
  
  var infoButton: some View {
    Button("Show Info Toast") {
      toast = showToast(.info)
    }
    .toastButtonStyle(.info)
  }
  
  var successButton: some View {
    Button("Show Success Toast") {
      toast = showToast(.success)
    }
    .toastButtonStyle(.success)
  }
  
  var warningButton: some View {
    Button("Show Warning Toast") {
      toast = showToast(.warning)
    }
    .toastButtonStyle(.warning)
  }
  
  var errorButton: some View {
    Button("Show Error Toast") {
      toast = showToast(.error)
    }
    .toastButtonStyle(.error)
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ToastDemoView()
  }
}
