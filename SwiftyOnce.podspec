#
#  Be sure to run `pod spec lint SwiftyOnce.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "SwiftyOnce"
  s.version      = "1.0.0"
  s.summary      = "Dispatch once for Swift 3"

  s.description  = <<-DESC
                    Unit test friendly dispatch once extension for Swift 3
                   DESC

  s.homepage     = "https://github.com/ktustanowski/SwiftyOnce"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  s.license      = "MIT"
  s.author    = "ktustanowski"
  s.social_media_url   = "http://twitter.com/tustanowskik"

  # s.platform     = :ios
  # s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ktustanowski/SwiftyOnce.git", :tag => "1.0.0" }
  s.source_files  = 'Sources/*.swift'

end
