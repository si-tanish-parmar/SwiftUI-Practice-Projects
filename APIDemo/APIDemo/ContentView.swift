//
//  ContentView.swift
//  APIDemo
//
//  Created by Tanish Parmar on 06/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var user: GithubUser?
    @State private var errorMessage: String?
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
                    
            }
            .frame(width: 120, height: 120)
            Text(user?.login ?? "Tan")
                .bold()
                .font(.title3)
            Text(user?.bio ?? "This is bio")
                .padding()
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            Spacer()
        }
        .task {
            do {
                user = try await getUser()
            } catch GHError.invalidURL {
                errorMessage = "Invalid URL"
            } catch GHError.invalidResponse {
                errorMessage = "Invalid Response"
            } catch GHError.invalidData {
                errorMessage = "Invalid Data"
            } catch {
                errorMessage = "An unexpected error occurred"
            }
        }
        .padding()
    }

    func getUser() async throws -> GithubUser {
        let endpoint = "https://api.github.com/users/tanish-parmar-si"
        guard let url = URL(string: endpoint) else { throw GHError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(GithubUser.self, from: data)
    }
}

#Preview {
    ContentView()
}
