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
    var invokedGetParameters: (offset: Int, limit: Int)?
    var invokedGetParametersList = [(offset: Int, limit: Int)]()
    var stubbedGetResult: [Delivery]! = []

    override func get(offset: Int, limit: Int = 10) -> [Delivery] {
        invokedGet = true
        invokedGetCount += 1
        invokedGetParameters = (offset, limit)
        invokedGetParametersList.append((offset, limit))
        return stubbedGetResult
    }
}
