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
    var stubbedGetResult: [Delivery]? = []

    override func get() async -> [Delivery]? {
        invokedGet = true
        invokedGetCount += 1
        return stubbedGetResult
    }

    var invokedSave = false
    var invokedSaveCount = 0
    var invokedSaveParameters: (deliveries: [Delivery], Void)?
    var invokedSaveParametersList = [(deliveries: [Delivery], Void)]()

    override func save(deliveries: [Delivery]) async {
        invokedSave = true
        invokedSaveCount += 1
        invokedSaveParameters = (deliveries, ())
        invokedSaveParametersList.append((deliveries, ()))
    }
}
