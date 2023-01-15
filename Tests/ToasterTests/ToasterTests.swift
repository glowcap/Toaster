import XCTest
import SwiftUI
@testable import Toaster

final class ToasterTests: XCTestCase {
  
  let testTitle = "Test Title"
  let testMessage = "Test Message"
  
  func test_this_exists() {
    XCTAssert(true, "Where are my tests? 🫠")
  }
  
  func test_toaster_default_duration() {
    let sut = generateToaster(.error)
    let defaultDuration = 6.0
    XCTAssertEqual(
      sut.duration, defaultDuration,
      "Default duration is incorrect"
    )
  }
  
  func test_toaster_custom_duration() {
    let expectedDuration = 10.0
    let sut = generateToaster(.error, duration: expectedDuration)
    XCTAssertEqual(
      sut.duration, expectedDuration,
      "Custom duration is incorrect"
    )
  }
  
  func test_toaster_content() {
    let sut = generateToaster(.error)
    XCTAssertEqual(
      sut.title, testTitle,
      "Title not set"
    )
    XCTAssertEqual(sut.message, testMessage, "Message not set")
  }
  
  func test_toaster_type() {
    let expectedType = ToastType.error
    let sut = generateToaster(expectedType)
    XCTAssertEqual(
      sut.type, expectedType,
      "Type not set"
    )
  }
  
  func test_toasttype_error() {
    let sutError = ToastType.error
    XCTAssertEqual(
      sutError.iconSystemName, "xmark.circle.fill",
      "incorrect error icon"
    )
    XCTAssertEqual(
      sutError.configKey, "error_color",
      "incorrect error config key"
    )
    XCTAssertEqual(
      sutError.defaultColor, Color.red,
      "incorrect error default color"
    )
    XCTAssertEqual(
      sutError.prefix, "error,",
      "incorrect error prefix"
    )
  }
  
  func test_toasttype_info() {
    let sutInfo = ToastType.info
    XCTAssertEqual(
      sutInfo.iconSystemName, "info.circle.fill",
      "incorrect info icon"
    )
    XCTAssertEqual(
      sutInfo.configKey, "info_color",
      "incorrect info config key"
    )
    XCTAssertEqual(
      sutInfo.defaultColor, Color.blue,
      "incorrect info default color"
    )
    XCTAssertEqual(
      sutInfo.prefix, "information,",
      "incorrect info prefix"
    )
  }
  
  func test_toasttype_success() {
    let sutSuccess = ToastType.success
    XCTAssertEqual(sutSuccess.iconSystemName, "checkmark.circle.fill", "incorrect success icon")
    XCTAssertEqual(sutSuccess.configKey, "success_color", "incorrect success config key")
    XCTAssertEqual(sutSuccess.defaultColor, Color.green, "incorrect success default color")
    XCTAssertEqual(sutSuccess.prefix, "success,", "incorrect success prefix")
  }
  
  func test_toasttype_warning() {
    let sutWarning = ToastType.warning
    XCTAssertEqual(
      sutWarning.iconSystemName, "exclamationmark.triangle.fill",
      "incorrect warning icon"
    )
    XCTAssertEqual(
      sutWarning.configKey, "warning_color",
      "incorrect warning config key"
    )
    XCTAssertEqual(
      sutWarning.defaultColor, Color.orange,
      "incorrect warning default color"
    )
    XCTAssertEqual(
      sutWarning.prefix, "warning,",
      "incorrect warning prefix"
    )
  }
  
}

private extension ToasterTests {
  
  private func generateToaster(_ type: ToastType, duration: Double? = nil) -> Toaster {
    if let duration = duration {
      return Toaster(
        type,
        title: testTitle,
        message: testMessage,
        duration: duration
      )
    } else {
      return Toaster(
        type,
        title: testTitle,
        message: testMessage
      )
    }
  }
  
}
