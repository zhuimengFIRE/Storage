//
//  Storage+Game2048.swift
//  Storage
//
//  2048 游戏存储扩展
//

import Foundation

// MARK: - Storage.Game2048

extension Storage {
    
    /// 2048 游戏相关存储
    public enum Game2048 {
        
        private enum Key {
            static let bestScore = "game2048_best_score"
        }
        
        /// 最高分
        public static var bestScore: Int {
            get { fetch(forKey: Key.bestScore, defaultValue: 0) }
            set { store(newValue, forKey: Key.bestScore) }
        }
        
        /// 清除数据
        public static func clear() {
            remove(forKey: Key.bestScore)
        }
    }
}
