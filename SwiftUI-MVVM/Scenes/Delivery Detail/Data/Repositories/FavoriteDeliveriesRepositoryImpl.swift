//
//  FavoriteDeliveriesRepositoryImpl.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 17/8/2023.
//

import Foundation

class FavoriteDeliveriesRepositoryImpl: FavoriteDeliveriesRepository {

    private let key = "favoriteDeliveries"

    func getFavoriteDeliveryIds() -> [String] {
        UserDefaults.standard.stringArray(forKey: key) ?? []
    }

    func updateFavoriteDelivery(deliveryId: String) {
        if var favoriteDeliveries = UserDefaults.standard.stringArray(forKey: key) {
            favoriteDeliveries.toggle(deliveryId)
            UserDefaults.standard.set(favoriteDeliveries, forKey: key)
        } else {
            UserDefaults.standard.set([deliveryId], forKey: key)
        }
    }
}
