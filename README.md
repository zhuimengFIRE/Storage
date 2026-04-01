# FFStorage

[![Version](https://img.shields.io/cocoapods/v/FFStorage.svg?style=flat)](https://cocoapods.org/pods/FFStorage)
[![License](https://img.shields.io/cocoapods/l/FFStorage.svg?style=flat)](https://cocoapods.org/pods/FFStorage)
[![Platform](https://img.shields.io/cocoapods/p/FFStorage.svg?style=flat)](https://cocoapods.org/pods/FFStorage)

基于 UserDefaults 的 Swift 本地存储封装，提供类型安全的存储方案。

## 特性

- ✅ 支持任意 `Encodable/Decodable` 对象的存储
- ✅ 简洁的 API 设计（store/fetch/remove/clear）
- ✅ 模块化的扩展机制
- ✅ 完整的类型安全保证
- ✅ 零依赖，仅使用 Foundation 框架

## 安装

### CocoaPods

```ruby
pod 'FFStorage', '~> 1.0.0'
```

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/zhuimengFIRE/Storage.git", from: "1.0.0")
]
```

## 使用方法

### 基础用法

```swift
import FFStorage

// 存储数据
FFStorage.store("张三", forKey: "username")
FFStorage.store(25, forKey: "age")
FFStorage.store(true, forKey: "isLogin")

// 读取数据
let username: String = FFStorage.fetch(forKey: "username", defaultValue: "")
let age: Int = FFStorage.fetch(forKey: "age", defaultValue: 0)
let isLogin: Bool = FFStorage.fetch(forKey: "isLogin", defaultValue: false)

// 删除数据
FFStorage.remove(forKey: "username")

// 清空所有数据（慎用）
FFStorage.clear()
```

### 存储 Codable 对象

```swift
struct User: Codable {
    let id: String
    let name: String
    let email: String
}

// 存储
let user = User(id: "001", name: "张三", email: "zhangsan@example.com")
FFStorage.store(user, forKey: "current_user")

// 读取
let currentUser: User = FFStorage.fetch(forKey: "current_user", defaultValue: User(id: "", name: "", email: ""))
```

### 模块化扩展（推荐）

FFStorage 支持通过扩展创建模块化的存储方案：

```swift
extension FFStorage {
    enum User {
        private enum Key {
            static let token = "user_token"
            static let isLogin = "user_is_login"
        }
        
        static var token: String {
            get { fetch(forKey: Key.token, defaultValue: "") }
            set { store(newValue, forKey: Key.token) }
        }
        
        static var isLogin: Bool {
            get { fetch(forKey: Key.isLogin, defaultValue: false) }
            set { store(newValue, forKey: Key.isLogin) }
        }
        
        static func clear() {
            remove(forKey: Key.token)
            remove(forKey: Key.isLogin)
        }
    }
}

// 使用
FFStorage.User.token = "abc123"
FFStorage.User.isLogin = true

// 退出登录
FFStorage.User.clear()
```

## 内置模块

FFStorage 提供了以下内置模块：

### User 模块

用户相关的存储封装：

```swift
FFStorage.User.token      // 登录 Token
FFStorage.User.userId     // 用户 ID
FFStorage.User.username   // 用户名
FFStorage.User.isLogin    // 登录状态
FFStorage.User.clear()    // 清除用户数据
```

## 注意事项

- 所有存储的数据都会序列化为 JSON，因此存储的对象必须遵循 `Codable` 协议
- 使用自定义模块时，建议使用 `private enum Key` 集中管理键名，避免拼写错误
- `clear()` 方法会清空 UserDefaults 中的所有数据，请谨慎使用

## 要求

- iOS 13.0+
- Swift 5.0+

## 作者

zhuimengFIRE, 1670122794@qq.com

## 许可证

FFStorage 使用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。
