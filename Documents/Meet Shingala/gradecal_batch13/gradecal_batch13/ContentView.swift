//
//  ContentView.swift
//  gradecal_batch13
//
//  Created by Student on 08/08/26.
//

import SwiftUI

struct ContentView: View {
    @State private var Maths: String = ""
    @State private var Chemistry: String = ""
    @State private var Physcis: String = ""
    @State private var total: Double = 0.0
    @State private var percentage: Double = 0.0
    @State private var grade: String = ""
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            Image(systemName: "flag.filled.and.flag.crossed")
                .font(.system(size: 70))
                .foregroundStyle(.mint.opacity(0.30))
                .offset(x: 120, y: -360)
            
            Image(systemName: "pc")
                .font(.system(size: 70))
                .foregroundStyle(.mint.opacity(0.30))
                .offset(x: -120, y: -360)
            
            Image(systemName: "graduationcap.fill")
                .font(.system(size: 70))
                .foregroundStyle(.mint.opacity(0.30))
                .offset(x: 140, y: 360)
            
            VStack(spacing: 15) {
                Text("Student Grade calculator")
                    .font(.system(size: 32))
                    .fontWeight(.semibold)
                    .foregroundStyle(LinearGradient(colors: [.blue, .pink, .mint, .purple, .accentColor], startPoint: .leading, endPoint: .trailing))
                
                HStack {
                    TextField("Enter Maths marks 0-100", text: $Maths)
                    Image(systemName: "pi")
                        .padding()
                        .foregroundStyle(.gray)
                }
                .frame(width: 350, height: 60)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                
                HStack {
                    TextField("Enter Chemistry marks 0-100", text: $Chemistry)
                    Image(systemName: "testtube.2")
                        .padding()
                        .foregroundStyle(.gray)
                }
                .frame(width: 350, height: 60)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                
                HStack {
                    TextField("Enter Physics marks 0-100", text: $Physcis)
                    Image(systemName: "atom")
                        .padding()
                        .foregroundStyle(.gray)
                }
                .frame(width: 350, height: 60)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                
                Button {
                    let m = Double(Maths) ?? 0.0
                    let c = Double(Chemistry) ?? 0.0
                    let p = Double(Physcis) ?? 0.0
                    
                    total = m + p + c
                    percentage = total / 3.0
                    
                    if percentage >= 90.0 {
                        grade = "A+"
                    } else if percentage >= 80.0 {
                        grade = "A"
                    } else if percentage >= 70.0 {
                        grade = "B"
                    } else if percentage >= 60.0 {
                        grade = "C"
                    } else if percentage >= 50.0 {
                        grade = "D"
                    } else {
                        grade = "F"
                    }
                } label: {
                    Text("Calculate")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(20)
                }
                
                if total > 0.0 {
                    VStack(spacing: 8) {
                        Text("Total Marks: \(total, specifier: "%.2f")")
                        Text("Percentage: \(percentage, specifier: "%.2f")%")
                        Text("Grade: \(grade)")
                    }
                    .font(.headline)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

