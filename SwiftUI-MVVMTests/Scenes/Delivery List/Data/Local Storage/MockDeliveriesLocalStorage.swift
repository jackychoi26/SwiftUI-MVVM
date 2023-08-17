//
//  MockDeliveriesLocalStorage.swift
//  SwiftUI-MVVMTests
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation
@testable import SwiftUI_MVVM

class MockDeliveriesLocalStorage: DeliveriesLocalStorage {

    var invokedGet = false
    var invokedGetCount = 0
    var stubbedGetResult: Data?

    override func get() -> Data? {
        invokedGet = true
        invokedGetCount += 1
        return stubbedGetResult
    }

    var invokedSave = false
    var invokedSaveCount = 0
    var invokedSaveParameter: Data!

    override func write(data: Data) {
        invokedSave = true
        invokedSaveCount += 1
        invokedSaveParameter = data
    }
}
