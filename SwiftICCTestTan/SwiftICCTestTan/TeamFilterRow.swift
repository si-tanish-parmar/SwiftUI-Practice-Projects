//
//  TeamFilterRow.swift
//  sifantasysdk
//
//  Created by Tanish Parmar on 07/04/24.
//

import SwiftUI

struct TeamFilterRow: View {
    @State private var isSelected = false
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack {
                VStack(alignment: .leading) {
                    Text("AFG")
                        .font(.system(size: 14))
                        .foregroundColor(isSelected ? Color.blue : Color.black)
                    
                    Text("Afghanistan")
                        .font(.system(size: 14))
                        .foregroundColor(isSelected ? Color.blue : Color.black)
                }
                Spacer()
                RadioButtonStyle(isSelected: $isSelected)
            }
            .padding([.top, .bottom], 12)
            .padding([.horizontal], 16)
            .background(isSelected ? Color.gray.opacity(0.7) : Color.white)
        }
        .buttonStyle(PlainButtonStyle()) // Removes button default style
    }
}

struct RadioButtonStyle: View {
    @Binding var isSelected: Bool
    
    var body: some View {
        Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
            .resizable()
            .frame(width: 16, height: 16)
            .foregroundColor(isSelected ? Color.blue : Color.black)
    }
}
#Preview {
    TeamFilterRow()
}

