//
//  UserDefaults+IntTest.swift
//  UserDefaultsMockTests
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import XCTest
@testable import UserDefaultsMock

class UserDefaultsIntTest: XCTestCase {
    let defaults = UserDefaults(suiteName: "Test-UserDefaultsSample")!
    
    override func tearDown() {
        defaults.removeObject(forKey: UserDefaultsKeys.testIntValue.key)
        defaults.removeObject(forKey: UserDefaultsKeys.testOptionalIntValue.key)
    }
    
    func testIntValueSave() {
        defaults[.testOptionalIntValue] = 1
        defaults[.testIntValue] = 2
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testOptionalIntValue.key) as! Int, 1)
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testIntValue.key) as! Int, 2)
        defaults[.testOptionalIntValue] = nil
        XCTAssertNil(defaults.value(forKey: UserDefaultsKeys.testOptionalIntValue.key))
    }
    
    func testIntValueGet() {
        // デフォルト値
        XCTAssertNil(defaults[.testOptionalIntValue])
        XCTAssertEqual(defaults[.testIntValue], 0)
        // 値が存在する場合
        defaults[.testOptionalIntValue] = 1
        defaults[.testIntValue] = 2
        XCTAssertEqual(defaults[.testOptionalIntValue], 1)
        XCTAssertEqual(defaults[.testIntValue], 2)
    }
}

private extension UserDefaultsKeys {
    static let testIntValue = UserDefaultsKey<Int>("testIntValue")
    static let testOptionalIntValue = UserDefaultsKey<Int?>("testOptionalIntValue")
}
