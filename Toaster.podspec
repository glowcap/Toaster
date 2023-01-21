#
# Be sure to run `pod lib lint Toaster.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Toaster'
  s.version          = '0.5.0'
  s.summary          = 'Toaster - SwiftUI toast library for iOS, macOS, and tvOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Toaster is a SwiftUI toast library for iOS, macOS, and tvOS that allows you to quickly add customizable WCAG 2.1 compliant toast functionality to your SwiftUI with minimal code.
                       DESC

  s.homepage         = 'https://github.com/glowcap/Toaster'
  # s.screenshots    = 'https://user-images.githubusercontent.com/10408147/212543513-d07445b0-9d45-4451-ab2c-40e1d9fb4965.jpg'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daymein Gregorio' => 'doku005@yahoo.com' }
  s.source           = { :git => 'https://github.com/glowcap/Toaster.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/daymeing'

  s.ios.deployment_target = '15.0'
  s.swift_version = '5.0'

  s.source_files = 'Sources/Toaster/**/*'
  
  # s.resource_bundles = {
  #   'Toaster' => ['Toaster/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
