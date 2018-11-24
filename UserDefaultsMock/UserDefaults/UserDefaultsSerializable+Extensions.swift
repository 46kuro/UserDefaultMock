//
//  UserDefaultsSerializable+Extensions.swift
//  UserDefaultsMock
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//
// https://github.com/radex/SwiftyUserDefaults

import Foundation

extension String: UserDefaultsSerializable, UserDefaultsDefaultValue {
    
    public static var defaultValue: String = ""
    
    public static func get(key: String, userDefaults: UserDefaults) -> String? {
        return userDefaults.string(forKey: key)
    }
    
    public static func save(key: String, value: String?, userDefaults: UserDefaults) {
        userDefaults.set(value, forKey: key)
    }
}

extension Int: UserDefaultsSerializable, UserDefaultsDefaultValue {
    
    public static var defaultValue: Int = 0
    
    public static func get(key: String, userDefaults: UserDefaults) -> Int? {
        guard let number = userDefaults.number(forKey: key) else { return nil }
        return number.intValue
    }
    
    public static func save(key: String, value: Int?, userDefaults: UserDefaults) {
        userDefaults.set(value, forKey: key)
    }
}

extension Double: UserDefaultsSerializable, UserDefaultsDefaultValue {
    
    public static var defaultValue: Double = 0.0
    
    public static func get(key: String, userDefaults: UserDefaults) -> Double? {
        return userDefaults.number(forKey: key)?.doubleValue
    }
    
    public static func save(key: String, value: Double?, userDefaults: UserDefaults) {
        userDefaults.set(value, forKey: key)
    }
}

extension Bool: UserDefaultsSerializable, UserDefaultsDefaultValue {
    
    public static var defaultValue: Bool = false
    
    public static func get(key: String, userDefaults: UserDefaults) -> Bool? {
        // @warning we use number(forKey:) instead of bool(forKey:), because
        // bool(forKey:) will always return value, even if it's not set
        // and it does a little bit of magic under the hood as well
        // e.g. transforming strings like "YES" or "true" to true
        return userDefaults.number(forKey: key)?.boolValue
    }
    
    public static func save(key: String, value: Bool?, userDefaults: UserDefaults) {
        userDefaults.set(value, forKey: key)
    }
}

extension Data: UserDefaultsSerializable, UserDefaultsDefaultValue {
    
    public static var defaultValue: Data = Data()
    
    public static func get(key: String, userDefaults: UserDefaults) -> Data? {
        return userDefaults.data(forKey: key)
    }
    
    public static func save(key: String, value: Data?, userDefaults: UserDefaults) {
        userDefaults.set(value, forKey: key)
    }
}

extension Date: UserDefaultsSerializable {
    
    public static func get(key: String, userDefaults: UserDefaults) -> Date? {
        return userDefaults.object(forKey: key) as? Date
    }
    
    public static func save(key: String, value: Date?, userDefaults: UserDefaults) {
        userDefaults.set(value, forKey: key)
    }
}

extension URL: UserDefaultsSerializable {
    
    public static func get(key: String, userDefaults: UserDefaults) -> URL? {
        return userDefaults.url(forKey: key)
    }
    
    public static func save(key: String, value: URL?, userDefaults: UserDefaults) {
        userDefaults.set(value, forKey: key)
    }
}

extension Optional: UserDefaultsSerializable where Wrapped: UserDefaultsSerializable {
    
    public static func get(key: String, userDefaults: UserDefaults) -> Wrapped?? {
        return Wrapped.get(key: key, userDefaults: userDefaults)
    }
    
    public static func save(key: String, value: Wrapped??, userDefaults: UserDefaults) {
        if let _value = value, let value = _value {
            Wrapped.save(key: key, value: value, userDefaults: userDefaults)
        } else {
            Wrapped.save(key: key, value: nil, userDefaults: userDefaults)
        }
    }
}

private protocol OptionalType {
    associatedtype Wrapped
    var wrapped: Wrapped? { get }
}

extension Optional: OptionalType {
    public var wrapped: Wrapped? {
        return self
    }
}

private extension UserDefaults {
    func number(forKey key: String) -> NSNumber? {
        return object(forKey: key) as? NSNumber
    }
}
