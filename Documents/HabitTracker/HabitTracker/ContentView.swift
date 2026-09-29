//
//  ContentView.swift
//  HabitTracker
//
//  Created by General on 26/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var habit:String = ""
    var body: some View {
        ZStack{
            LinearGradient(colors: [.bgGradiet1, .bgGradient2], startPoint: .topLeading, endPoint: .trailing)
                .ignoresSafeArea()
                .opacity(0.35)
            VStack (spacing:20){
                Text("Habit Tracker")
                    .font(.system(size: 40, weight: .semibold))
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                
                HStack{
                    TextField("Enter a habit", text: $habit)
                        .padding()
                    Text("|")
                        .font(.system(size: 30))
                        .offset(y: -2)
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                }
                .frame(width: 350, height: 55)
                .background()
                .cornerRadius(5)
                .padding(.bottom, 15)
                
                Divider()
                    .frame(height: 1.5)
                    .overlay(Color.black)
                    .padding(.bottom, 15)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
