Pod::Spec.new do |spec|
  spec.name               = "FusionCloud"
  spec.version            = "2.0"
  spec.platform = :ios, '12.0'
  spec.ios.deployment_target = '12.0'
  spec.summary            = "fusionCloud-framework-ios"
  spec.description        = "Connect and communicate with the DataMesh Unify payments platform"
  spec.homepage           = "https://datameshgroup.github.io/fusion/docs/api-reference/fusion-cloud"
  spec.documentation_url  = "https://github.com/datameshgroup/fusioncloud-sdk-ios/blob/add_xcframework/README.md"
  spec.swift_versions = '5.7.2'
  spec.license          = 'BSD'
  spec.author             = { "Vanessa Agustin" => "vanessa@datameshgroup.com" }
  spec.source            = {  :git => 'https://github.com/datameshgroup/fusioncloud-sdk-ios.git', :tag => '2.0'  }
  spec.dependency 'Alamofire' , '~> 5.3.0' 
  spec.dependency 'ObjectMapper', '~> 4'
  spec.dependency 'IDZSwiftCommonCrypto', '~> 0.13'
  spec.dependency 'Starscream', '~> 4.0.0'
end