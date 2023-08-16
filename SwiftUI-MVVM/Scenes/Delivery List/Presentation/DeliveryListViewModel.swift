//
//  DeliveryListViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import Foundation

@MainActor
class DeliveryListViewModel: ObservableObject {

    @Published var deliveryDetailViewModels: [DeliveryDetailViewModel] = []

    private let getDeliveries: GetDeliveries
    private let updateDeliveries: UpdateDeliveries
    private let canFetchMoreDeliveries: CanFetchMoreDeliveries
    private let getFavoriteDeliveries: GetFavoriteDeliveries

    private var offset: Int = 0

    private var favoriteDeliveries: [String]

    init(
        getDeliveries: GetDeliveries = .init(),
        updateDeliveries: UpdateDeliveries = .init(),
        canFetchMoreDeliveries: CanFetchMoreDeliveries = .init(),
        getFavoriteDeliveries: GetFavoriteDeliveries = .init()
    ) {
        self.getDeliveries = getDeliveries
        self.updateDeliveries = updateDeliveries
        self.canFetchMoreDeliveries = canFetchMoreDeliveries
        self.getFavoriteDeliveries = getFavoriteDeliveries

        favoriteDeliveries = getFavoriteDeliveries.execute()
    }

    func fetchDeliveries() async {
        do {
            let deliveries = try await getDeliveries.execute(offset: 0)
            deliveryDetailViewModels = deliveries.compactMap {
                deliveryDetailViewModel(delivery: $0)
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
                    deliveryDetailViewModel(delivery: $0)
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
                deliveryDetailViewModel(delivery: $0)
            }
        } catch {
            // TODO: Shows alert
            print(error)
        }
    }
}

private extension DeliveryListViewModel {

    func deliveryDetailViewModel(delivery: Delivery) -> DeliveryDetailViewModel {
        let viewModel = DeliveryDetailViewModel(
            delivery: delivery,
            isFavorite: favoriteDeliveries.contains(delivery.id)
        )

        viewModel.onIsFavoriteUpdate = {
            [weak self] in
            guard let self = self else { return }
            self.favoriteDeliveries = self.getFavoriteDeliveries.execute()
        }

        return viewModel
    }
}
