#
# Be sure to run `pod spec lint Helpful-For-iOS.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "HelpfulForiOS"
  s.version      = "0.0.4"
  s.author       = { "Ivanenko Dmitry" => "id.noxt@gmail.com" }
  s.source       = { :git => "https://github.com/noxt/Helpful-For-iOS" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  

  ### Subspecs

  s.subspec "NSDictionary+Merge" do |ms|
    ms.source_files =  "NSDictionary+Merge"
  end
  
  s.subspec "ALCache" do |cs|
    cs.source_files =  "ALCache"
    cs.dependency "FMDB"
  end

  s.subspec "UIImage+Color" do |ms|
    ms.source_files =  "UIImage+Color"
  end

  s.subspec "NSString+URLEncode" do |ms|
    ms.source_files =  "NSString+URLEncode"
  end
  
  s.subspec "NSDictionary+URLParams" do |ms|
    ms.source_files =  "NSDictionary+URLParams"
  end
  
  s.subspec "UILabel+Resize" do |ms|
    ms.source_files =  "UILabel+Resize"
  end
end
