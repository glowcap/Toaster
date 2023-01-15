//
//  ToasterView.swift
//  Toaster
//
//  Created by Daymein Gregorio on 1/8/23.
//

import SwiftUI

struct ToasterView: View {
  @Environment(\.colorScheme) private var colorScheme
  
  var type: ToastType
  var title: String
  var message: String?
  
  var onCancel: (() -> Void)
  
  var accessibilityTitle: String {
    "\(type.prefix) \(title)"
  }
  
  private var theme: ToasterTheme {
    ToasterTheme(type, colorScheme: colorScheme)
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      mainContent
        .frame(minHeight: 44)
    }
    .background(theme.background)
    .overlay(colorBar, alignment: .leading)
    .cornerRadius(8)
    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 2, y: 1)
    .padding(.horizontal, 16)
  }
}

// MARK: - supplemental views
private extension ToasterView {
  
  var colorBar: some View {
    Rectangle()
      .fill(theme.accent)
      .frame(width: 8)
  }
  
  var icon: some View {
    Image(systemName: type.iconSystemName)
      .foregroundColor(theme.accent)
      .accessibilityHidden(true)
  }
  
  var contentText: some View {
    VStack(alignment: .leading) {
      titleText
      if message != nil {
        messageText
      }
    }
  }
  
  var titleText: some View {
    Text(title)
      .font(.callout)
      .fontWeight(.medium)
      .foregroundColor(theme.textColor)
      .accessibilityLabel(accessibilityTitle)
  }
  
  var messageText: some View {
    Text(message ?? "")
      .font(.caption)
      .foregroundColor(theme.subtextColor)
  }
  
  var mainContent: some View {
    HStack(alignment: .top) {
      icon
      contentText
        .accessibilitySortPriority(1)
      Spacer(minLength: 10)
      closeButton
        .accessibilitySortPriority(0)
    }
    .padding([.vertical, .trailing], 8)
    .padding(.leading, 16)
    .accessibilityElement(children: .contain)
  }
  
  var closeButton: some View {
    Button {
      onCancel()
    } label: {
      Image(systemName: "xmark")
        .font(.system(size: 12))
        .foregroundColor(theme.textColor)
    }
    .accessibilityLabel("close")
  }
  
}

struct ToasterView_Previews: PreviewProvider {
  
  static var previews: some View {
    VStack(spacing: 16) {
      
      ToasterView(
        type: .info,
        title: "Info Toast without message"
      ) {}
      
      ToasterView(
        type: .info,
        title: "Imortant Info",
        message: "Toaster provides information with accessibility in mind"
      ) {}
      
      ToasterView(
        type: .success,
        title: "Success Toast!",
        message: "Toaster provides information with accessibility in mind"
      ) {}
      
      ToasterView(
        type: .warning,
        title: "Oh no! Warning",
        message: "Toaster provides information with accessibility in mind"
      ) {}
      
      ToasterView(
        type: .error,
        title: "Wait! This is not good 🫣",
        message: "Toaster provides information with accessibility in mind"
      ) {}
    }
  }
  
}
