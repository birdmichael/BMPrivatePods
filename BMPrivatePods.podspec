#
# Be sure to run `pod lib lint BMPrivatePods.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BMPrivatePods'
  s.version          = '0.1.0'
  s.summary          = 'BM Private Pods.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
BirdMichal 日常所用到一些私有分类等 -- Private Pods
                       DESC

  s.homepage         = 'https://github.com/birdmichael/BMPrivatePods'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'birdmichael' => '229953445@qq.com' }
  s.source           = { :git => 'https://github.com/birdmichael/BMPrivatePods.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BMPrivatePods/BMPrivatePods/**/*'
  
  # s.resource_bundles = {
  #   'BMPrivatePods' => ['BMPrivatePods/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
