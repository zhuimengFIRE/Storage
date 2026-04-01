//
//  Storage.swift
//  Storage
//
//  本地存储工具类
//  基于 UserDefaults 封装，统一管理所有本地持久化数据
//

import Foundation

// MARK: - Storage

/**
 * 本地存储工具类
 *
 * 使用示例：
 * ```swift
 * // 存储
 * Storage.store("张三", forKey: "username")
 * Storage.store(true, forKey: "isLogin")
 *
 * // 读取
 * let name: String = Storage.fetch(forKey: "username", defaultValue: "")
 * let isLogin: Bool = Storage.fetch(forKey: "isLogin", defaultValue: false)
 *
 * // 使用模块化扩展（推荐）
 * Storage.User.token = "xxx"
 * let token = Storage.User.token
 * ```
 */
public enum Storage {
    
    // MARK: - 存数据
    
    /**
     * 存储任意 Encodable 数据到 UserDefaults
     * - Parameters:
     *   - value: 要存储的值（需遵循 Encodable）
     *   - forKey: 存储键名
     */
    public static func store(_ value: some Encodable, forKey: String) {
        do {
            let data = try JSONEncoder().encode(value)
            UserDefaults.standard.setValue(data, forKey: forKey)
        } catch {
            print("❌ [Storage] 无法存储 [\(forKey)]: \(error)")
        }
    }
    
    // MARK: - 取数据
    
    /**
     * 从 UserDefaults 读取数据，读取失败返回默认值
     * - Parameters:
     *   - forKey: 存储键名
     *   - defaultValue: 读取失败时的默认值
     * - Returns: 解析后的对象，失败则返回 defaultValue
     */
    public static func fetch<T: Decodable>(forKey: String, defaultValue: T) -> T {
        guard let data = UserDefaults.standard.data(forKey: forKey) else {
            return defaultValue
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("❌ [Storage] 无法读取 [\(forKey)]: \(error)")
            return defaultValue
        }
    }
    
    // MARK: - 删除数据
    
    /**
     * 删除指定键的本地数据
     * - Parameter forKey: 要删除的键名
     */
    public static func remove(forKey: String) {
        UserDefaults.standard.removeObject(forKey: forKey)
    }
    
    /**
     * 清空所有本地数据（慎用）
     */
    public static func clear() {
        UserDefaults.standard.dictionaryRepresentation().keys.forEach {
            UserDefaults.standard.removeObject(forKey: $0)
        }
    }
}
