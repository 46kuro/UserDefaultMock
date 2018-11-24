//
//  UserDefaults+Serializable.swift
//  UserDefaultsMock
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//
// https://github.com/radex/SwiftyUserDefaults

import Foundation

public typealias UserDefaultsSerializable = UserDefaultsStoreable & UserDefaultsGettable

public protocol UserDefaultsStoreable {
    static func save(key: String, value: Self?, userDefaults: UserDefaults)
}

public protocol UserDefaultsGettable {
    static func get(key: String, userDefaults: UserDefaults) -> Self?
}

public protocol UserDefaultsDefaultValue {
    static var defaultValue: Self { get }
}
