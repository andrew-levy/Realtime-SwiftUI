# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'Realtime' do
  use_frameworks!

  pod 'Alamofire', '~> 5.0'
  
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'

  target 'RealtimeTests' do
    inherit! :complete
  end

  target 'RealtimeUITests' do
    inherit! :complete
    pod 'Swifter', '~> 1.4.7'
  end

end
