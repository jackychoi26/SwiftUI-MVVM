//
//  DeliveryDetailView.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import SwiftUI

struct DeliveryDetailView: View {

    let viewModel: DeliveryDetailViewModel

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("From")
                            .font(.title2)

                        Spacer()

                        Text(viewModel.from)
                            .font(.title2)
                    }
                    HStack {
                        Text("To")
                            .font(.title2)

                        Spacer()

                        Text(viewModel.to)
                            .font(.title2)
                    }
                }
                .padding()
                .background(.gray)
                .padding()

                VStack(alignment: .leading) {
                    HStack {
                        Text("Goods to deliver")
                            .font(.title2)
                        Spacer()
                    }

                    AsyncImage(
                        url: viewModel.imageUrl
                    ) {
                        $0
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        Color.gray
                            .frame(width: 200, height: 200)
                    }
                    .padding(.leading, 40)


                }
                .padding()
                .background(.gray)
                .padding()

                HStack {
                    Text("Delivery Fee")
                        .font(.title2)
                    Spacer()
                    Text(viewModel.charge)
                        .font(.title2)
                }
                .padding()
                .background(.gray)
                .padding()
            }
            Button(action: {
                viewModel.onPrimaryButtonPress()
            }) {
                Text("Add to Favorite")
                    .font(.title2)
                    .padding(.vertical)
                    .padding(.horizontal, 60)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}

struct DeliveryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailView(viewModel:
                .init(delivery: Delivery(id: "", remarks: "", pickupTime: Date(), goodsPicture: URL(string: ""), deliveryFee: "", surchage: "", route: .init(start: "", end: ""), sender: .init(phone: "", name: "", email: "")))
        )
    }
}
