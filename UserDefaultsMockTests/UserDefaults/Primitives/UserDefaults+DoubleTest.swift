//
//  UserDefaults+DoubleTest.swift
//  UserDefaultsMockTests
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import XCTest
@testable import UserDefaultsMock

class UserDefaultsDoubleTest: XCTestCase {
    let defaults = UserDefaults(suiteName: "Test-UserDefaultsSample")!
    
    override func tearDown() {
        defaults.removeObject(forKey: UserDefaultsKeys.testDoubleValue.key)
        defaults.removeObject(forKey: UserDefaultsKeys.testOptionalDoubleValue.key)
    }
    
    func testDoubleValueSave() {
        defaults[.testOptionalDoubleValue] = 1.2
        defaults[.testDoubleValue] = 2.3
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testOptionalDoubleValue.key) as! Double, 1.2)
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testDoubleValue.key) as! Double, 2.3)
        defaults[.testOptionalDoubleValue] = nil
        XCTAssertNil(defaults.value(forKey: UserDefaultsKeys.testOptionalDoubleValue.key))
    }
    
    func testDoubleValueGet() {
        // デフォルト値
        XCTAssertNil(defaults[.testOptionalDoubleValue])
        XCTAssertEqual(defaults[.testDoubleValue], 0)
        // 値が存在する場合
        defaults[.testOptionalDoubleValue] = 1.4
        defaults[.testDoubleValue] = 2.3
        XCTAssertEqual(defaults[.testOptionalDoubleValue], 1.4)
        XCTAssertEqual(defaults[.testDoubleValue], 2.3)
    }
}

private extension UserDefaultsKeys {
    static let testDoubleValue = UserDefaultsKey<Double>("testDoubleValue")
    static let testOptionalDoubleValue = UserDefaultsKey<Double?>("testOptionalDoubleValue")
}
