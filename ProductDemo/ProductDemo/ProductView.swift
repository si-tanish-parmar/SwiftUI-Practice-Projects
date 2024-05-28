//
//  ProductView.swift
//  ProductDemo
//
//  Created by Tanish Parmar on 26/04/24.
//

import SwiftUI

struct ProductView: View {
    @StateObject var viewModel = ProductViewModel()
    var body: some View {
        NavigationStack {
            List(viewModel.products){ product in
                NavigationLink {
                    //this is destination
                    ProductDetailView(product: product)
                } label: {
                    //our row
                    ProductRowView(product: product)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductView()
}
