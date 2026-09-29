//
//  ContentView.swift
//  abcd
//
//  Created by Student on 10/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 30){
                Image("Devices-amico")
                    .resizable()
                    .scaledToFit()
                
                
                Text("Study for\nyour future")
                    .font(.system(size: 35, weight: .bold,design: .serif))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.color)
                NavigationLink(destination: sophia()){
                    Text("Get Started")
                        .frame(width: 300, height: 55)
                        .background(.color)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    
                    
                    
                    
                    
                }
                    
                    
                    
                    
                    
                }
                .padding(.bottom,100)
            }
        }
    }
    #Preview {
        ContentView()
    }

