
Pod::Spec.new do |spec|

  
  spec.name         = "xbCommonUtils"
  spec.version      = "0.0.5"
  spec.summary      = "xbCommonUtils."
  spec.description  = "常用宏定义，UIView快速创建"
  
  spec.requires_arc = true
  spec.license      = "MIT"
  spec.platform     = :ios, "9.0"
  spec.swift_version = "5.0"

  spec.author             = { "xiaobin.fan" => "xiaobin.fan@ecidh.com" }
  spec.homepage     = "https://github.com/FXiaobin/xbCommonUtils"
  spec.source       = { :git => "https://github.com/FXiaobin/xbCommonUtils.git", :tag => "#{spec.version}" }

  spec.source_files  = "xbCommonUtils", "xbCommonUtils/*.{swift}"


end
