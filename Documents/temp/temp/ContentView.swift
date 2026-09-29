//
//  ContentView.swift
//  temp
//
//  Created by Student on 11/07/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var celsius = ""
    @State private var fahrenheit: Double = 0.0
    
    var body: some View {
        ZStack{
            Image("images-3")
                .resizable()
                
                .ignoresSafeArea()
            
            
            VStack(spacing: 40) {
                
                Text("Temperature Converter")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Enter Celsius", text: $celsius)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(150)
                    
                
                Button("Convert") {
                    
                    let c = Double(celsius) ?? 0.0
                    
                    
                    fahrenheit = (c * 9/5) + 32
                    
                    celsius = ""
                }
                .frame(width: 200, height: 50)
                .background(Color.red)
                .foregroundColor(.black)
                .cornerRadius(12)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}



