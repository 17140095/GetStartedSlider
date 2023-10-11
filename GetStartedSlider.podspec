#
# Be sure to run `pod lib lint GetStartedSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GetStartedSlider'
  s.version          = '0.1.0'
  s.summary          = 'Simple SwiftUI View slider'
  s.swift_versions   = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple view slider for SwiftUI. You just provide the array of views to slide. The view can be slide by swipe or automatically with auto animation.
                       DESC

  s.homepage         = 'https://github.com/17140095/GetStartedSlider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ali Raza' => 'aliraza.brame@gmail.com' }
  s.source           = { :git => 'https://github.com/17140095/GetStartedSlider.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '14.0'

  s.source_files = 'GetStartedSlider/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GetStartedSlider' => ['GetStartedSlider/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
