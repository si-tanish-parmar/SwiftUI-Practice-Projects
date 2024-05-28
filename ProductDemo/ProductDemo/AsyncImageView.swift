//
//  AsyncImageView.swift
//  ProductDemo
//
//  Created by Tanish Parmar on 30/04/24.
//

import SwiftUI

struct AsyncImageView: View {
    let imageURL: String
    
    var body: some View {
        if let url = URL(string: imageURL){
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }

        }
        else{
            ProgressView()
        }
    }
}

#Preview {
    AsyncImageView(imageURL: ProductModel.dummy.image)
}
