//
//  ContentView.swift
//  GradeCounter
//
//  Created by Student on 26/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var maths:String = ""
    @State private var physics:String = ""
    @State private var chemistry:String = ""
    @State private var totalmarks:Double = 0
    @State private var percentage:Double = 0
    @State private var grade:String = ""
    
    var body: some View {
        ZStack {
            Color.purple.opacity(0.20)
                .ignoresSafeArea()
            Image(systemName: "graduationcap.fill")
                .font(.system(size: 100))
                .foregroundStyle(.black.opacity(0.15))
                .offset(x: 100, y : -300)
            Image(systemName:"checkmark.seal.fill")
                .font(.system(size:100))
                .foregroundStyle(.gray.opacity(0.30))
                .offset(x:100, y: 300)
            Image(systemName:"pencil.and.ruler.fill")
                .font(.system(size:100))
                .foregroundStyle(.white.opacity(0.50))
                .offset(x:-110, y: -150)
            Image(systemName:"book.fill")
                .font(.system(size:100))
                .foregroundStyle(.white.opacity(0.50))
                .offset(x:-110, y: 150)
            VStack{
                Text("Student Grade calculator")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundStyle(
                        LinearGradient(colors: [.black,.red,.orange,.yellow] , startPoint: .leading, endPoint: .trailing))
                
                HStack{
                    TextField("Enter maths marks 0-100",text: $maths)
                        .padding()
                        
                    Image(systemName: "sum")
                        .padding()
                        .foregroundStyle(.gray)
                }
                    .frame(width: 350, height: 60)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .shadow(radius: 15)
                HStack{
                    TextField("Enter physics marks 0-100",text: $physics)
                        .padding()
                        
                    Image(systemName: "atom")
                        .padding()
                        .foregroundStyle(.gray)
                } .frame(width: 350, height: 60)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .shadow(radius: 15)
                HStack{
                    TextField("Enter chemistry marks 0-100",text: $chemistry)
                        .padding()
                        
                    Image(systemName: "flask")
                        .padding()
                        .foregroundStyle(.gray)
                } .frame(width: 350, height: 60)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .shadow(radius: 15)
                Button{
                    var m = Double(maths) ?? 0.0
                    var p = Double (physics) ?? 0.0
                    var c = Double(chemistry) ?? 0.0
                    
                    totalmarks = m+p+c
                    
                    percentage = (totalmarks/300)*100
                    
                    if percentage >= 90
                    {
                        grade = "A+"
                    }
                    else if percentage >= 70
                    {
                        grade = "B"
                    }
                    else if percentage >= 60
                    {
                        grade = "C"
                    }
                    else if percentage >= 50
                    {
                        grade = "D"
                    }
                    else {
                        grade = "Fail"
                    }
                    
                }label: {
                    Text("Calculate")
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                        .frame(width: 250, height: 60)
                        .background(.black)
                        .cornerRadius(15)
                }
                Text("Total Marks \(totalmarks,specifier:"%.2f")/300")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                Text("Percentage \(percentage, specifier:"%.2f")%")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                Text("Grade\(grade)")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                     
                    
                
            }
            
            .frame(width: 370,height: 450)
            .background(.pink.opacity(0.05))
            .cornerRadius(20)
        }
    }
}

#Preview {
    ContentView()
}
