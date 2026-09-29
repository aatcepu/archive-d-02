//
//  ContentView.swift
//  P2
//
//  Created by Student on 09/09/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                VStack{
                    // Logo / Image
                    Image("jj")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding(.top,250)
                    
                    // Login title
                    Text("Login")
                        .foregroundStyle(Color("color"))
                        .bold()
                        .italic()
                        .font(.system(
                            size: 35,
                            weight: .semibold,
                            design: .serif
                        ))
                }
                // Username
                HStack(spacing: 20) {
                    Image(systemName: "person.fill")
                        .foregroundStyle(.white)
                        .padding(.leading)
                    
                    TextField("username", text: $username)
                }
                .frame(width: 300, height: 55)
                .background(.black.opacity(0.3))
                .cornerRadius(15)
                
                
                // Password
                HStack(spacing: 20) {
                    Image(systemName: "key.fill")
                        .foregroundStyle(.white)
                        .padding(.leading)
                    
                    SecureField("password", text: $password)
                }
                .frame(width: 300, height: 55)
                .background(.black.opacity(0.3))
                .cornerRadius(15)
                
                // Forgot password
                Text("Forgot Password?")
                    .foregroundStyle(.red)
                    .bold()
                    .italic()
                    .padding(.leading, 140)
                    .underline()
                
                // Login button
                NavigationLink(destination: homepage()) {
                    Text("Login")
                        .foregroundStyle(.white)
                        .bold()
                        .frame(width: 300, height: 55)
                        .background(.black)
                        .cornerRadius(20)
                }
                
                // OR
                HStack {
                    Divider()
                        
                    
                    Text("or")
                        .foregroundStyle(.gray)
                    
                    Divider()
                }
                .frame(width: 300)
                
                // Google button
                HStack {
                    Image("google")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding()
                    
                    
                    Text("Continue with Google")
                        .padding(.trailing)
                }
                .frame(width: 300, height: 55)
                .background(.black)
                .foregroundStyle(.white)
                .bold()
                .cornerRadius(15)
                
                
                // Facebook button
                HStack {
                    Image("fb")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding()
                    
                    Text("Continue with Facebook")
                        .padding(.trailing)
                }
                .frame(width: 300, height: 55)
                .background(.black)
                .foregroundStyle(.white)
                .bold()
                .cornerRadius(15)
                                
                Spacer()
            }
            .padding(.bottom, 200)
        }
    }
}

#Preview {
    ContentView()
}
