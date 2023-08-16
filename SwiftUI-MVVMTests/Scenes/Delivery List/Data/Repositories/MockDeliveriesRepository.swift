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
    var stubbedGetDeliveriesResult: [Delivery]!

    override func getDeliveries() async -> [Delivery] {
        invokedGetDeliveries = true
        invokedGetDeliveriesCount += 1
        return stubbedGetDeliveriesResult
    }

    var invokedUpdateDeliveries = false
    var invokedUpdateDeliveriesCount = 0
    var invokedGetDeliveriesParametersOffset: Int!
    var invokedGetDeliveriesParametersLimit: Int!
    var invokedUpdateDeliveriesParametersList = [(offset: Int, limit: Int)]()
    var stubbedUpdateDeliveriesResult: [Delivery]!

    override func updateDeliveries(offset: Int, limit: Int = 10) async -> [Delivery] {
        invokedUpdateDeliveries = true
        invokedUpdateDeliveriesCount += 1
        invokedGetDeliveriesParametersOffset = offset
        invokedGetDeliveriesParametersLimit = limit
        invokedUpdateDeliveriesParametersList.append((offset, limit))
        return stubbedUpdateDeliveriesResult
    }
}
