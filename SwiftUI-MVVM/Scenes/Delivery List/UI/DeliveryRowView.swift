//
//  DeliveryRowView.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import SwiftUI

struct DeliveryRowView: View {

    let viewModel: DeliveryRowViewModel

    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: viewModel.imageUrlString)
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
        DeliveryRowView(viewModel: .init())
    }
}
