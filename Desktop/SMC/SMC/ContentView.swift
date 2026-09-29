//
//  ContentView.swift
//  SMC
//
//  Created by Student on 09/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var mathMark: String=""
    @State private var chemMark: String=""
    @State private var phyMark: String=""
    @State private var totalmarks: Double=0
    @State private var percentage: Double=0
    var body: some View {
        NavigationStack{
            ZStack{
                Color.purple.opacity(0.18)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        TextField("Maths Marks", text:$mathMark)
                            .padding()
                        Image(systemName: "sum")
                            .padding()
                       
                    }.frame(width: 300,height: 55)
                        .background(.brown.opacity(0.8))
                        .cornerRadius(18)
                    HStack{
                        TextField("Chemistry Marks", text:$chemMark)
                            .padding()
                        Image(systemName: "testtube.2")
                            .padding()
                       
                    }.frame(width: 300,height: 55)
                        .background(.brown.opacity(0.8))
                        .cornerRadius(18)

                    HStack{
                        TextField("Physics Marks", text:$phyMark)
                            .padding()
                        Image(systemName: "atom")
                            .padding()
                       
                    }.frame(width: 300,height: 55)
                        .background(.brown.opacity(0.8))
                        .cornerRadius(18)
                    Button{
                        let a = Double (mathMark) ?? 0.0
                        let b = Double (chemMark) ?? 0.0
                        let c = Double (phyMark) ?? 0.0
                        totalmarks=a+b+c
                        percentage=totalmarks/3
                    
                    }label:{
                        Text("Calculate")
                            .foregroundStyle(.white)
                            .bold()
                            .frame(width:300,height: 55)
                            .background(.gray)
                            .cornerRadius(15)
                    }
                    
                    Text("Total Marks: \(totalmarks,specifier:"%.0f")")
                        .bold()
                    Text("Percentage: \(percentage,specifier:"%.2f")%")
                        .bold()
                    
                    
                }
                
                
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
