//
//  DeliveriesRepository.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

protocol DeliveriesRepository {
    func getDeliveries(offset: Int, limit: Int) async -> [Delivery]
}
