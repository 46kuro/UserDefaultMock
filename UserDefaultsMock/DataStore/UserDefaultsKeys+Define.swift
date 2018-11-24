//
//  UserDefaultsKeys+Define.swift
//  UserDefaultsMock
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import Foundation

extension UserDefaultsKeys {
    static let username = UserDefaultsKey<String>(KeyName.username.rawValue)
    static let launchCount = UserDefaultsKey<Int>(KeyName.launchCount.rawValue)
    
    // 複数のUserDefaultsの変数で同じKeyを使用しないため、Enumで文字列を定義する
    private enum KeyName: String {
        case username
        case launchCount
    }
}
