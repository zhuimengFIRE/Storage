//
//  Storage+User.swift
//  Storage
//
//  用户模块本地存储
//  新增其他模块时，参照此文件新建对应扩展文件
//

import Foundation

extension Storage {
    
    // MARK: - 用户模块
    
    /**
     * 用户相关本地存储
     *
     * 使用示例：
     * ```swift
     * Storage.User.token = "abc123"
     * let token = Storage.User.token
     *
     * Storage.User.info = userModel
     * let user = Storage.User.info
     *
     * Storage.User.clear()
     * ```
     */
    public enum User {
        
        // MARK: Key 定义（集中管理，防止拼写错误）
        
        private enum Key {
            static let token    = "user_token"
            static let userId   = "user_id"
            static let username = "user_name"
            static let isLogin  = "user_is_login"
            static let info     = "user_info"
        }
        
        // MARK: - 登录 Token
        
        /// 登录 Token
        public static var token: String {
            get { fetch(forKey: Key.token, defaultValue: "") }
            set { store(newValue, forKey: Key.token) }
        }
        
        // MARK: - 用户基础信息
        
        /// 用户 ID
        public static var userId: String {
            get { fetch(forKey: Key.userId, defaultValue: "") }
            set { store(newValue, forKey: Key.userId) }
        }
        
        /// 用户名
        public static var username: String {
            get { fetch(forKey: Key.username, defaultValue: "") }
            set { store(newValue, forKey: Key.username) }
        }
        
        /// 是否已登录
        public static var isLogin: Bool {
            get { fetch(forKey: Key.isLogin, defaultValue: false) }
            set { store(newValue, forKey: Key.isLogin) }
        }
        
        // MARK: - 用户对象（Codable Model）
        
        /// 当前登录用户信息（存储 Codable 对象）
        // public static var info: UserModel {
        //     get { fetch(forKey: Key.info, defaultValue: UserModel()) }
        //     set { store(newValue, forKey: Key.info) }
        // }
        
        // MARK: - 清除用户数据
        
        /**
         * 退出登录时调用，清除所有用户相关数据
         */
        public static func clear() {
            remove(forKey: Key.token)
            remove(forKey: Key.userId)
            remove(forKey: Key.username)
            remove(forKey: Key.isLogin)
            remove(forKey: Key.info)
        }
    }
}
