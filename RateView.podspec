Pod::Spec.new do |s|

  s.name         = "Activity"
  s.version      = "1.0"
  s.summary      = "Activity for iOS Objective-C is a subclass of UIView."

s.description  = "Activity is a UIView subclass that creates a customizable loading activity indicator like control.
                 * Mimics Apple loading indicator from App Store & Music"

  s.homepage     = "https://github.com/taruntyagi697/Activity"
  
  s.license      = { :type => "MIT", :file => "LICENSE.md" }

  s.author       = { "Tarun Tyagi" => "taruntyagi697@gmail.com" }

  s.platform     = :ios

  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/taruntyagi697/Activity.git", :tag => "v1.0" }

  s.frameworks   = "QuartzCore"
  
  s.source_files = "Activity"

  s.requires_arc = true

end

