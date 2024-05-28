//
//  ProductRowView.swift
//  ProductDemo
//
//  Created by Tanish Parmar on 26/04/24.
//

import SwiftUI

struct ProductRowView: View {
    let product: ProductModel
    var body: some View {
        HStack(spacing: 10){
            if let url = URL(string: product.image){
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading, spacing: 5){
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                HStack {
                    Text(product.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                        Text(product.rating.rate.toString())
                    }
                    .fontWeight(.medium)
                    .foregroundColor(.yellow)
                }
                Text(product.description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                HStack{
                    Text(product.price.currenctFormat())
                        .font(.title3)
                        .foregroundColor(.indigo)
                    Spacer()
                    Button(action: {}, label: {
                        Text("Buy")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .background(.indigo)
                            .clipShape(.capsule)
                    })
                }
                .padding(10)
            }
        }
        .padding(10)
    }
}

#Preview {
    ProductRowView(product: ProductModel.dummy)
}
