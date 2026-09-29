//
//  ContentView.swift
//  Day2
//
//  Created by Student on 10/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Mapview()
                .frame(height:350)
            imageView()
                .offset(y : -130)
            
                
               
        }
        
        VStack{
            Text("Apple Lab")
                .font(.title)
                .bold()
            HStack{
                Text("Parul University")
                Text("vadodra")
                    .padding(
                        .leading,110)
            }
            Divider()
            .padding(.bottom,100)
            Text("About Apple Lab")
                .bold()
            Text("AAtce Training Center ")
                .font(.subheadline)
                .padding(.bottom,100)
        }
    }
}

#Preview {
    ContentView()
}
