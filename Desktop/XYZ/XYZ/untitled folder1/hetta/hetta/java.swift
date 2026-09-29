//
//  java.swift
//  hetta
//
//  Created by Student on 26/09/26.
//

import SwiftUI

struct java: View {
    var body: some View {
        NavigationStack{
            VStack{
                List
                {
                    Section("Unit 1 - Basics of Java")
                    {
                        Text("1.1  Introduction to Java Programming")
                        Text("1.2 Constant Variables And Data Types")
                        Text("1.3 Control Flow And Functions")
                        Text("1.4 Error Handling")
                    }
                    Section("Unit 2 - JVM JDK JRE")
                    {
                        Text("2.1 Introduction JVM Architacture")
                        Text("2.2 Introduction JDK Architacture")
                        Text("2.3 Introduction JRE Architacture")
                    }
                    Section("Unit 3 - Projects")
                    {
                        Text("2.1 Build a TO-DO List app")
                        Text("2.2 Setup Project")
                        Text("2.3 Make E-Commerce App")
                    }
                }
                .navigationTitle("JAVA Programming")
            }
        }
    }
}

#Preview {
    java()
}
