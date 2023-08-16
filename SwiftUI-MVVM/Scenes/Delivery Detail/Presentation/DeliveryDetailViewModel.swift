//
//  DeliveryDetailViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import Foundation

class DeliveryDetailViewModel: DeliveryViewModel, ObservableObject {

    let id: String
    let from: String
    let to: String
    let imageUrl: URL?
    let charge: String
    @Published var isFavorite: Bool

    var onIsFavoriteUpdate: (() -> ())?

    private let toggleFavoriteDelivery: ToggleFavoriteDelivery

    init(
        delivery: Delivery,
        isFavorite: Bool,
        toggleFavoriteDelivery: ToggleFavoriteDelivery = .init()
    ) {
        id = delivery.id
        from = delivery.route.start
        to = delivery.route.end
        imageUrl = delivery.goodsPicture
        
        // TODO: Discard the item if charge is corrupted
        charge = Charge(
            deliveryFee: delivery.deliveryFee,
            surcharge: delivery.surcharge
        ).toLocalizedFee() ?? ""

        self.isFavorite = isFavorite
        self.toggleFavoriteDelivery = toggleFavoriteDelivery
    }

    func onPrimaryButtonPress() {
        toggleFavoriteDelivery.execute(deliveryId: id)
        isFavorite.toggle()
        onIsFavoriteUpdate?()
    }
}
