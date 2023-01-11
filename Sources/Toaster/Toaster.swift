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
  
  public init(_ type: ToastType, title: String, message: String? = nil, duration: Double = 6) {
    self.type = type
    self.title = title
    self.message = message
    self.duration = duration
  }
}

