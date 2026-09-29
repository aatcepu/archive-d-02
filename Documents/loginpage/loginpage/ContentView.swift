//
//  ContentView.swift
//  LoginPageInterface
//
//  Created by Student on 10/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    var body: some View {
        NavigationStack{
            
            ZStack{
                Image("image1")
                    .resizable()
                    .scaledToFit()
                    .frame(width:1300, height: 1300)
                    .opacity(0.15)
                VStack{
                    
                    
                    Image("image1")
                        .resizable()
                        .scaledToFit()
                        .frame(width:300, height: 300)
                    
                    Text("Welcome!")
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                        .foregroundStyle(.red)
                    
                    
                    
                    
                    
                    HStack{
                        
                        Image(systemName: "person.2.fill")
                            .foregroundStyle(.red)
                            .padding()
                        TextField("Email or phone number",text: $email)
                           
                    } .frame(width: 350, height:60)
                        .background(Color(.systemGray6))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    
                    
                    
                    
                    HStack{
                        
                        Image(systemName: "key.fill")
                            .foregroundStyle(.red)
                            .padding()
                        TextField("password",text: $email)
                           
                    } .frame(width: 350, height:60)
                        .background(Color(.systemGray6))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    
                    
                    
                    
                    Button{
                        
                    }label: {
                        Text("Forgot password?")
                            .foregroundStyle(.red)
                            .fontWeight(.semibold)
                            .offset(x:100)
                        
                        
                      
                        }
                    
                    
                    
                    Button{
                        
                    }label: {
                        Text("Login")
                            .foregroundStyle(.white)
                            .font(.system(size: 20,weight:.semibold))
                            .frame(width: 300, height: 60)
                            .background(.red)
                            .cornerRadius(15)
                    }
                    
                    
                    
                    HStack{
                        Image("Google_Chrome_icon-icons.com_75711")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height:20)
                        Text("Sign in with Google")
                    }
                    .frame(width: 300, height: 40)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    
                    
                    
                    HStack{
                        Text("Don't have an account?")
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.secondaryLabel))
                        Button{
                            
                        }label:{
                            Text("Sign in")
                                .fontWeight(.semibold)
                                .foregroundStyle(.red)
                        }
                    }
              }
                
            }
        }
    }
}

#Preview {
    ContentView()
}

