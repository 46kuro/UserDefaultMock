//
//  UserDefaults+Subscriptable.swift
//  UserDefaultsMock
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//
// https://github.com/radex/SwiftyUserDefaults

import Foundation

public extension UserDefaults {
    subscript<T: UserDefaultsSerializable>(key: UserDefaultsKey<T?>) -> T? {
        get {
            return T.get(key: key.key, userDefaults: self)
        }
        set {
            T.save(key: key.key, value: newValue, userDefaults: self)
        }
    }
    
    subscript<T: UserDefaultsSerializable>(key: UserDefaultsKey<T>) -> T where T: UserDefaultsDefaultValue {
        get {
            return T.get(key: key.key, userDefaults: self) ?? T.defaultValue
        }
        set {
            T.save(key: key.key, value: newValue, userDefaults: self)
        }
    }
}
