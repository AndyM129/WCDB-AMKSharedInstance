#
# Be sure to run `pod lib lint WCDB-AMKSharedInstance.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'WCDB-AMKSharedInstance'
    s.version          = '0.1.0'
    s.summary          = 'Summary of WCDB-AMKSharedInstance.'
    s.description      = <<-DESC
                         A description of WCDB-AMKSharedInstance.
                         DESC
    s.homepage         = 'https://github.com/AndyM129/WCDB-AMKSharedInstance'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Andy Meng' => 'andy_m129@163.com' }
    s.source           = { :git => 'https://github.com/AndyM129/WCDB-AMKSharedInstance.git', :tag => s.version.to_s }
    s.social_media_url = 'http://www.jianshu.com/u/28d89b68984b'
    s.ios.deployment_target = '8.0'
    s.source_files = 'WCDB-AMKSharedInstance/Classes/**/*.{h,m,mm}'
    s.public_header_files = 'WCDB-AMKSharedInstance/Classes/**/*.h'
    s.frameworks = 'UIKit'
    s.dependency 'WCDB'
end
