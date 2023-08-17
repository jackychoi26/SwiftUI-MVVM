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
    var invokedPerformRequestParameterOffset: Int!
    var invokedPerformRequestParameterLimit: Int!
    var stubbedGetResult: Data!

    override func performRequest(offset: Int, limit: Int = 10) async throws -> Data {
        invokedPerformRequest = true
        invokedPerformRequestCount += 1
        invokedPerformRequestParameterOffset = offset
        invokedPerformRequestParameterLimit = limit
        return stubbedGetResult
    }
}
