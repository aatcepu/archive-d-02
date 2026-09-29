//
//  ContentView.swift
//  MyApp
//
//  Created by General on 23/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    var body: some View {
        VStack {
            
               
            HStack{
                TextField("Email or Phone Number", text: $email)
                    .padding()
                Image(systemName: "envelope")
                    .foregroundStyle(.gray)
                    .padding()
                
                
            }
            .frame(width: 350, height: 55)
            .background(Color(.systemGray6))
            .cornerRadius(5)
            
            HStack{
                SecureField("Password", text: $password)
                    .padding()
                Image(systemName: "lock")
                    .foregroundStyle(.gray)
                    .padding()
            }
            .frame(width: 350,height: 55)
            .background(Color(.systemGray6))
            .cornerRadius(5)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
