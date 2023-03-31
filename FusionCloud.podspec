Pod::Spec.new do |spec|
  spec.name               = "FusionCloud"
  spec.version            = "2.0.2"
  spec.platform = :ios, '12.0'
  spec.ios.deployment_target = '12.0'
  spec.summary            = "fusioncloud-framework-ios"
  spec.description        = "Connect and communicate with the DataMesh Unify payments platform"
  spec.homepage           = "https://github.com/datameshgroup/fusioncloud-sdk-ios/tree/add_xcframework"
  spec.documentation_url  = "https://github.com/datameshgroup/fusioncloud-sdk-ios/blob/add_xcframework/README.md"
  spec.swift_versions     = '5.7.2'
  spec.license            = "MIT"
  spec.author             = { "Vanessa Agustin" => "vanessa@datameshgroup.com" }
  # spec.source       = { :http => 'file:' + __dir__ + '/' }
  spec.source             = {  :http => 'https://github.com/datameshgroup/fusioncloud-sdk-ios/archive/refs/tags/2.0.2.zip' }
  spec.source_files       = "FusionCloud.xcframework/**/FusionCloud.framework/Headers/*.{h,m,swift}"
  # spec.source_files = "**/*.{h,m,swift}"
  spec.dependency 'Alamofire' , '~> 5.3.0' 
  spec.dependency 'ObjectMapper', '~> 4'
  spec.dependency 'IDZSwiftCommonCrypto', '~> 0.13'
  spec.dependency 'Starscream', '~> 4.0.0'
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end