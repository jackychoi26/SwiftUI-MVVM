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
    private let updateDeliveries: UpdateDeliveries
    private let canFetchMoreDeliveries: CanFetchMoreDeliveries

    private var offset: Int = 0

    @Published var deliveryDetailViewModels: [DeliveryDetailViewModel] = []

    init(
        getDeliveries: GetDeliveries = .init(),
        updateDeliveries: UpdateDeliveries = .init(),
        canFetchMoreDeliveries: CanFetchMoreDeliveries = .init()
    ) {
        self.getDeliveries = getDeliveries
        self.updateDeliveries = updateDeliveries
        self.canFetchMoreDeliveries = canFetchMoreDeliveries
    }

    func fetchDeliveries() async {
        do {
            let deliveries = try await getDeliveries.execute(offset: 0)
            deliveryDetailViewModels = deliveries.compactMap {
                DeliveryDetailViewModel(delivery: $0)
            }
        } catch {
            // TODO: Shows alert
            print(error)
        }
    }

    func updateDeliveriesIfNeeded() async {
        do {
            if canFetchMoreDeliveries.execute() {
                let newDeliveryDetailViewModels = try await updateDeliveries.execute(
                    offset: deliveryDetailViewModels.count
                ).compactMap {
                    DeliveryDetailViewModel(delivery: $0)
                }

                deliveryDetailViewModels.append(contentsOf: newDeliveryDetailViewModels)
            }
        } catch {
            // TODO: Shows alert
            print(error)
        }
    }

    func refreshDeliveries() async {
        do {
            let deliveries = try await updateDeliveries.execute(offset: 0)

            deliveryDetailViewModels = deliveries.compactMap {
                DeliveryDetailViewModel(delivery: $0)
            }
        } catch {
            // TODO: Shows alert
            print(error)
        }
    }
}
