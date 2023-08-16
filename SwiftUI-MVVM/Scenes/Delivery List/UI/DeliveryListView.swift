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
            ForEach(viewModel.deliveryDetailViewModels, id: \.id) {
                deliveryDetailViewModel in
                NavigationLink {
                    // TODO: Pass the loaded image to next page
                    DeliveryDetailView(viewModel: deliveryDetailViewModel)
                } label: {
                    DeliveryRowView(viewModel: deliveryDetailViewModel)
                        .foregroundColor(.black)
                }
            }

            Rectangle()
                .fill(Color.clear)
                .frame(width: 1, height: 20)
                .onAppear {
                    Task {
                        await viewModel.updateDeliveriesIfNeeded()
                    }
                }
        }
        .refreshable {
            Task { 
                await viewModel.refreshDeliveries()
            }
        }
        .onAppear {
            Task {
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
