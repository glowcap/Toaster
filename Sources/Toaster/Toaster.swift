//
//  Toaster.swift
//  Toaster
//
//  Created by Daymein Gregorio on 1/8/23.
//

import Foundation

public struct Toaster: Equatable {
  var type: ToastType
  var title: String
  var message: String?
  
  /// duration in seconds
  var duration: Double
  
  /// Toast type, contents, and duration.
  /// - Parameters:
  ///   - type: Type of toast to be displayed
  ///   - title: Title text to appear in bolded type
  ///   - message: Optional message text
  ///   - duration: Display duration in seconds. Default is 6 seconds
  /// - Discussion: The default time of 6 seconds is in accordance with
  ///            **WCAG2.1 ** recommendations. An addtional second
  ///            should be added for every 120 characters.
  public init(_ type: ToastType, title: String, message: String? = nil, duration: Double = 6) {
    self.type = type
    self.title = title
    self.message = message
    self.duration = duration
  }
}

