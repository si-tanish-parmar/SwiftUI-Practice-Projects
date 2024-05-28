//
//  ProductViewModel.swift
//  ProductDemo
//
//  Created by Tanish Parmar on 26/04/24.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var products: [ProductModel] = []
    private let manager = APIManager()
    
    func fetchProducts() async {
        do {
            let fetchedProducts: [ProductModel] = try await manager.request(url: "https://fakestoreapi.com/products")
            DispatchQueue.main.async {
                self.products = fetchedProducts
            }
            print(fetchedProducts)
        } catch {
            print("Fetch product error: ", error)
        }
    }
}
