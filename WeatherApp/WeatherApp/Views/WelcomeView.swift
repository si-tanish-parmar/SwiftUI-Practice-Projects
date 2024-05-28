//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Tanish Parmar on 23/04/24.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WelcomeView()
}
