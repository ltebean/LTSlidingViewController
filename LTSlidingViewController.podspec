
Pod::Spec.new do |s|
  s.name         = "LTSlidingViewController"
  s.version      = "1.0.0"
  s.summary      = "sliding view controller allowing custom transition"
  s.homepage     = "https://github.com/ltebean/LTSlidingViewController"
  s.license      = "MIT"
  s.author       = { "ltebean" => "yucong1118@gmail.com" }
  s.source       = { :git => "https://github.com/ltebean/LTSlidingViewController.git", :tag => 'v1.0.0'}
  s.source_files = "LTSlidingViewController/LTSlidingViewController.{h,m}"
  s.requires_arc = true
  s.platform     = :ios, '7.0'

end
