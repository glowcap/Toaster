![Toaster with information mark making toast with the same mark](https://user-images.githubusercontent.com/10408147/212476665-d6fcfd76-1555-4a0c-8ed9-a1cc1e6e4059.png)
# Toaster

![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat) ![latest tag version](https://img.shields.io/github/v/tag/glowcap/Toaster) ![MIT license](https://img.shields.io/github/license/glowcap/Toaster)  

Toaster is a SwiftUI toast library for iOS, macOS, and tvOS that allows you to quickly add customizable **WCAG 2.1 compliant** toast functionality to your SwiftUI with minimal code.

## Installing Toaster

Toaster supports [Swift Package Manager](https://www.swift.org/package-manager/) and [CocoaPods](https://cocoapods.org/).

### Swift Package Manager

To install Toaster using  [Swift Package Manager](https://github.com/apple/swift-package-manager)  you can follow the  [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)  using the URL for the Toaster repo with the current version:

1.  In Xcode, select “File” → “Add Packages...”
2.  Enter  [https://github.com/glowcap/toaster.git](https://github.com/glowcap/toaster.git)

or you can add the following dependency to your  `Package.swift`:

```swift
.package(url: "https://github.com/glowcap/toaster.git", from: "0.0.3")
```

### CocoaPods

Add the pod to your Podfile:

```ruby
pod 'Toaster'
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
  @State  _private_  _var_  toast: Toaster? = _nil
  
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

** Duration **
In accordance with WCAG 2.1 guidelines, Toaster's toasts default to a display duration of 6 seconds. This can be changed by setting the `duration` parameter in the initializer.

```swift
Toaster(_: ToastType, title: String, message: String, duration: Double)
```
<br>

> ☝️ It's recommended to allow the user to adjust duration. The user selection can then be stored in `UserDefaults` and used throughout the app.

## Customizing

Toaster allows you the ability to customize the colors used for your toasts by adding `ToasterConfig.plist` file to your project. 

|Key                |Type      |Value             |
|-------------------|--------|--------------------|
|background         |String  |<Color_Hex_Value>   |
|background_dark    |String  |<Color_Hex_Value>   |
|error_color        |String  |<Color_Hex_Value>   |
|info_color         |String  |<Color_Hex_Value>   |
|subtext_color      |String  |<Color_Hex_Value>   |
|subtext_color_dark |String  |<Color_Hex_Value>   |
|success_color.     |String  |<Color_Hex_Value>   |
|text_color         |String  |<Color_Hex_Value>   |
|text_color_dark    |String  |<Color_Hex_Value>   |
|warning_color      |String  |<Color_Hex_Value>   |

> **Note:** Toaster will use the its default color scheme if the `ToasterConfig.plist` file is not included in the project.

## WCAG 2.1 Compliance

Toaster strives to meet WCAG 2.1 AA compliance out of the box in these categories:

**Guideline 1: Color**

Toaster's default color scheme meets the standard color ratio requirements for  [text](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html) (4.5:1)
<br>
**Guideline 2: Consistent Identification and Location**

In accordance with  WCAG guideline  [3.2.4](https://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior-consistent-functionality.html), toaster presents toasts add a prefix of the toast type for screen readers. 

| ToastType  | Screen Reader Prefix |
|------------|----------------------|
| error      | error                |
| info       | information          |
| success    | success              |
| warning    | warning              |

<br>

**Guideline 3: Alt text for non-decorative images**

The close button has the alt-text of `close` 
<br>

**Guideline 4: Focus Order**

Toast focus order is:

 1. Title
 2. Message
 3. Close Button

> ☝️ Since the Toast Icon is decorative and the title is prefixed with the Toast Type, the icon is hidden from screen readers.

<br>

**Guideline 5: Orientation**

WCAG 2.1  [Guideline 1.3.4](https://www.w3.org/TR/WCAG21/#orientation)  requiring support for both portrait and landscape mode for native apps. Toaster's toasts will adjust when a device changes orientation and resets the duration time.

<br>

**Guideline 6: Spacing for Toast message content**

Satisfying  [Guideline 1.4.12](https://www.w3.org/TR/WCAG21/#text-spacing)  requires that the toast message content itself cannot experience loss of content or functionality by setting all of the following and by changing no other style property:

 - Line height (line spacing) to at least 1.5 times the font size
 - Spacing following paragraphs to at least 2 times the font size
 - Letter spacing (tracking) to at least 0.12 times the font size
 - Word spacing to at least 0.16 times the font size

Toaster meets these with use of SwiftUI's built-in font types.

<br>

**Guideline 7 and 8: Magnification and Reflow**

WCAG 2.1 [Guideline 1.4.10](https://www.w3.org/TR/WCAG21/#reflow)  requires that the toast message content must be presented without loss of information or functionality, and without requiring scrolling in two dimensions for:

This is also handled almost natively by SwiftUI's font types. However, The length of the toast message is ultimately in your hands, so be aware of the amount of information presented to maintain compliance. 

<br> 

**Guideline 9:**  **Announcing toast message content without focus**

New to WCAG 2.1, satisfying  [Guideline 4.1.3](https://www.w3.org/TR/WCAG21/#status-messages)  requires that:

In content implemented using markup languages, status messages can be programmatically determined through role or properties such that they can be presented to the user by assistive technologies without receiving focus.

Using ARIA techniques such as role alert and aria-live, toast messages can be made available for screen reading technologies as soon as they are displayed.


## Data Collection

Toaster does not collect any data. This notice is provided to help you fill out  [App Privacy Details](https://developer.apple.com/app-store/app-privacy-details/).

## Contributing

Contributions are always appreciated! To make changes to the project, you can fork the repo and open `ToastDemo.xcworkspace`. This workspace includes:

 - the Toaster package (for iOS, macOS, and tvOS)
