//
//  UserDefaults+DateTest.swift
//  UserDefaultsMockTests
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import XCTest
@testable import UserDefaultsMock

class UserDefaultsDateTest: XCTestCase {
    let defaults = UserDefaults(suiteName: "Test-UserDefaultsSample")!
    
    override func tearDown() {
        defaults.removeObject(forKey: UserDefaultsKeys.testOptionalDateValue.key)
    }
    
    func testDateValueSave() {
        defaults[.testOptionalDateValue] = Date(timeIntervalSince1970: 50)
        XCTAssertEqual(defaults.value(forKey: UserDefaultsKeys.testOptionalDateValue.key) as! Date, Date(timeIntervalSince1970: 50))
        defaults[.testOptionalDateValue] = nil
        XCTAssertNil(defaults.value(forKey: UserDefaultsKeys.testOptionalDateValue.key))
    }
    
    func testDateValueGet() {
        // デフォルト値
        XCTAssertNil(defaults[.testOptionalDateValue])
        // 値が存在する場合
        defaults[.testOptionalDateValue] = Date(timeIntervalSince1970: 50)
        XCTAssertEqual(defaults[.testOptionalDateValue], Date(timeIntervalSince1970: 50))
    }
}

private extension UserDefaultsKeys {
    static let testOptionalDateValue = UserDefaultsKey<Date?>("testOptionalDateValue")
}
