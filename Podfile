# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'Mvppoc' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'Alamofire', '~> 4.4'
  pod 'RxSwift',    '~> 3.0'
  pod 'RxCocoa',    '~> 3.0'
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
  pod 'Moya-ModelMapper/RxSwift', '~> 4.1.0'
  pod 'RxOptional'

  # Pods for Mvppoc

  target 'MvppocTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MvppocUITests' do
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
