//
//  Mapview.swift
//  Day2
//
//  Created by Student on 10/07/26.
//

import SwiftUI
import MapKit
import CoreLocation
struct Mapview: View {
    var body: some View {
        Map(initialPosition: .region(reg))
    }
    private var reg: MKCoordinateRegion{
        MKCoordinateRegion(
            center:CLLocationCoordinate2D(latitude: 22.2978132,longitude: 73.3889951),
            span: MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.09)
        )
    }
}

#Preview {
    Mapview()
}
