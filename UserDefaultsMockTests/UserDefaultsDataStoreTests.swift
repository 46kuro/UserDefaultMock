//
//  UserDefaultsDataStoreTests.swift
//  UserDefaultsMockTests
//
//  Created by Shinji Kurosawa on 2018/11/18.
//  Copyright © 2018 Shinji Kurosawa. All rights reserved.
//

import XCTest
@testable import UserDefaultsMock

class UserDefaultsDataStoreTests: XCTestCase {

    // 本体のUserDefaultsを書き換えると、本体の動作に影響が出るため
    // MockのUserDefaultsを使用する
    let dataStore  = UserDefaultsDataStore(shareable: MockDataStoreShareableClass())
    
    override func tearDown() {
        super.tearDown()
        UserDefaults(suiteName: "Test-UserDefaultsSample")?.removeObject(forKey: UserDefaultsKeys.testIntValue.key)
        UserDefaults(suiteName: "Test-UserDefaultsSample")?.removeObject(forKey: UserDefaultsKeys.testOptionalIntValue.key)
    }
    
    func testDefaultsStoreInit() {
        let dataStore1 = UserDefaultsDataStore()
        XCTAssertEqual(dataStore1.shareable.suiteName, "UserDefaultsSample")
        XCTAssertEqual(dataStore.shareable.suiteName, "Test-UserDefaultsSample")
    }
    
    func testSave() {
        // データが存在しないとき
        let notSavedValue = UserDefaults(suiteName: "Test-UserDefaultsSample")?.value(forKey: UserDefaultsKeys.testOptionalIntValue.key) as? Int
        let notSavedValue2 = UserDefaults(suiteName: "Test-UserDefaultsSample")?.value(forKey: UserDefaultsKeys.testIntValue.key) as? Int
        XCTAssertNil(notSavedValue)
        XCTAssertNil(notSavedValue2)
        // データが保存されること
        dataStore.save(key: .testOptionalIntValue, value: 2)
        dataStore.save(key: .testIntValue, value: 3)
        let savedValue = UserDefaults(suiteName: "Test-UserDefaultsSample")?.value(forKey: UserDefaultsKeys.testOptionalIntValue.key) as? Int
        XCTAssertEqual(savedValue, 2)
        let savedValue2 = UserDefaults(suiteName: "Test-UserDefaultsSample")?.value(forKey: UserDefaultsKeys.testIntValue.key) as? Int
        XCTAssertEqual(savedValue2, 3)
        // nilが保存できること
        dataStore.save(key: .testOptionalIntValue, value: nil)
        let notSavedValue3 = UserDefaults(suiteName: "Test-UserDefaultsSample")?.value(forKey: UserDefaultsKeys.testOptionalIntValue.key) as? Int
        XCTAssertNil(notSavedValue3)
    }
    
    func testGet() {
        // データが存在しないとき
        XCTAssertNil(dataStore.get(key: .testOptionalIntValue))
        XCTAssertEqual(dataStore.get(key: .testIntValue), 0)
        // データが保存されているとき
        dataStore.save(key: .testOptionalIntValue, value: 2)
        dataStore.save(key: .testIntValue, value: 3)
        XCTAssertEqual(dataStore.get(key: .testOptionalIntValue), 2)
        XCTAssertEqual(dataStore.get(key: .testIntValue), 3)
    }
    
    class MockDataStoreShareableClass: UserDefaultsDataShareable {
        var suiteName: String { return "Test-UserDefaultsSample" }
    }
}

private extension UserDefaultsKeys {
    static let testOptionalIntValue = UserDefaultsKey<Int?>("testOptionalIntValue")
    static let testIntValue = UserDefaultsKey<Int>("testIntValue")
}
