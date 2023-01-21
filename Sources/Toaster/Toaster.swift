//
//  Toaster.swift
//  Toaster
//
//  Created by Daymein Gregorio on 1/8/23.
//

import Foundation

/// Model representing a toast.
///
/// Setting Toaster as a State object is required for
/// the intended functionality
///
/// ```swift
/// @State private var toast: Toaster?
/// ```
///
public struct Toaster: Equatable {
  
  /// The type of toast to be displayed
  private(set) var type: ToastType
  
  /// The title of the toast
  ///
  /// This title will be prefixed by the
  /// toast type for screen readers
  private(set) var title: String
  
  /// The optional message body of the toast
  private(set) var message: String?
  
  /// Duration of the toast  in seconds
  ///
  /// Defaults to 6 seconds
  private(set) var duration: Double
  
  /// Configures the toast with the toast type, content, and optional duration.
  ///
  ///  The type of toast is set with ``ToastType`` . The default time of 6
  ///  seconds is in accordance with **WCAG2.1 AA** recommendations.
  ///  An addtional second should be added for every 120 characters.
  ///
  ///  ```swift
  ///  let toast = Toast(.info, title: "Something happened", message: "Here's more about it")
  ///  ```
  ///
  /// - Parameters:
  ///   - type: Type of toast to be displayed
  ///   - title: Title text to appear in bolded type
  ///   - message: Optional message text
  ///   - duration: Display duration in seconds. Defaults to 6 seconds
  public init(_ type: ToastType, title: String, message: String? = nil, duration: Double = 6) {
    self.type = type
    self.title = title
    self.message = message
    self.duration = duration
  }
}
