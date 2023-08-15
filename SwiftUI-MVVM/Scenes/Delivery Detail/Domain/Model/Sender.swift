//
//  Sender.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

class Sender {

    let phone: String
    let name: String
    let email: String

    init(
        phone: String,
        name: String,
        email: String
    ) {
        self.phone = phone
        self.name = name
        self.email = email
    }
}
