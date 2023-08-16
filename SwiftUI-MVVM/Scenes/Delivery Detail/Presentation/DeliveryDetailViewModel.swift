//
//  DeliveryDetailViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import Foundation

struct DeliveryDetailViewModel: DeliveryViewModel {

    let id: String
    let from: String
    let to: String
    let imageUrl: URL?
    let charge: String
    let isFavorite: Bool

    func onPrimaryButtonPress() {

    }

    init(delivery: Delivery) {
        id = delivery.id
        from = delivery.route.start
        to = delivery.route.end
        imageUrl = delivery.goodsPicture
        
        // TODO: Discard the item if charge is corrupted
        charge = Charge(
            deliveryFee: delivery.deliveryFee,
            surcharge: delivery.surcharge
        ).toLocalizedFee() ?? ""

        isFavorite = false
    }
}
