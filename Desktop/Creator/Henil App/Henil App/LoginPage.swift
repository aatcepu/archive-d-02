//
//  LoginPage.swift
//  HenilApp
//
//  Created by General on 24/06/26.
//

import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack(spacing: 30){
                    
                    
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(height: 80)
                    
                    Text("Please Login to Continue")
                        .foregroundStyle(.gray)
                        
                    HStack{
                        
                        Image(systemName: "person")
                            .padding()
                            .foregroundStyle(.gray)
                        Text("|")
                            .foregroundStyle(.gray)
                    TextField("Email or Phone Number", text: $email)
                        .padding()
                    }.frame(width: 350, height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                    
                    
                    HStack{
                        
                        Image(systemName: "lock")
                            .padding()
                            .foregroundStyle(.gray)
                        Text("|")
                            .foregroundStyle(.gray)
                    SecureField("Password", text: $password)
                        .padding()
                    }.frame(width: 350, height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                    
                    
                    Button{
                                            
                            } label: {
                                Text("Login")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                    .frame(width: 125, height: 55)
                                    .background(.henil )
                                    .cornerRadius(15)
                        }
                    
                    Text("or continue with")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .padding()
                    
                    HStack {
                        Button{
                            
                        }label: {
                            Image(.image2)
                                .resizable()
                                .frame(width: 40,height: 40)
                                .padding()
                        }
                            Button{
                                
                            }label: {
                                Image(.image)
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                    .padding()
                            }
                                Button{
                                    
                                }label: {
                                    Image(.image1)
                                        .resizable()
                                        .frame(width: 40,height: 40)
                                        .padding()
                                    
                                    
                        }
                    }
                    
                    HStack{
                        
                        Text("Don't have ab account")
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        
                        Button{
                            
                        }label: {
                            Text("SignUp")
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
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
