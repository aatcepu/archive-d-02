//
//  ContentView.swift
//  App
//
//  Created by General on 29/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String=""
    @State private var password: String=""
    var body: some View {
        ZStack {
            Image(.image1)
                .resizable()
                .scaledToFill()
                .frame(width: 600, height: 600)
                .opacity(0.35)
            VStack {
                HStack{
                    Image(systemName:"envelope")
                        .padding()
                        .foregroundStyle(.gray)
                    TextField("Your Email", text: $email)
                }.frame(width: 350,height: 55)
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                    .shadow(radius: 20)
                
                HStack{
                    Image(systemName: "key")
                        .padding()
                        .foregroundStyle(.gray)
                    TextField("Password", text: $password)
                }.frame(width: 350,height: 55)
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                    .shadow(radius: 20)
                
            }
        
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
