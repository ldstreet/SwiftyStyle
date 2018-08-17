#
#  Be sure to run `pod spec lint SwiftyStyle.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name          = "SwiftyStyle"
  s.version       = "0.0.1"
  s.summary       = "Easy, dynamic, and consistent styling"

  s.description   = "An open source library focused on making styling UI controls and views easy, dynamic, and consistent."

  s.homepage      = "https://github.com/ldstreet/SwiftyStyle"


  s.author        = { "ldstreet" => "ldstreet@me.com" }


  s.platform      = :ios, "10.3"
  
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
 

  s.source        = { :git => "https://github.com/ldstreet/SwiftyStyle", :tag => "#{s.version}" }

  s.source_files  = "SwiftyStyle/**/*.swift"
  s.exclude_files = "Classes/Exclude"

end
