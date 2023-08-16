//
//  DeliveryRowView.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import SwiftUI

struct DeliveryRowView: View {

    let viewModel: DeliveryViewModel

    var body: some View {
        HStack {
            AsyncImage(
                url: viewModel.imageUrl
            ) {
                $0
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
            } placeholder: {
                Color.gray
                    .frame(width: 70, height: 70)

            }
            .padding(.horizontal)

            VStack(alignment: .leading) {
                Text("From: \(viewModel.from)")
                    .font(.headline)
                    .lineLimit(1)
                Text("To: \(viewModel.to)")
                    .font(.headline)
                    .lineLimit(1)
            }

            Spacer()

            VStack {
                if (viewModel.isFavorite) {
                    Label("", systemImage: "heart.fill")
                } else {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 1, height: 12)
                }

                Text(viewModel.charge)
                    .font(.headline)
            }
        }
        .padding()
    }
}

struct DeliveryRowView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryRowView(
            viewModel: DeliveryDetailViewModel(
                delivery: .init(
                    id: "5dd5f3a7156bae72fa5a5d6c",
                    remarks: "Minim veniam minim nisi ullamco consequat anim reprehenderit laboris aliquip voluptate sit.",
                    pickupTime: DateFormatter().date(from: "2014-10-06T10:45:38-08:00"),
                    goodsPicture: URL(string: "https://loremflickr.com/320/240/cat?lock=9953"),
                    deliveryFee: "$92.14",
                    surchage: "$136.46",
                    route: .init(start: "Hong Kong", end: "United Kingdom"),
                    sender: .init(
                        phone: "+1 (942) 512-3379",
                        name: "Kendra Guthrie",
                        email: "kendraguthrie@comdom.com"
                    )
                )
            )
        )
    }
}
