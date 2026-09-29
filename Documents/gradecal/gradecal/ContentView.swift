//
//  ContentView.swift
//  gradecal
//
//  Created by Student on 11/07/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var maths:String = ""
    @State private var physics:String = ""
    @State private var chemistry:String = ""
    @State private var totalMarks:Double = 0.0
    @State private var percentage:Double = 0.0
    @State private var grade:String = ""
    
    var body: some View {
        ZStack{
            
            Color.gray
                .opacity(0.10)
                .ignoresSafeArea()
            
            
            Image(systemName:"book.pages.fill")
                .font(.system(size: 120))
                .foregroundStyle(.blue.opacity(0.08))
                .offset(x: 130, y: -300)
            
            
            Image(systemName:"graduationcap.fill")
                .font(.system(size: 100))
                .foregroundStyle(.purple.opacity(0.08))
                .offset(x: -130, y: -150)
            
            
            Image(systemName:"pencil.and.scribble")
                .font(.system(size: 90))
                .foregroundStyle(.orange.opacity(0.08))
                .offset(x: 140, y: 50)
            
            
            Image(systemName:"checkmark.seal")
                .font(.system(size: 150))
                .foregroundStyle(.green.opacity(0.08))
                .offset(x: -140, y: 250)
            
            
            Image(systemName: "document.fill")
                .font(.system(size: 80))
                .foregroundStyle(.green.opacity(0.08))
                .offset(x: 100, y: 320)
            
            VStack(spacing:20){
                
                Text("Student grade calculator")
                    .font(.system(size:30))
                    .fontWeight(.bold)
                    .foregroundStyle(LinearGradient(colors: [.orange,.yellow,.purple,.blue], startPoint: .leading, endPoint: .trailing))
                
                HStack{
                    TextField("Maths marks 0-100",text: $maths)
                        .padding()
                    
                    Image(systemName: "sum")
                        .foregroundStyle(.gray)
                        .padding()
                }.frame(width: 350,height:60)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                
                
                HStack{
                    TextField("Physics marks 0-100",text: $physics)
                        .padding()
                    
                    Image(systemName: "atom")
                        .foregroundStyle(.gray)
                        .padding()
                }.frame(width: 350,height:60)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                
                
                HStack{
                    TextField("Chemistry marks 0-100",text: $chemistry)
                        .padding()
                    
                    Image(systemName: "flask")
                        .foregroundStyle(.gray)
                        .padding()
                }.frame(width: 350,height:60)
                    .background(Color(.systemGray6))
                    
                    .cornerRadius(20)
                
                
                
                
                
                Button{
                    let m = Double(maths) ?? 0.0
                    let p = Double(physics) ?? 0.0
                    let c = Double(chemistry) ?? 0.0
                    
                    
                    totalMarks = m+p+c
                    
                    percentage = (totalMarks/300)*100
                    
                    
                    if percentage > 90
                    {
                        grade = "A+"
                    }
                    else if percentage > 80{
                        grade = "A"
                    }
                    else if percentage > 60{
                        grade = "B"
                    }
                    else if percentage > 50{
                        grade = "C"
                    }
                    else{
                        grade = "F"
                    }
                    
                    
                    
                    
                    maths = ""
                    physics=""
                    chemistry=""
                    
                    
                }label:{
                    Text("Calculate")
                        .font(.system(size:18,weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 300,height: 60)
                        .background(LinearGradient(colors: [.orange,.yellow,.purple,.blue], startPoint: .leading, endPoint: .trailing))
                    
                        .cornerRadius(15)
                }
                Divider()
                
                Text("Total marks: \(Int(totalMarks))/300")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                
                Text("Percentage: \(percentage,specifier: "%.2f")%")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                
                
                Text("Grade: \(grade)")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.green)
                
                
            }
            

        }
    }
}

#Preview {
    ContentView()
}
