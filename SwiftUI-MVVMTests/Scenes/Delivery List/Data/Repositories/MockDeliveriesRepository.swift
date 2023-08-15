//
//  MockDeliveriesRepository.swift
//  SwiftUI-MVVMTests
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation
@testable import SwiftUI_MVVM

class MockDeliveriesRepository: DeliveriesRepositoryImpl {

    var invokedGetDeliveries = false
    var invokedGetDeliveriesCount = 0
    var invokedGetDeliveriesParametersOffset: Int!
    var invokedGetDeliveriesParametersLimit: Int!
    var invokedGetDeliveriesParametersList = [(offset: Int, limit: Int)]()
    var stubbedGetResult: [Delivery]! = []

    override func getDeliveries(offset: Int, limit: Int = 10) async -> [Delivery] {
        invokedGetDeliveries = true
        invokedGetDeliveriesCount += 1
        invokedGetDeliveriesParametersOffset = offset
        invokedGetDeliveriesParametersLimit = limit
        invokedGetDeliveriesParametersList.append((offset, limit))
        return stubbedGetResult
    }
}
