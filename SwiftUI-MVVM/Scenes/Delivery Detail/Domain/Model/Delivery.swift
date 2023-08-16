//
//  Delivery.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

class Delivery: Identifiable {

    let id: String
    let remarks: String
    let pickupTime: Date?
    let goodsPicture: URL?
    let deliveryFee: String
    let surchage: String
    let route: Route
    let sender: Sender

    init(
        id: String,
        remarks: String,
        pickupTime: Date?,
        goodsPicture: URL?,
        deliveryFee: String,
        surchage: String,
        route: Route,
        sender: Sender
    ) {
        self.id = id
        self.remarks = remarks
        self.pickupTime = pickupTime
        self.goodsPicture = goodsPicture
        self.deliveryFee = deliveryFee
        self.surchage = surchage
        self.route = route
        self.sender = sender
    }
}
