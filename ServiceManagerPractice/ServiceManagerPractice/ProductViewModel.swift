//
//  ProductViewModel.swift
//  ServiceManagerPractice
//
//  Created by Tanish Parmar on 29/05/24.
//

import Foundation

@MainActor
class ProductViewModel: ObservableObject {
    @Published var product: [ProductModel]?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    let serviceManager = APIServiceManager()
    
    func fetchUser() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedProduct = try await serviceManager.fetchUserData()
            product = fetchedProduct
        } catch {
            errorMessage = "Failed to fetch user data: \(error.localizedDescription)"
        }
        isLoading = false
    }
}
