 //
//  ContentView.swift
//  markscal
//
//  Created by Student on 22/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var Maths:String = ""
    @State private var physics:String = ""
    @State private var Chemistry:String = ""
    @State private var totalMarks:Double = 0.0
    @State private var percentage:Double = 0.0
    @State private var grade:String = ""
    var body: some View {
       
        ZStack
        {
            Image(systemName:"book.fill")
                .font(.system(size: 120))
                .foregroundStyle(.blue.opacity(0.05))
                .offset(x:100,y:-340)
            
            Image(systemName: "pencil.and.ruler.fill")
                .font(.system(size: 95))
                .foregroundStyle(.purple.opacity(0.05))
                .offset(x:-130,y:-250)
            
            Image(systemName: "graduationcap.fill")
                .font(.system(size: 140))
                .foregroundStyle(.cyan.opacity(0.05))
                .offset(x:100)
            
            Image(systemName:"checkmark.seal.fill")
                .font(.system(size: 100))
                .foregroundStyle(.green.opacity(0.05))
                .offset(x:-100,y:200)
            
            VStack{
                Text("Student grade calculator")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                   
                    .foregroundStyle(
                        LinearGradient(colors:
                                        [.yellow,.orange,.pink,.red,.blue], startPoint: .leading,endPoint:.trailing))
                       
                HStack{
                    TextField("Maths marks 0-100",text: $Maths)
                        .padding()
                    Image(systemName: "sum")
                        .padding()
                        .foregroundStyle(.gray)
                }.frame(width: 360,height: 60)
                    .background(.gray.opacity(0.15))
                        .cornerRadius(15)
                
                HStack{
                    TextField("Physics marks 0-100",text: $physics)
                        .padding()
                    Image(systemName: "atom")
                        .padding()
                        .foregroundStyle(.gray)
                }.frame(width: 360,height: 60)
                    .background(.gray.opacity(0.15))
                        .cornerRadius(15)
                
                HStack{
                    TextField("Chemistry marks 0-100",text: $Chemistry)
                        .padding()
                    Image(systemName: "flask")
                        .padding()
                        .foregroundStyle(.gray)
                }.frame(width: 360,height: 60)
                    .background(.gray.opacity(0.15))
                        .cornerRadius(15)
                
                Button{
                    var m = Double(Maths) ?? 0.0
                    var p = Double(physics) ?? 0.0
                    var c = Double(Chemistry) ?? 0.0
                    
                    totalMarks = m + p + c
                    percentage = (totalMarks/300) * 300
                    
                    if percentage >= 90
                    {
                        grade = "A+"
                    }
                    else if percentage >= 80
                    {
                        grade = "A"
                        
                    }
                    else if percentage >= 60
                    {
                        grade = "B"
                    }
                    else if percentage >= 50
                    {
                        grade = "C"
                    }
                    else if percentage >= 40
                    {
                        grade = "P"
                    }
                    
                    
                }label:{
                    Text("Calculate")
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(width: 300,height:60)
                        .background(.cyan)
                        .cornerRadius(15)
                }
                Divider()
                Text("Total Marks \(Int(totalMarks))/300")
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                
                Text("Percentage: \(percentage,specifier:"%2f")%")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.black))
                
                Text("Grade: \(grade)")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.green))
                
                                       
                                       
            }
            
        }
    }
}

#Preview {
    ContentView()
}
