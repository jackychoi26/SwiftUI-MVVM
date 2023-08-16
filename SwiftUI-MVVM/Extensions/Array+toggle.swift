//
//  Array+toggle.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 17/8/2023.
//

import Foundation

extension Array where Element == String {
    mutating func toggle(_ value: String) {
        if let index = self.firstIndex(of: value) {
            self.remove(at: index)
        } else {
            self.append(value)
        }
    }
}
