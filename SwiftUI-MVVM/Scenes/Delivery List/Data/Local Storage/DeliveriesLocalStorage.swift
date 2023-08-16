//
//  DeliveriesLocalStorage.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

class DeliveriesLocalStorage {

    private let fileName = "deliveries.json"

    func get() -> Data? {
        return try? readDeliveriesFromFile()
    }

    func write(data: Data) {
        try? writeDeliveriesToFile(data: data)
    }

    func appendData(data: Data) throws {
        let fileURL = try FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(fileName)

        let existingData = try Data(contentsOf: fileURL)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        var existingDeliveries = try decoder.decode([Delivery].self, from: existingData)
        let newDeliveries = try decoder.decode([Delivery].self, from: data)

        existingDeliveries.append(contentsOf: newDeliveries)

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let updatedData = try encoder.encode(existingDeliveries)

        try updatedData.write(to: fileURL)
    }
}

private extension DeliveriesLocalStorage {

    func writeDeliveriesToFile(data: Data) throws {
        let fileURL = try FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(fileName)

        try data.write(to: fileURL)
    }

    func readDeliveriesFromFile() throws -> Data {
        let fileURL = try FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(fileName)

        return try Data(contentsOf: fileURL)
    }
}
