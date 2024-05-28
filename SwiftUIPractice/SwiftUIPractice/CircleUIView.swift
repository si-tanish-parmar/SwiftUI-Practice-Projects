//
//  CircleUIView.swift
//  SwiftUIPractice
//
//  Created by Tanish Parmar on 07/04/24.
//

import SwiftUI

struct CircleUIView: View {
    var body: some View {
        Image("turtlerock")
            .resizable()
            .clipShape(Circle())
            .overlay(content: {
                Circle().stroke(.white,lineWidth: 4)
            })
            .frame(width: 250, height: 250)
            .shadow(radius: 7)
    }
}

#Preview {
    CircleUIView()
}
