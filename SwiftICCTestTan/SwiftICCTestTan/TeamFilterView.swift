//
//  TeamFilterView.swift
//  sifantasysdk
//
//  Created by Tanish Parmar on 07/04/24.
//

import SwiftUI

struct TeamFilterView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                    ForEach(0..<10) { _ in
                        TeamFilterRow()
                    }
                }.padding(.all, 0)
            }
        }
    }


#Preview {
    TeamFilterView()
}
