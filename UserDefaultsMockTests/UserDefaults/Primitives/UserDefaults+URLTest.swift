//
//  UserDefaults+URLTest.swift
//  UserDefaultsMockTests
//
//  Created by Shinji Kurosawa on 2018/11/24.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import XCTest
@testable import UserDefaultsMock

class UserDefaultsURLTest: XCTestCase {
    let defaults = UserDefaults(suiteName: "Test-UserDefaultsSample")!
    
    override func tearDown() {
        defaults.removeObject(forKey: UserDefaultsKeys.testOptionalURLValue.key)
    }
    
    func testURLValueSave() {
        defaults[.testOptionalURLValue] = URL(string: "test")!
        XCTAssertEqual(defaults.url(forKey: UserDefaultsKeys.testOptionalURLValue.key), URL(string: "test"))
        defaults[.testOptionalURLValue] = nil
        XCTAssertNil(defaults.value(forKey: UserDefaultsKeys.testOptionalURLValue.key))
    }
    
    func testURLValueGet() {
        // デフォルト値
        XCTAssertNil(defaults[.testOptionalURLValue])
        // 値が存在する場合
        defaults[.testOptionalURLValue] = URL(string: "test")!
        XCTAssertEqual(defaults[.testOptionalURLValue], URL(string: "test")!)
    }
}

private extension UserDefaultsKeys {
    static let testOptionalURLValue = UserDefaultsKey<URL?>("testOptionalURLValue")
}
