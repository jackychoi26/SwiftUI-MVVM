//
//  Sender+stub.swift
//  SwiftUI-MVVMTests
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation
@testable import SwiftUI_MVVM

extension Sender {

    static func stub(
        phone: String = "+1 (899) 523-3905",
        name: String = "Harding Welch",
        email: String = "hardingwelch@comdom.com"
    ) -> Sender {
        return .init(phone: phone, name: name, email: email)
    }
}
