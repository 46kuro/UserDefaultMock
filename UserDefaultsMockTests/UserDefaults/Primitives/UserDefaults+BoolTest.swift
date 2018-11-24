//
//  UserDefaults+BoolTest.swift
//  UserDefaultsMockTests
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import XCTest
@testable import UserDefaultsMock

class UserDefaultsBoolTest: XCTestCase {
    let defaults = UserDefaults(suiteName: "Test-UserDefaultsSample")!
    
    override func tearDown() {
        defaults.removeObject(forKey: UserDefaultsKeys.testBoolValue.key)
        defaults.removeObject(forKey: UserDefaultsKeys.testOptionalBoolValue.key)
    }
    
    func testBoolValueSave() {
        defaults[.testOptionalBoolValue] = false
        defaults[.testBoolValue] = true
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testOptionalBoolValue.key) as! Bool, false)
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testBoolValue.key) as! Bool, true)
        defaults[.testOptionalBoolValue] = nil
        XCTAssertNil(defaults.value(forKey: UserDefaultsKeys.testOptionalBoolValue.key))
    }
    
    func testBoolValueGet() {
        // デフォルト値
        XCTAssertNil(defaults[.testOptionalBoolValue])
        XCTAssertEqual(defaults[.testBoolValue], false)
        // 値が存在する場合
        defaults[.testOptionalBoolValue] = false
        defaults[.testBoolValue] = true
        XCTAssertEqual(defaults[.testOptionalBoolValue], false)
        XCTAssertEqual(defaults[.testBoolValue], true)
    }
}

private extension UserDefaultsKeys {
    static let testBoolValue = UserDefaultsKey<Bool>("testBoolValue")
    static let testOptionalBoolValue = UserDefaultsKey<Bool?>("testOptionalBoolValue")
}
