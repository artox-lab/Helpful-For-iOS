#
# Be sure to run `pod spec lint Helpful-For-iOS.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "Helpful-For-iOS"
  s.version      = "0.0.1"
  s.author       = { "Ivanenko Dmitry" => "id.noxt@gmail.com" }
  s.source       = { :git => "https://github.com/noxt/Helpful-For-iOS", :tag => "0.0.1" }
  s.platform     = :ios, '5.0'
  s.source_files = 'NSDictionary+Merge'
  s.requires_arc = true
end
