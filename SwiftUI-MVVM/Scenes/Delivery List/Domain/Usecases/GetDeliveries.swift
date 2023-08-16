//
//  GetDeliveries.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

struct GetDeliveries {

    private let repository: DeliveriesRepository

    init(repository: DeliveriesRepository) {
        self.repository = repository
    }

    func execute(offset: Int, limit: Int = 10) async -> [Delivery] {
        return await repository.getDeliveries()
    }
}
