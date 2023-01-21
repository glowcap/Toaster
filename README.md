
# Toaster

![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat) ![latest tag version](https://img.shields.io/github/v/tag/glowcap/Toaster) ![MIT license](https://img.shields.io/github/license/glowcap/Toaster) 

![Toaster with information mark making toast with the same mark](https://user-images.githubusercontent.com/10408147/212476665-d6fcfd76-1555-4a0c-8ed9-a1cc1e6e4059.png) 

Toaster is a Toast library built for and in SwiftUI for iOS, macOS, and tvOS that allows you to quickly add customizable **WCAG 2.1 compliant** toast functionality to your SwiftUI project with minimal code.

![Types of toasts on light and dark backgrounds](https://user-images.githubusercontent.com/10408147/212543513-d07445b0-9d45-4451-ab2c-40e1d9fb4965.jpg)

## Installing Toaster

Toaster supports [Swift Package Manager](https://www.swift.org/package-manager/) and [CocoaPods](https://cocoapods.org/).

### Swift Package Manager

To install Toaster using  [Swift Package Manager](https://github.com/apple/swift-package-manager)  you can follow the  [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)  using the URL for the Toaster repo with the current version:

1.  In Xcode, select “File” → “Add Packages...”
2.  Enter  [https://github.com/glowcap/toaster.git](https://github.com/glowcap/toaster.git)

or you can add the following dependency to your  `Package.swift`:

```swift
.package(url: "https://github.com/glowcap/toaster.git", from: "0.0.4")
```

### CocoaPods

Add the pod to your Podfile:

```ruby
pod 'Toaster', :git => 'https://github.com/glowcap/Toaster', :tag => 'v0.0.4'
```

And then run:

```ruby 
pod install
```

After installing the cocoapod into your project import Toaster with

```swift
 import Toaster
```
    
## Implementation

Toaster is written in, and designed for, SwiftUI. This makes implementation in your SwiftUI project easier than ever.

```swift
import Toaster

struct YourViewThatDisplaysToasts {
  @State private var toast: Toaster? = nil
  
  var body: some View {
    NavigationStack {
      Button("Action that toasts") {
        // do work
        toast = Toaster(
          .success,
          title: "You did it",
          message: "You implemented a toast!"
        )
      }
    }
    .toast($toast) /// don't forget this!
  }
}
```

**Duration**

In accordance with WCAG 2.1 guidelines, Toaster's toasts default to a display duration of 6 seconds. This can be changed by setting the `duration` parameter in the initializer.

```swift
Toaster(_: ToastType, title: String, message: String, duration: Double)
```
<br>

> ☝️ FYI, it's recommended to allow the user to adjust duration.

## Customizing

Toaster allows you to customize the colors used for your toasts by adding `ToasterConfig.plist` file to your project. 

|Key                |Type      |Value             |
|-------------------|--------|--------------------|
|background         |String  |<Color_Hex_Value>   |
|background_dark    |String  |<Color_Hex_Value>   |
|error_color        |String  |<Color_Hex_Value>   |
|info_color         |String  |<Color_Hex_Value>   |
|subtext_color      |String  |<Color_Hex_Value>   |
|subtext_color_dark |String  |<Color_Hex_Value>   |
|success_color      |String  |<Color_Hex_Value>   |
|text_color         |String  |<Color_Hex_Value>   |
|text_color_dark    |String  |<Color_Hex_Value>   |
|warning_color      |String  |<Color_Hex_Value>   |

> 📝 Toaster will use the its default color scheme if the `ToasterConfig.plist` file is not included in the project.

## WCAG 2.1 Compliance

Toaster strives to meet WCAG 2.1 AA compliance out of the box in these categories:

**Guideline 1: Color**

Toaster's default color scheme meets the standard color ratio requirements [4.5:1](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html) for text.
<br>

**Guideline 2: Consistent Identification and Location**

In accordance with  WCAG guideline  [3.2.4](https://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior-consistent-functionality.html), toast screenreader titles are prefixed with the type toast. 

| ToastType  | Screen Reader Prefix |
|------------|----------------------|
| error      | error,               |
| info       | information,         |
| success    | success,             |
| warning    | warning,             |

<br>

**Guideline 3: Alt text for non-decorative images**

The close button has the alt-text of `close` 
<br>

**Guideline 4: Focus Order**

Toast focus order is:

 1. Title
 2. Message
 3. Close Button

> ☝️ Since the Toast Icon is decorative and the screenreader title is prefixed with the Toast Type, the icon is hidden from screen readers.

<br>

**Guideline 5: Orientation**

WCAG 2.1  [Guideline 1.3.4](https://www.w3.org/TR/WCAG21/#orientation)  requires support for both portrait and landscape mode for native apps. Toaster's toasts adjust automatically when a device changes orientation while restarting the duration time.

<br>

**Guideline 6: Spacing for Toast message content**

Satisfying  [Guideline 1.4.12](https://www.w3.org/TR/WCAG21/#text-spacing)  requires that the toast message content itself cannot experience loss of content or functionality. Toaster meets this requirement with use of SwiftUI's built-in font types.

>❗️Although this is handled out of the box, screen sizes have limits. Try to keep your toast message brief to ensure this guideline is maintained in your app.

<br>

**Guideline 7 and 8: Magnification and Reflow**

WCAG 2.1 [Guideline 1.4.10](https://www.w3.org/TR/WCAG21/#reflow)  requires that the toast message content must be presented without loss of information or functionality, and without requiring scrolling in two dimensions for:

This is also handled almost natively by SwiftUI's font types. However, The length of the toast message is ultimately in your hands, so be aware of the amount of information presented to maintain compliance. 

<br> 

**Guideline 9 (_under development_):**  **Announcing toast message content without focus**

New to WCAG 2.1, satisfying  [Guideline 4.1.3](https://www.w3.org/TR/WCAG21/#status-messages)  requires that:

In content implemented using markup languages, status messages can be programmatically determined through role or properties such that they can be presented to the user by assistive technologies without receiving focus.

👷🏽‍♂️ _This feature is still under development. Currently, Toasts will block the window interaction (besides the toast) while the toast is displayed, and allows the next user focus to be the toast_

## Data Collection

Toaster does not collect any data. This notice is provided to help you fill out  [App Privacy Details](https://developer.apple.com/app-store/app-privacy-details/).

## Contributing

Contributions are always appreciated! To make changes to the project, you can fork the repo and open `ToastDemo.xcworkspace`. This workspace includes:

 - the Toaster package (for iOS, macOS, and tvOS)
