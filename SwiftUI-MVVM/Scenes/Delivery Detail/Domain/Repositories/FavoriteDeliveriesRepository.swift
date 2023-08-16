//
//  FavoriteDeliveriesRepository.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 17/8/2023.
//

import Foundation

protocol FavoriteDeliveriesRepository {
    func getFavoriteDeliveryIds() -> [String]
    func updateFavoriteDelivery(deliveryId: String)
}
