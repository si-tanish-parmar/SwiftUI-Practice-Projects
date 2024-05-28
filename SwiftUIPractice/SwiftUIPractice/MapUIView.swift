//
//  MapUIView.swift
//  SwiftUIPractice
//
//  Created by Tanish Parmar on 07/04/24.
//

import SwiftUI
import MapKit

struct MapUIView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    private var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
}

#Preview {
    MapUIView()
}
