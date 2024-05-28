//
//  ContentView.swift
//  WeatherApp
//
//  Created by Tanish Parmar on 23/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    
    var body: some View {
        VStack {
            WelcomeView()
                .environment(locationManager)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
