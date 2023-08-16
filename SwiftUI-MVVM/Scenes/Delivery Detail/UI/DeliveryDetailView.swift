//
//  DeliveryDetailView.swift
//  SwiftUI-MVVM
//
//  Created by Choi Kin Lung on 16/8/2023.
//

import SwiftUI

struct DeliveryDetailView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("From")
                            .font(.title2)

                        Spacer()

                        Text("Hong Kong")
                            .font(.title2)
                    }
                    HStack {
                        Text("To")
                            .font(.title2)

                        Spacer()

                        Text("United Kingdom")
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
                        url: URL(string: "https://loremflickr.com/320/240/cat?lock=9953")
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
                    Text("$85")
                        .font(.title2)
                }
                .padding()
                .background(.gray)
                .padding()
            }
            Button(action: {
                print("Button was tapped!")
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
        DeliveryDetailView()
    }
}
