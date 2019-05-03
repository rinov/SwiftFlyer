Pod::Spec.new do |s|
  s.name             = 'SwiftFlyer'
  s.version          = '0.2.2'
  s.summary          = 'An API wrapper for bitFlyer written in Swift.'

  s.description      = <<-DESC
An API wrapper for bitFlyer that supports all providing API.
                       DESC

  s.homepage          = "https://github.com/rinov/SwiftFlyer"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rinov' => 'rinov@rinov.jp' }
  s.source           = { :git => 'https://github.com/rinov/SwiftFlyer.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.source_files = 'SwiftFlyer/**/*'
  s.dependency 'CryptoSwift', '~> 1.0.0'
  s.dependency 'Starscream', '~> 3.1.0'
end
