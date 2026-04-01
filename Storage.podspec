Pod::Spec.new do |s|
  s.name             = 'Storage'
  s.version          = '1.0.0'
  s.summary          = '基于 UserDefaults 的 Swift 本地存储封装'

  s.description      = <<-DESC
    Storage 是一个轻量级的 Swift 本地存储库，基于 UserDefaults 封装，
    提供类型安全的存储、读取、删除功能，支持模块化扩展。
    
    特性：
    - 支持任意 Encodable/Decodable 对象的存储
    - 简洁的 API 设计（store/fetch/remove/clear）
    - 模块化的扩展机制
    - 完整的类型安全保证
  DESC

  s.homepage         = 'https://github.com/zhuimengFIRE/Storage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhuimengFIRE' => '1670122794@qq.com' }
  s.source           = { :git => 'https://github.com/zhuimengFIRE/Storage.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

  s.source_files = 'Storage/Classes/**/*.swift'
  
  s.frameworks = 'Foundation'
end
