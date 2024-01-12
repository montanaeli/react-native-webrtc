require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name                = package['name']
  s.version             = package['version']
  s.summary             = package['description']
  s.homepage            = 'https://github.com/react-native-webrtc/react-native-webrtc'
  s.license             = package['license']
  s.author              = 'https://github.com/react-native-webrtc/react-native-webrtc/graphs/contributors'
  s.source              = { :git => 'git@github.com:react-native-webrtc/react-native-webrtc.git', :tag => 'release #{s.version}' }
  s.requires_arc        = true

  s.platforms           = { :ios => '12.0', :osx => '10.13', :tvos => '16.0' }

  s.preserve_paths      = 'ios/**/*'
  s.source_files        = 'ios/**/*.{h,m}'
  s.libraries           = 'c', 'sqlite3', 'stdc++'
  s.framework           = 'AudioToolbox','AVFoundation', 'CoreAudio', 'CoreGraphics', 'CoreVideo', 'GLKit', 'VideoToolbox'
  s.dependency          'React-Core'
  # s.dependency          'JitsiWebRTC', '~> 111.0.0'

  # Note: Update to consume local WebRTC.xcframework
  # maintained as a local pod in path -> https://github.com/millicast/streaming-sdk-react-native-getting-started/tree/main/ios/WebRTC
  # TODO: Consider moving libWebRTC and WebRTC pod into this repo or a separate repo for better reusability
  s.dependency          'WebRTC'
end
