//
//  DeliveriesRepositoryImpl.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import Foundation

struct DeliveriesRepositoryImpl: DeliveriesRepository  {

    private let localStorage: DeliveriesLocalStorage
    private let webservice: DeliveriesWebservice

    init(
        localStorage: DeliveriesLocalStorage = .init(),
        webservice: DeliveriesWebservice = .init()
    ) {
        self.localStorage = localStorage
        self.webservice = webservice
    }

    func getDeliveries(offset: Int, limit: Int = 10) async -> [Delivery] {
        return []
    }
}
