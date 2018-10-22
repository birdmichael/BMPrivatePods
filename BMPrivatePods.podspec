#
# Be sure to run `pod lib lint BMPrivatePods.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BMPrivatePods'
  s.version          = '0.1.6.15.3'
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

  s.public_header_files = 'BMPrivatePods/BMPrivatePods/BMPrivatePodsHeader.h'
  s.source_files = 'BMPrivatePods/BMPrivatePods/**/*'

  s.subspec 'UIColor' do |uicolor|
      uicolor.source_files = 'BMPrivatePods/BMPrivatePods/UIColor/**/*'
      # uicolor.dependency
  end
  s.subspec 'BMMacro' do |s|
      s.source_files = 'BMPrivatePods/BMPrivatePods/BMMacro/**/*'
      # uicolor.dependency
  end
  s.subspec 'BMSafeNil' do |s|
      s.source_files = 'BMPrivatePods/BMPrivatePods/BMSafeNil/**/*'
      # uicolor.dependency
  end
  s.subspec 'UIKit' do |uiscreen|
      uiscreen.dependency 'BMPrivatePods/UIColor'
      uiscreen.source_files = 'BMPrivatePods/BMPrivatePods/UIKit/**/*'
  end
   
   s.subspec 'BMCFunctions' do |s|
       s.source_files = 'BMPrivatePods/BMPrivatePods/BMCFunctions/**/*'
   end
   s.subspec 'BMSwizzleMethod' do |ls|
       ls.dependency 'BMPrivatePods/BMSafeNil'
       ls.source_files = 'BMPrivatePods/BMPrivatePods/BMSwizzleMethod/**/*'
   end
   
   
  # s.resource_bundles = {
  #   'BMPrivatePods' => ['BMPrivatePods/Assets/*.png']
  # }

#   s.public_header_files = 'Pod/BMPrivatePods/**/*.h'
  s.frameworks = 'UIKit','Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
