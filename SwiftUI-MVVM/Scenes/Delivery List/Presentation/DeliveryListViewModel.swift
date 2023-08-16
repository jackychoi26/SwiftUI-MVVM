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

    @Published var deliveries: [Delivery] = []

    init(getDeliveries: GetDeliveries = .init()) {
        self.getDeliveries = getDeliveries
    }

    func fetchDeliveries() async {
        deliveries = await getDeliveries.execute(offset: 0)
    }

    func updateDeliveries() async {

    }
}
