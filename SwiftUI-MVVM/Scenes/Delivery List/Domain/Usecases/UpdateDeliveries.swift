//
//  UpdateDeliveries.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import Foundation

struct UpdateDeliveries {

    private let repository: DeliveriesRepository

    init(repository: DeliveriesRepository = DeliveriesRepositoryImpl()) {
        self.repository = repository
    }

    func execute(offset: Int, limit: Int = 10) async throws -> [Delivery] {
        try await repository.updateDeliveries(offset: offset, limit: limit)
    }
}
