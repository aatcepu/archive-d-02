//
//  ContentView.swift
//  xyxzz
//
//  Created by Student on 08/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Puthem Lanchenbi")
            .bold()
            .italic()
            .underline()
            .foregroundStyle(.red)
            .font(.system(size:35,design:.monospaced))
            .background(.yellow.opacity(0.5))
    }
}
#Preview {
    ContentView()
}
