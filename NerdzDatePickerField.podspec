Pod::Spec.new do |s|
  s.name             = 'NerdzDatePickerField'
  s.version          = '1.0.2'
  s.summary          = 'A CSS-like way of creation and applying styles to view components'
  s.homepage         = 'https://github.com/nerdzlab/NerdzDatePickerField'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NerdzLab' => 'supernerd@nerdzlab.com' }
  s.source           = { :git => 'https://github.com/nerdzlab/NerdzDatePickerField.git', :tag => s.version }
  s.social_media_url = 'https://nerdzlab.com'
  s.ios.deployment_target = '9.0'
  s.swift_versions = ['5.0']
  s.source_files = 'Sources/**/*'
end
