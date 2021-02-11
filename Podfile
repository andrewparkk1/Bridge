# Uncomment the next line to define a global platform for your project
platform :ios, '14.3'

target 'Gatton' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Gatton

 pod 'FirebaseCore'
 pod 'Firebase/Firestore'
 pod 'Firebase/Analytics'
 pod 'FirebaseFirestoreSwift'
 pod 'FirebaseFirestore'
# pod 'FirebaseUI'
 pod 'Firebase/Auth'
# pod 'Firebase/DynamicLinks'
# pod 'Firebase/Functions'

# pod 'Resolver'
# pod 'Disk'
 
post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.3'
      end
    end
end



end



