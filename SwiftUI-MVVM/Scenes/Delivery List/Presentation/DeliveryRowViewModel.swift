//
//  DeliveryRowViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import Foundation

class DeliveryRowViewModel: ObservableObject {

    @Published var isFavorite: Bool
    
    let from: String
    let to: String
    let charge: String
    let imageUrlString: String

    init(isFavorite: Bool = false, from: String = "Hong Kong", to: String = "United Kingdom", charge: String = "$123.02", imageUrlString: String = "https://loremflickr.com/320/240/cat?lock=9953") {
        self.isFavorite = isFavorite
        self.from = from
        self.to = to
        self.charge = charge
        self.imageUrlString = imageUrlString
    }
}
