//
//  Route+stub.swift
//  SwiftUI-MVVMTests
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation
@testable import SwiftUI_MVVM

extension Route {

    static func stub(
        start: String = "Noble Street",
        end: String = "Montauk Court"
    ) -> Route {
        return .init(
            start: start,
            end: end
        )
    }
}
