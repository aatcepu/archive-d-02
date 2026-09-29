//
//  ContentView.swift
//  GradeCalculator
//
//  Created by Student on 01/07/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var principle: String = ""
    @State private var rate: String = ""
    @State private var time: String = ""
    @State private var SimpleInterest: Double = 0.0
    var body: some View {
        
        ZStack{
            
            Image(systemName: "graduationcap.fill")
                .font(.system(size: 120))
                .foregroundStyle(.blue.opacity(0.08))
                .offset(x: 130 , y: -300)
            
            Image(systemName: "book.fill")
                .font(.system(size: 100))
                .foregroundStyle(.purple.opacity(0.1))
                .offset(x: -130, y: -150)
            
            Image(systemName: "pencil.and.ruler.fill")
                .font(.system(size: 90))
                .foregroundStyle(.orange.opacity(0.1))
                .offset(x: 140, y: 50)
            
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 110))
                .foregroundStyle(.green.opacity(0.1))
                .offset(x: -140, y: 250)
            
            Image(systemName: "doc.text.fill")
                .font(.system(size: 90))
                .foregroundStyle(.pink.opacity(0.1))
                .offset(x: 100, y: 320)
            
            Text("🎖️")
                .font(.system(size: 130))
                .opacity(0.1)
                .offset(x: -110, y: -330)
            
            Text("🎓")
                .font(.system(size: 100))
                .opacity(0.1)
                .offset(x: -90, y: 50)
            
            VStack(spacing: 20){
                
                Text("Simple Interest calculator")
                    .fontDesign(.rounded)
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .foregroundStyle(
                        
                        LinearGradient(colors: [.orange, .purple, .blue], startPoint: .leading, endPoint: .trailing)
                    )
                
                HStack{
                    TextField("Principle", text: $principle)
                        .padding()
                    
                    Image(systemName: "atom")
                        .foregroundStyle(.gray)
                        .padding()
                }.frame(width: 360, height: 60)
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(radius: 5)
                
                HStack{
                    TextField("Rate", text: $rate)
                        .padding()
                    
                    Image(systemName: "flask")
                        .foregroundStyle(.gray)
                        .padding()
                }.frame(width: 360, height: 60)
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(radius: 5)
                
                HStack{
                    TextField("Time", text: $time)
                        .padding()
                    
                    Image(systemName: "sum")
                        .foregroundStyle(.gray)
                        .padding()
                }.frame(width: 360, height: 60)
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(radius: 5)
                
                Button{
                    
                    let p = Double(principle) ?? 0.0
                    let r = Double(rate) ?? 0.0
                    let t = Double(time) ?? 0.0
                    
                    SimpleInterest = (p * r * t)/100
                    
                    principle = ""
                    rate = ""
                    time = ""
                    
                }label: {
                    Text("Calculate")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .frame(width: 300, height: 60)
                        .foregroundStyle(.white)
                        .background(.blue.opacity(0.8))
                    
                        .cornerRadius(25)
                }
                
                Divider()
                
                Text("Simple Interest : \(SimpleInterest,specifier:"%.2f")")
                    .foregroundStyle(.gray)
                
                
            }
            .padding()
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 5)
        }
    }
}

#Preview {
    ContentView()
}
