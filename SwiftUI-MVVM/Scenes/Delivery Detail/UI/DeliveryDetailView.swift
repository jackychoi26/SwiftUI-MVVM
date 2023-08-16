//
//  DeliveryDetailView.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import SwiftUI

struct DeliveryDetailView: View {

    @StateObject var viewModel: DeliveryDetailViewModel

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
                Text(viewModel.isFavorite ? "Remove favorite" : "Add to Favorite")
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
        DeliveryDetailView(
            viewModel: .init(
                delivery: .init(
                    id: "5dd5f3a7156bae72fa5a5d6c",
                    remarks: "Minim veniam minim nisi ullamco consequat anim reprehenderit laboris aliquip voluptate sit.",
                    pickupTime: DateFormatter().date(from: "2014-10-06T10:45:38-08:00"),
                    goodsPicture: URL(string: "https://loremflickr.com/320/240/cat?lock=9953"),
                    deliveryFee: "$92.14",
                    surcharge: "$136.46",
                    route: .init(start: "Hong Kong", end: "United Kingdom"),
                    sender: .init(
                        phone: "+1 (942) 512-3379",
                        name: "Kendra Guthrie",
                        email: "kendraguthrie@comdom.com"
                    )
                ),
                isFavorite: true
            )
        )
    }
}
