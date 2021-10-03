Pod::Spec.new do |spec|
  spec.name             = "SwiftPreview"
  spec.version          = "1.0.0"
  spec.summary          = "Preview template for UIkit based project"
  spec.homepage         = "https://github.com/heoblitz/SwiftPreview"
  spec.license          = "MIT"
  spec.author           = { "heoblitz" => "qndlf22@naver.com" }
  spec.source           = { :git => "https://github.com/heoblitz/SwiftPreview.git", :tag => spec.version.to_s }
  spec.source_files     = "Sources/SwiftPreview/*.swift"
  spec.requires_arc     = true
  spec.swift_version = "5.0"
  spec.ios.deployment_target = "13.0"
end