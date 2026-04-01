Pod::Spec.new do |s|
  s.name         = "FFStorage"
  s.version      = "1.0.0"
  s.summary      = "基于 UserDefaults 的 Swift 本地存储封装库"
  s.description  = <<-DESC
    FFStorage 是一个轻量级的 Swift 本地存储库，基于 UserDefaults 封装。
    提供类型安全的存储、读取、删除功能，支持模块化扩展。
    支持任意 Codable 对象的存储，API 简洁易用。
  DESC
  s.homepage     = "https://github.com/zhuimengFIRE/Storage"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "zhuimengFIRE" => "1670122794@qq.com" }
  s.source       = { 
    :git => "https://github.com/zhuimengFIRE/Storage.git", 
    :tag => "#{s.version}" 
  }
  
  s.ios.deployment_target = "13.0"
  s.swift_version = "5.0"
  s.source_files = "FFStorage/Classes/**/*"
  
  # 其他可选配置
  # s.frameworks = "Foundation"
  # s.requires_arc = true
end
