//
//  ContentView.swift
//  Pratishtha
//
//  Created by Student on 27/07/26.
//

import SwiftUI
   
struct ContentView: View {
    @State private var count  = 1
    var body: some View {
        VStack{
            Stepper("Number of Cards : \(count)", value: $count , in: 1...20)
                .foregroundColor(.blue)
                .bold()
                .padding()
            
            ScrollView{
                VStack(spacing: 20){
                                     ForEach(1...count , id: \.self){i in
                        VStack{
                            Text("Card\(i)")
                        }
                        .frame(maxWidth: .infinity, minHeight: 90)
                        .background(.green)
                        .cornerRadius(25)
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}
#Preview{
    ContentView()
}
