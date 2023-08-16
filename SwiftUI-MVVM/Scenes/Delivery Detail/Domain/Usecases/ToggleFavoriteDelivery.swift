//
//  ToggleFavoriteDelivery.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 17/8/2023.
//

import Foundation

struct ToggleFavoriteDelivery {

    private let repository: FavoriteDeliveriesRepository

    init(repository: FavoriteDeliveriesRepository = FavoriteDeliveriesRepositoryImpl()) {
        self.repository = repository
    }

    func execute(deliveryId: String) {
        repository.updateFavoriteDelivery(deliveryId: deliveryId)
    }
}
