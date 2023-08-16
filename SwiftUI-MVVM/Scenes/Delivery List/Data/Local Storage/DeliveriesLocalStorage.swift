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
            goodsPicture: URL(string: "https://www.google.com"),
            deliveryFee: "21", surchage: "21", route: .init(start: "hehe", end: "haha"), sender: .init(phone: "hehe", name: "hoho", email: "wawa"))]
    }

    func save(deliveries: [Delivery]) async {
        // TODO: Write to JSON
    }
}
