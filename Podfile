# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'FusionCloud' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FusionCloud
  pod 'ObjectMapper', '~> 4'
  pod 'IDZSwiftCommonCrypto', '~> 0.13'
  pod 'Starscream', '~> 4.0.0'
  pod 'Alamofire','~> 5.3.0'  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
