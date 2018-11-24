//
//  UserDefaultsKeys.swift
//  UserDefaultsMock
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//
// https://github.com/radex/SwiftyUserDefaults

import Foundation

/// Extend this class and add your user defaults keys as static constants
/// so you can use the shortcut dot notation (e.g. `Defaults[.yourKey]`)
open class UserDefaultsKeys {
    fileprivate init() {}
}

/// Base class for static user defaults keys. Specialize with value type
/// and pass key name to the initializer to create a key.
public class UserDefaultsKey<ValueType: UserDefaultsSerializable>: UserDefaultsKeys {
    public let key: String
    
    public init(_ key: String) {
        self.key = key
    }
}
