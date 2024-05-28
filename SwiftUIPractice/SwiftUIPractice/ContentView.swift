//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Tanish Parmar on 05/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapUIView()
                .frame(height: 300)
            CircleUIView()
                .offset(y: -130)
                                .padding(.bottom, -130)


            VStack(alignment: .leading, content: {
                Text("Turtle Rock")
                    .foregroundStyle(.red)
                HStack {
                    Text("Joshua National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                Divider()


                                Text("About Turtle Rock")
                                    .font(.title2)
                                Text("Descriptive text goes here.")
            })
            .padding(100)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
