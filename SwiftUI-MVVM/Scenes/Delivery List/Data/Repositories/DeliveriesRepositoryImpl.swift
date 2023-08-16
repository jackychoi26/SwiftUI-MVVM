//
//  DeliveriesRepositoryImpl.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

class DeliveriesRepositoryImpl: DeliveriesRepository {

    private let key = "canFetchMoreDeliveries"

    private let localStorage: DeliveriesLocalStorage
    private let webservice: DeliveriesWebservice

    private let decoder: JSONDecoder
    private let encoder: JSONEncoder

    init(
        localStorage: DeliveriesLocalStorage = .init(),
        webservice: DeliveriesWebservice = .init()
    ) {
        self.localStorage = localStorage
        self.webservice = webservice

        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        decoder = jsonDecoder

        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = .iso8601
        encoder = jsonEncoder
    }

    func getDeliveries() async throws -> [Delivery] {
        if let data = localStorage.get() {
            return try decoder.decode([Delivery].self, from: data)
        } else {
            let data = try await webservice.performRequest(offset: 0)
            let deliveries = try decoder.decode([Delivery].self, from: data)

            updateCanFecthMoreValue(dataCount: deliveries.count)

            // Need to make sure the data is in correct format before saving
            localStorage.write(data: data)

            return deliveries
        }
    }

    func updateDeliveries(offset: Int, limit: Int = 10) async throws -> [Delivery] {
        let data = try await webservice.performRequest(offset: offset)
        let deliveries = try decoder.decode([Delivery].self, from: data)

        updateCanFecthMoreValue(dataCount: deliveries.count)

        if offset == 0 {
            // Restart the cache
            localStorage.write(data: data)
        } else {
            try appendDataToLocal(data: data)
        }

        return deliveries
    }

    func canFetchMore() -> Bool {
        UserDefaults.standard.bool(forKey: key)
    }
}

private extension DeliveriesRepositoryImpl {

    func appendDataToLocal(data: Data) throws {
        guard let existingData = localStorage.get() else { return }
        var existingDeliveries = try decoder.decode([Delivery].self, from: existingData)

        let newDeliveries = try decoder.decode([Delivery].self, from: data)
        existingDeliveries.append(contentsOf: newDeliveries)

        let updatedData = try encoder.encode(existingDeliveries)
        localStorage.write(data: updatedData)
    }

    func updateCanFecthMoreValue(dataCount: Int) {
        if dataCount < 10 {
            UserDefaults.standard.set(false, forKey: key)
        } else {
            UserDefaults.standard.set(true, forKey: key)
        }
    }
}
