//
//  GetFavoriteDeliveries.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 17/8/2023.
//

import Foundation

struct GetFavoriteDeliveries {

    private let repository: FavoriteDeliveriesRepository

    init(repository: FavoriteDeliveriesRepository = FavoriteDeliveriesRepositoryImpl()) {
        self.repository = repository
    }

    func execute() -> [String] {
        repository.getFavoriteDeliveryIds()
    }
}
