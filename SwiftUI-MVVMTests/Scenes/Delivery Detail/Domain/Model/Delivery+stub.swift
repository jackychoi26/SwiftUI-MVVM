//
//  Delivery.swift
//  SwiftUI-MVVMTests
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation
@testable import SwiftUI_MVVM

extension Delivery {

    static func stub(
        id: String = "5dd5f3a7156bae72fa5a5d6c",
        remarks: String = "Minim veniam minim nisi ullamco consequat anim reprehenderit laboris aliquip voluptate sit.",
        pickupTime: Date? = DateFormatter().date(from: "2014-10-06T10:45:38-08:00"),
        goodsPicture: URL? = URL(string: "https://loremflickr.com/320/240/cat?lock=9953"),
        deliveryFee: String = "$92.14",
        surcharge: String = "$136.46",
        route: Route = .stub(),
        sender: Sender = .stub()
    ) -> Delivery {
        return .init(
            id: id,
            remarks: remarks,
            pickupTime: pickupTime,
            goodsPicture: goodsPicture,
            deliveryFee: deliveryFee,
            surcharge: surcharge,
            route: route,
            sender: sender
        )
    }
}
