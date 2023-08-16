//
//  DeliveriesRepositoryImpl.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

class DeliveriesRepositoryImpl: DeliveriesRepository  {

    private let localStorage: DeliveriesLocalStorage
    private let webservice: DeliveriesWebservice

    init(
        localStorage: DeliveriesLocalStorage = .init(),
        webservice: DeliveriesWebservice = .init()
    ) {
        self.localStorage = localStorage
        self.webservice = webservice
    }

    func getDeliveries() async throws -> [Delivery] {
//        if let localDeliveries = await localStorage.get() {
//            return localDeliveries
//        } else {
            let data = try await webservice.performRequest(offset: 0)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([Delivery].self, from: data)
//        }
    }

    func updateDeliveries(offset: Int, limit: Int = 10) async throws -> [Delivery] {
        let data = try await webservice.performRequest(offset: offset)
        let decoder = JSONDecoder()
        return try decoder.decode([Delivery].self, from: data)
    }
}
