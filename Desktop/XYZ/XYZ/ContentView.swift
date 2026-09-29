//
//  ContentView.swift
//  XYZ
//
//  Created by Student on 07/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button{
                print("Welcome to NAMO Bharat")
            }label: {
                Text("Let's Go!")
                    .background(.blue)
                    .font(.system(size:20))
                    .foregroundStyle(.white)
                    .cornerRadius(18)
                    .frame(width:450,height:80)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
