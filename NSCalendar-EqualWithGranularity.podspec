Pod::Spec.new do |s|
  s.name         = "NSCalendar-EqualWithGranularity"
  s.version      = "1.0"
  s.summary      = "An implementation of the NSDate function that Apple added to the iOS 7 beta and then removed from the final release."
  s.homepage     = "https://github.com/ojfoggin/NSCalendar-EqualWithGranularity"
  s.license      = 'Apache License, Version 2.0'
  s.author       = "ojfoggin"
  s.source       = { :git => "https://github.com/ojfoggin/NSCalendar-EqualWithGranularity.git", 
                     :commit => "857cf5151541ab7b021bcbe499cb75ce2a92eac8" }
  s.source_files  = 'NSCalendar+equalWithGranularity.{h,m}'
end
