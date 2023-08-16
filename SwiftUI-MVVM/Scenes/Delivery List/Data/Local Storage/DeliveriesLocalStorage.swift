//
//  DeliveriesLocalStorage.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

class DeliveriesLocalStorage {

    func get() async -> [Delivery]? {
        // TODO: Get from JSON
        [.init(
            id: "",
            remarks: "",
            pickupTime: Date(),
            goodsPicture: URL(string: "https://loremflickr.com/320/240/cat?lock=9953"),
            deliveryFee: "21", surcharge: "21", route: .init(start: "Hong Kong", end: "United Kingdom"), sender: .init(phone: "+852 12345678", name: "James Joyce", email: "jamesJoyce@gmail.com"))]
    }

    func save(deliveries: [Delivery]) async {
        // TODO: Write to JSON
    }
}
