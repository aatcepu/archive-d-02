//
//  ContentView.swift
//  TravelGeneral
//
//  Created by Student on 26/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "map")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, User!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
