//
//  ContentView.swift
//  LoginApp
//
//  Created by General on 30/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    var body: some View {
        
        NavigationStack{
            
                
                VStack(spacing: 20){
                    
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        
                    
                    Button{
                        
                    }label: {
                        HStack(spacing: 37){
                            Image(.apple)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Sign in with Apple")
                                .font(.system(size: 22))
                                .foregroundStyle(.black)
                                .fontWeight(.light)
                            
                            
                        }.frame(width: 350, height: 55)
                            .background(Color(.systemGray6))
                            .cornerRadius(25)
                            
                            .shadow(radius: 5)
                    }
                    
                    Button{
                        
                    }label: {
                        HStack(spacing: 30){
                            Image(.google)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("Sign in with Google")
                                .font(.system(size: 22))
                                .foregroundStyle(.color1)
                                .fontWeight(.light)
                            
                            
                        }.frame(width: 350, height: 55)
                            .background(Color(.systemGray6))
                            .cornerRadius(25)
                            .shadow(radius: 5)
                    }
                    
                    Text("or get a link emailed to you")
                        .foregroundStyle(.gray)
                    
                    
                    TextField("Work email address", text: $email)
                        .padding()
                        .frame(width: 350, height: 55)
                        .background(Color(.systemGray6))
                        .cornerRadius(25)
                        .shadow(radius: 5)
                    
                    
                    Button{
                        
                    }label: {
                        Text("Email me signup link")
                    }.frame(width: 350, height: 55)
                        .background(Color(.color1))
                        .cornerRadius(25)
                        .shadow(radius: 5)
                        .font(.system(size: 22))
                        .foregroundStyle(.white)
                        .fontWeight(.light)
                }
                .padding()
            Divider()
            
                .padding()
                .padding()
            Text("You are completely safe")
                .offset(x: 0,y: 20)
            
            Button{
                
            }label: {
                Text("Terms and Conditions")
                    .offset(x: 0,y: 20)
                    .foregroundStyle(.color1)
            }
        }
    }
}

#Preview {
    ContentView()
}
