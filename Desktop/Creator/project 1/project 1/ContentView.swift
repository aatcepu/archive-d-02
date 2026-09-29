//
//  ContentView.swift
//  project 1
//
//  Created by Henil Thakkar on 26/06/26.
//

import SwiftUI

struct ContentView: View {
    @State var maths = ""
    @State private var physics = ""
    @State private var chem = ""
    @State private var totalMarks:Double = 0.0
    @State private var percentage:Double = 0.0
    @State private var grade:String = ""
    var body: some View {
        ZStack {
            
            Image(systemName: "graduationcap.fill")
                .font(.system(size: 120))
                .foregroundStyle(.blue.opacity(0.08))
                .offset(x: 130,y: 300)
            
            Image(systemName: "book.fill")
                .font(.system(size: 120))
                .foregroundStyle(.green.opacity(0.1))
                .offset(x: 130,y:-300 )
            
            Image(systemName: "pencil.and.ruler.fill")
                .font(.system(size: 120))
                .foregroundStyle(.red.opacity(0.1))
                .offset(x: 130,y:-3)
            
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 120))
                .foregroundStyle(.black.opacity(0.1))
                .offset(x: -100,y:300 )
            
            Image(systemName: "doc.text.fill")
                .font(.system(size: 120))
                .foregroundStyle(.gray.opacity(0.1))
                .offset(x: -100,y:-300 )
            
            VStack(spacing: 20){
                
                Text("Student grade calculator")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .foregroundStyle(LinearGradient (colors: [.cyan, .green, .blue], startPoint: .leading, endPoint: .trailing))
                    .padding()
                
                HStack{
                    
                    TextField("Maths marks 0-100",text: $maths)
                        .padding()
                    Image(systemName: "sum")
                        .foregroundStyle(.gray)
                        .padding()
                        .keyboardType(.numberPad)
                }
                .frame(width: 360,height: 55)
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .shadow(radius: 9)
                
                HStack{
                    
                    TextField("Chemistry marks 0-100",text: $chem)
                        .padding()
                    Image(systemName: "flask")
                        .foregroundStyle(.gray)
                        .padding()
                        .keyboardType(.numberPad)
                }
                .frame(width: 360,height: 55)
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .shadow(radius: 9)
                
                
                HStack{
                    
                    TextField("Physics marks 0-100",text: $physics)
                        .padding()
                    Image(systemName: "atom")
                        .foregroundStyle(.gray)
                        .padding()
                        .keyboardType(.numberPad)
                }
                .frame(width: 360,height: 55)
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .shadow(radius: 9)
                
                
                
                Button{
                    
                    let m = Double(maths) ?? 0.0
                    let p = Double(physics) ?? 0.0
                    let c = Double(chem) ?? 0.0
                    
                    totalMarks = m + p + c
                    
                    percentage = (totalMarks/300) * 100
                    
                    
                    if percentage >= 90 {
                        
                        grade = "A+"
                    }
                    else if percentage >= 80
                    {
                        grade = "A"
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
                        grade = "F"
                    }
                    
                    maths = ""
                    chem = ""
                    physics = ""
                }label: {
                    Text("calculate")
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                        .frame(width: 300, height: 55)
                        .background(LinearGradient (colors: [.cyan, .green, .blue], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(15)
                        .shadow(radius: 9)
                }
                
                Divider()
                
                Text("Total Marks:\(Int(totalMarks))/300")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                Text("Percentage: \(percentage,specifier: "%.2f")")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                Text("Grade: \(grade)")
                    .font(.system(size: 21))
                    .fontWeight(.semibold)
                    .foregroundStyle(.cyan)
                
                
                
            }
            
        }
                
                
            }
            
            
        }


#Preview {
    ContentView()
}
