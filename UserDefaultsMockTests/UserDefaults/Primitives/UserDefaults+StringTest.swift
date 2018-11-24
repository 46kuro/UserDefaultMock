//
//  UserDefaults+StringTest.swift
//  UserDefaultsMockTests
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import XCTest
@testable import UserDefaultsMock

class UserDefaultsStringTest: XCTestCase {
    let defaults = UserDefaults(suiteName: "Test-UserDefaultsSample")!
    
    override func tearDown() {
        defaults.removeObject(forKey: UserDefaultsKeys.testStringValue.key)
        defaults.removeObject(forKey: UserDefaultsKeys.testOptionalStringValue.key)
    }
    
    func testStringValueSave() {
        defaults[.testOptionalStringValue] = "test"
        defaults[.testStringValue] = "hoge"
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testOptionalStringValue.key) as! String, "test")
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testStringValue.key) as! String, "hoge")
        defaults[.testOptionalStringValue] = nil
        XCTAssertNil(defaults.value(forKey: UserDefaultsKeys.testOptionalStringValue.key))
    }
    
    func testStringValueGet() {
        // デフォルト値
        XCTAssertNil(defaults[.testOptionalStringValue])
        XCTAssertEqual(defaults[.testStringValue], "")
        // 値が存在する場合
        defaults[.testOptionalStringValue] = "fuga"
        defaults[.testStringValue] = "hogehoge"
        XCTAssertEqual(defaults[.testOptionalStringValue], "fuga")
        XCTAssertEqual(defaults[.testStringValue], "hogehoge")
    }
}

private extension UserDefaultsKeys {
    static let testStringValue = UserDefaultsKey<String>("testStringValue")
    static let testOptionalStringValue = UserDefaultsKey<String?>("testOptionalStringValue")
}
