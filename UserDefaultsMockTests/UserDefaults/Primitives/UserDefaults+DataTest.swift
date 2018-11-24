//
//  UserDefaults+DataTest.swift
//  UserDefaultsMockTests
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import XCTest
@testable import UserDefaultsMock

class UserDefaultsDataTest: XCTestCase {
    let defaults = UserDefaults(suiteName: "Test-UserDefaultsSample")!
    
    override func tearDown() {
        defaults.removeObject(forKey: UserDefaultsKeys.testDataValue.key)
        defaults.removeObject(forKey: UserDefaultsKeys.testOptionalDataValue.key)
    }
    
    func testDataValueSave() {
        defaults[.testOptionalDataValue] = Data(count: 4)
        defaults[.testDataValue] = Data(count: 10)
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testOptionalDataValue.key) as! Data, Data(count: 4))
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testDataValue.key) as! Data, Data(count: 10))
        defaults[.testOptionalDataValue] = nil
        XCTAssertNil(defaults.value(forKey: UserDefaultsKeys.testOptionalDataValue.key))
    }
    
    func testDataValueGet() {
        // デフォルト値
        XCTAssertNil(defaults[.testOptionalDataValue])
        XCTAssertEqual(defaults[.testDataValue], Data())
        // 値が存在する場合
        defaults[.testOptionalDataValue] = Data(count: 3)
        defaults[.testDataValue] = Data(count: 5)
        XCTAssertEqual(defaults[.testOptionalDataValue], Data(count: 3))
        XCTAssertEqual(defaults[.testDataValue], Data(count: 5))
    }
}

private extension UserDefaultsKeys {
    static let testDataValue = UserDefaultsKey<Data>("testDataValue")
    static let testOptionalDataValue = UserDefaultsKey<Data?>("testOptionalDataValue")
}
