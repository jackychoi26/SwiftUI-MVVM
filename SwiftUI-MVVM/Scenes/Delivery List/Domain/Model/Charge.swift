//
//  Charge.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import Foundation

struct Charge {

    private let deliveryFee: String
    private let surcharge: String

    init(deliveryFee: String, surchage: String) {
        self.deliveryFee = deliveryFee
        self.surcharge = surchage
    }

    func toLocalizedFee() -> String? {
        // You could do some localization logic here
        return addCurrencyStrings(deliveryFee: deliveryFee, surcharge: surcharge)
    }
}

private extension Charge {

    func addCurrencyStrings(deliveryFee: String, surcharge: String) -> String? {
        guard
            let deliveryValue = Double(deliveryFee.trimmingCharacters(in: ["$", " "])),
            let surchargeValue = Double(surcharge.trimmingCharacters(in: ["$", " "]))
        else {
            return nil
        }

        let total = deliveryValue + surchargeValue
        return String(format: "$%.2f", total)
    }
}
