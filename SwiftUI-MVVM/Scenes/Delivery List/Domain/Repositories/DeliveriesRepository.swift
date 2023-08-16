//
//  DeliveriesRepository.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

protocol DeliveriesRepository {
    func getDeliveries() async throws -> [Delivery]
    func updateDeliveries(offset: Int, limit: Int) async throws -> [Delivery]
    func canFetchMore() -> Bool
}
