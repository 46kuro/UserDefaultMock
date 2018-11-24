//
//  DefautsDataStore.swift
//  UserDefaultsMock
//
//  Created by Shinji Kurosawa on 2018/11/23.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import Foundation

protocol UserDefaultsDataShareable: class {
    var suiteName: String { get }
}

public class UserDefaultsDataStore: UserDefaultsDataStoreProtocol {
    
    var defaults: UserDefaults { return UserDefaults(suiteName: shareable.suiteName)! }
    var shareable: UserDefaultsDataShareable!
    
    init(shareable: UserDefaultsDataShareable? = nil) {
        if let shareable = shareable {
            self.shareable = shareable
        } else {
            self.shareable = self
        }
    }
    
    /// データを保存する、データが存在しない場合はnilを保存する
    func save<T: UserDefaultsSerializable>(key: UserDefaultsKey<T?>, value: T?) {
        defaults[key] = value
    }
    
    /// データを保存する、データが存在しない場合はデフォルト値を保存する
    func save<T: UserDefaultsSerializable & UserDefaultsDefaultValue>(key: UserDefaultsKey<T>, value: T) {
        defaults[key] = value
    }
    
    /// データを返却する、データが存在しない場合はnilが返却される
    func get<T: UserDefaultsSerializable>(key: UserDefaultsKey<T?>) -> T? {
        return defaults[key]
    }
    
    /// データを返却する、データが存在しない場合はデフォルト値が返却される
    func get<T: UserDefaultsSerializable & UserDefaultsDefaultValue>(key: UserDefaultsKey<T>) -> T {
        return defaults[key]
    }
}

extension UserDefaultsDataStore: UserDefaultsDataShareable {
    var suiteName: String { return "UserDefaultsSample" }
}
