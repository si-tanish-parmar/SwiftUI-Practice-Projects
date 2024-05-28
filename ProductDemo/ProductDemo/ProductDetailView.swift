//
//  ProductDetailView.swift
//  ProductDemo
//
//  Created by Tanish Parmar on 30/04/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductModel
    var body: some View {
        VStack(spacing: 16){
            AsyncImageView(imageURL: product.image)
                .scaledToFit()
                .frame(height: 200)
            Text(product.title)
                .font(.headline)
            Text(product.description)
                .font(.footnote)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProductDetailView(product: ProductModel.dummy)
}
