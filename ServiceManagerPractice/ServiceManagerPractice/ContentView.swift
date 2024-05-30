//
//  ContentView.swift
//  ServiceManagerPractice
//
//  Created by Tanish Parmar on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
                else if let product = viewModel.product{
                    VStack{
                        Text("Product Title: \(viewModel.product?.first?.title ?? "No products available")")
                    }
                    .padding()
                }
                else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                    .foregroundColor(.red)
                }else {
                    Text("No user data available")
                }
                Spacer()
            }
            .navigationTitle("Product Info")
            .onAppear {
            Task {
                await viewModel.fetchUser()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
