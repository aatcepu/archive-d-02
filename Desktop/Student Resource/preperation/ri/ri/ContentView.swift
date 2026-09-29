//
//  ContentView.swift
//  ri
//
//  Created by Student on 15/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing:30){
            Image("123")
                .resizable()
                .scaledToFit()
            
            
        Text (Leading The Future)
                .font(
                    .system(size: 55,
                            weight :  .bold,design : .serif ))
                .multilineTextAlignment(.center)
                .foregroundStyle(.blue)
            
            Navig
        
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
