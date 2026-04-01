Pod::Spec.new do |s|
  s.name         = "FFStorage"
  s.version      = "1.0.0"                    # 版本号
  s.summary      = "A simple storage library"  # 简短描述
  s.description  = "This is a storage library for iOS apps."  # 详细描述，必须比 summary 长
  s.homepage     = "https://github.com/zhuimengFIRE/Storage"  # 项目主页
  s.license      = { :type => "MIT", :file => "LICENSE" }    # 许可证类型
  s.author       = { "YourName" => "your@email.com" }         # 作者
  s.source       = { 
    :git => "https://github.com/zhuimengFIRE/Storage.git", 
    :tag => "#{s.version}" 
  }
  s.platform     = :ios, "13.0"
  s.swift_version = "5.0"
  s.source_files = 'FFStorage/Classes/**/*'       # 源码路径
end
