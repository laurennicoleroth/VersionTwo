platform :ios, '10.0'

target 'VersionTwo' do
  use_frameworks!

  pod 'Alamofire',
    :git => 'https://github.com/Alamofire/Alamofire.git',
    :branch => 'swift3'
 
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
