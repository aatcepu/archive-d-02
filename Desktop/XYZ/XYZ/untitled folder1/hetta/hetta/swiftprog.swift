//
//  swiftprog.swift
//  hetta
//
//  Created by Student on 26/09/26.
//

import SwiftUI

struct swiftprog: View {
    var body: some View
    {
        NavigationStack{
            VStack{
                List
                {
                    Section("Unit 1 - Swift Basics")
                    {
                        Text("1.1  Introduction to Swift Programming")
                        Text("1.2 Constant Variables And Data Types")
                        Text("1.3 Control Flow And fFnctions")
                        Text("1.4 Error Handling")
                    }
                    Section("Unit 2 - Basics Of Swift UI")
                    {
                        Text("2.1 Introduction To Swift UI")
                        Text("2.2 Building a User Interface")
                        Text("2.3 What is MVVM Architacture")
                    }
                    Section("Unit 3 - Projects")
                    {
                        Text("2.1 Introduction To X-Code")
                        Text("2.2 Setup Project")
                        Text("2.3 Make E-Commerce App")
                    }

                    
                }
            }
            .navigationTitle("Swift programming")
        }
        
    }
}

#Preview {
    swiftprog()
}
