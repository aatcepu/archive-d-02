//
//  ContentView.swift
//  Home_Page
//
//  Created by Student on 09/09/26.
//

import SwiftUI

struct Homepage: View {
    @State private var gotoswift:Bool=false
    var body: some View {
        Navigation
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
