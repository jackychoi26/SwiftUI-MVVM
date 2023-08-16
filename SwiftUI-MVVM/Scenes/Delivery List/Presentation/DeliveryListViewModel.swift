//
//  DeliveryListViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import Foundation

@MainActor
class DeliveryListViewModel: ObservableObject {

    private let getDeliveries: GetDeliveries

    private var offset: Int = 0

    @Published var deliveryDetailViewModels: [DeliveryDetailViewModel] = []

    init(getDeliveries: GetDeliveries = .init()) {
        self.getDeliveries = getDeliveries
    }

    func fetchDeliveries() async {
        let deliveries = await getDeliveries.execute(offset: 0)
        deliveryDetailViewModels = deliveries.compactMap {
            DeliveryDetailViewModel(delivery: $0)
        }
    }

    func updateDeliveries() async {

    }
}
