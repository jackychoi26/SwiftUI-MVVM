//
//  MockDeliveriesWebservice.swift
//  SwiftUI-MVVMTests
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation
@testable import SwiftUI_MVVM

class MockDeliveriesWebservice: DeliveriesWebservice {

    var invokedPerformRequest = false
    var invokedPerformRequestCount = 0
    var invokedPerformRequestParameters: (offset: Int, limit: Int)?
    var invokedPerformRequestParametersList = [(offset: Int, limit: Int)]()
    var stubbedGetResult: [Delivery]! = []

    override func performRequest(offset: Int, limit: Int = 10) async -> [Delivery] {
        invokedPerformRequest = true
        invokedPerformRequestCount += 1
        invokedPerformRequestParameters = (offset, limit)
        invokedPerformRequestParametersList.append((offset, limit))
        return stubbedGetResult
    }
}
