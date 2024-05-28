//
//  ProtocolBootcamp.swift
//  SwiftUIPrac
//
//  Created by Tanish Parmar on 07/05/24.
//

import SwiftUI

struct DefaultColorTheme{
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}
struct ProtocolBootcamp: View {
    let colorTheme: DefaultColorTheme = DefaultColorTheme()
    var body: some View {
        ZStack{
            colorTheme.tertiary
                .ignoresSafeArea()
            Text("Protocols are awesome")
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProtocolBootcamp()
}
