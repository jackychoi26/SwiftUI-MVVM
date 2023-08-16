//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            DeliveryListView()
                .navigationTitle("My Deliveries")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
