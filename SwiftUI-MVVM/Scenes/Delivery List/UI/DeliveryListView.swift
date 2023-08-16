//
//  DeliveryListView.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 15/8/2023.
//

import SwiftUI

struct DeliveryListView: View {

    @StateObject var viewModel = DeliveryListViewModel()

    var body: some View {
        ScrollView {
            ForEach(viewModel.deliveries) {
                delivery in
                NavigationLink {
                    // TODO: Pass the loaded image to next page
                    DeliveryDetailView()
                } label: {
                    DeliveryRowView(viewModel: .init())
                }
            }
        }
        .refreshable {
            Task { @MainActor in
                await viewModel.fetchDeliveries()
            }
        }
        .onAppear {
            Task { @MainActor in
                await viewModel.fetchDeliveries()
            }
        }
    }
}

struct DeliveryListView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryListView()
    }
}
