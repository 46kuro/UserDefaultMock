//
//  UserDefaultsDataStoreProtocol.swift
//  UserDefaultsMock
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import Foundation

protocol UserDefaultsDataStoreProtocol: UserDefaultsDataStoreStoreable & UserDefaultsDataStoreGettable { }

protocol UserDefaultsDataStoreStoreable {
    func save<T: UserDefaultsSerializable>(key: UserDefaultsKey<T?>, value: T?)
    func save<T: UserDefaultsSerializable & UserDefaultsDefaultValue>(key: UserDefaultsKey<T>, value: T)
}

protocol UserDefaultsDataStoreGettable {
    func get<T: UserDefaultsSerializable>(key: UserDefaultsKey<T?>) -> T?
    func get<T: UserDefaultsSerializable & UserDefaultsDefaultValue>(key: UserDefaultsKey<T>) -> T
}
