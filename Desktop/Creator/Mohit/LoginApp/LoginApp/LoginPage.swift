//
//  LoginPage.swift
//  LoginApp
//
//  Created by General on 30/06/26.
//

import SwiftUI

struct LoginPage: View {
    @State private var goto: Bool = false
    @State private var gotoLogin: Bool = false
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                VStack(spacing: 20){
                    Image(.login)
                        .resizable()
                        .scaledToFit()
                    Button{
                       
                    }label: {
                        Text("Get Started")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.white))
                            .frame(width: 350, height: 55)
                            .background(Color(.color1))
                            .cornerRadius(25)
                            .shadow(radius: 5)
                    }
                    Button{
                        gotoLogin = true
                    }label: {
                        Text("Login")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.color1))
                            .frame(width: 350, height: 55)
                            .background(Color(.white))
                            .cornerRadius(25)
                            .shadow(radius: 5)
                            .navigationDestination(isPresented: $gotoLogin){
                                CreateAccount()
                            }
                    }
                        
                    HStack{
                        Text("New around here?")
                            .font(.system(size: 15))
                            
                        Button{
                            goto = true
                        }label: {
                            Text("Sign in")
                                .font(.system(size: 15))
                                .foregroundStyle(.color1)
                                .navigationDestination(isPresented: $goto){
                                    ContentView()
                                }
                            
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    LoginPage()
}
