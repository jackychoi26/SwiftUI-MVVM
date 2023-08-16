//
//  Delivery.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

class Delivery: Identifiable, Codable {

    let id: String
    let remarks: String
    let pickupTime: Date?
    let goodsPicture: URL?
    let deliveryFee: String
    let surcharge: String
    let route: Route
    let sender: Sender

    init(
        id: String,
        remarks: String,
        pickupTime: Date?,
        goodsPicture: URL?,
        deliveryFee: String,
        surcharge: String,
        route: Route,
        sender: Sender
    ) {
        self.id = id
        self.remarks = remarks
        self.pickupTime = pickupTime
        self.goodsPicture = goodsPicture
        self.deliveryFee = deliveryFee
        self.surcharge = surcharge
        self.route = route
        self.sender = sender
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case remarks
        case pickupTime
        case goodsPicture
        case deliveryFee
        case surcharge
        case route
        case sender
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(remarks, forKey: .remarks)
        try container.encode(pickupTime, forKey: .pickupTime)
        try container.encode(goodsPicture, forKey: .goodsPicture)
        try container.encode(deliveryFee, forKey: .deliveryFee)
        try container.encode(surcharge, forKey: .surcharge)
        try container.encode(route, forKey: .route)
        try container.encode(sender, forKey: .sender)
    }
}
