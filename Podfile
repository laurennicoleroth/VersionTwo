platform :ios, '10.0'

target 'VersionTwo' do
  use_frameworks!

  pod 'Alamofire',
    :git => 'https://github.com/Alamofire/Alamofire.git',
    :branch => 'swift3'
  
  pod 'SwiftyJSON', 
    :git => 'https://github.com/acegreen/SwiftyJSON',
    :branch => 'swift3'

  pod 'Locksmith',
      :git => 'https://github.com/pascalfribi/Locksmith.git',
      :branch => 'swift-3.0'

  pod 'SwiftLocation', '~> 1.1'
  pod 'RxDataSources', '~> 1.0.0-beta.2'
  pod 'RxSwift', '~> 3.0.0-beta.1'
  pod 'RxCocoa', '~> 3.0.0-beta.1'

  target 'VersionTwoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'VersionTwoUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
  end
