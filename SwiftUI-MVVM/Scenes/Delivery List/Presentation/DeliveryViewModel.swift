//
//  DeliveryViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import Foundation

protocol DeliveryViewModel {
    var id: String { get }
    var from: String { get }
    var to: String { get }
    var imageUrl: URL? { get }
    var charge: String { get }
    var isFavorite: Bool { get }

    var onIsFavoriteUpdate: (() -> ())? { get set }
}
