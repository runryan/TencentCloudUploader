#
# Be sure to run `pod lib lint TencentCloudUploader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TencentCloudVideoUploader'
  s.version          = '0.0.2'
  s.summary          = '腾讯云点播文件上传SDK'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
腾讯云点播文件上传SDK封装，可替换官网手动配置SDK。
                       DESC

  s.homepage         = 'https://github.com/runryan/TencentCloudUploader'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ryan' => 'mob_developer@163.com' }
  s.source           = { :git => 'https://github.com/runryan/TencentCloudUploader.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '8.0'
  s.source_files = 'TencentCloudVideoUploader/Classes/**/*'
  # s.resource_bundles = {
  #   'TencentCloudUploader' => ['TencentCloudUploader/Assets/*.png']
  # }
  # s.public_header_files = 'TencentCloudVideoUploader/Classes/**/*.h'
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
  s.vendored_frameworks = 'TencentCloudVideoUploader/libs/QCloudCore.framework', 'TencentCloudVideoUploader/libs/QCloudCOSXML.framework'
  s.vendored_libraries = 'TencentCloudVideoUploader/libs/libmtasdk.a'
  s.frameworks = 'CoreTelephony', 'Foundation', 'SystemConfiguration'
  s.libraries = 'c++'
  s.dependency 'AFNetworking'
  s.module_map = 'TencentCloudVideoUploader/TencentCloudVideoUploader.modulemap'
  s.dependency 'SuperPlayer'
  
end
