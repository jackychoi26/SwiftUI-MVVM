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
