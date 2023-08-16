//
//  CanFetchMoreDeliveries.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import Foundation

struct CanFetchMoreDeliveries {

    private let repository: DeliveriesRepository

    init(repository: DeliveriesRepository = DeliveriesRepositoryImpl()) {
        self.repository = repository
    }

    func execute() -> Bool {
        repository.canFetchMore()
    }
}

