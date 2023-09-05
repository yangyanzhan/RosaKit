#
#  Be sure to run `pod spec lint SegueWithCompletion.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "RosaKit"
  s.version      = "0.0.11"
  s.summary      = "RosaKit it's lightweight port to iOS libRosa"
  s.description  = "RosaKit it's lightweight port to iOS libRosa which written on Python, it's used for sound analyse"

  s.homepage     = "https://github.com/dhrebeniuk/RosaKit"

  s.license      = "LICENSE"
  s.author             = { "Dmytro Hrebeniuk" => "dmytrohrebeniuk@gmail.com" }

  s.ios.deployment_target = "15.0"
  s.osx.deployment_target = "11.0"
  s.tvos.deployment_target = "11.0"

  s.source       = { :git => "https://github.com/dhrebeniuk/RosaKit.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.{swift,h}"

  s.dependency 'PlainPocketFFT', '~> 0.0.9'
  s.dependency 'PocketFFT', '~> 0.0.1'
  
  s.requires_arc = true
  s.swift_versions = "5"

end
