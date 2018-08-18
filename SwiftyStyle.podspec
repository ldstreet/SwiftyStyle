Pod::Spec.new do |s|

  s.name         = "SwiftyStyle"
  s.version      = "0.0.1"
  s.summary      = "A pod to make styling dynamic, consistent, and easy."
  s.description  = <<-DESC
                  A pod to make styling dynamic, consistent, and easy. Define your app's commonly used styles in one place and set them on your views and controls easily.
                   DESC

  s.homepage     = "https://github.com/ldstreet/SwiftyStyle"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "ldstreet" => "ldstreet@me.com" }
  s.platform     = :ios, "10.3"
  s.swift_version = "4.0"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }


  s.source       = { :git => "https://github.com/ldstreet/SwiftyStyle.git", :tag => "#{s.version}" }

  s.source_files  = "SwiftyStyle/**/*.swift"

end
