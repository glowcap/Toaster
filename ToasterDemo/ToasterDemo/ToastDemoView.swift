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
    Button {
      toast = showToast(.info)
    } label: {
      Text("Show Info Toast")
        .foregroundColor(.white)
    }
    .buttonStyle(.borderedProminent)
  }
  
  var successButton: some View {
    Button {
      toast = showToast(.success)
    } label: {
      Text("Show Success Toast")
        .foregroundColor(.white)
    }
    .buttonStyle(.borderedProminent)
    .tint(.green)
  }
  
  var warningButton: some View {
    Button {
      toast = showToast(.warning)
    } label: {
      Text("Show Warning Toast")
        .foregroundColor(.white)
    }
    .buttonStyle(.borderedProminent)
    .tint(.orange)
  }
  
  var errorButton: some View {
    Button {
      toast = showToast(.error)
    } label: {
      Text("Show Error Toast")
        .foregroundColor(.white)
    }
    .buttonStyle(.borderedProminent)
    .tint(.red)
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ToastDemoView()
  }
}
