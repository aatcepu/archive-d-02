//
//  LoginPage.swift
//  HenilApp
//
//  Created by General on 24/06/26.
//

import SwiftUI

struct SignUp: View {
    @State private var FirstName: String = ""
    @State private var Lastname: String = ""
    @State private var password: String = ""
    @State private var ConfirmPassword: String = ""
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack(spacing: 30){
                    
                    
                    Text("Create an Account")
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
                    TextField("First Name", text: $FirstName)
                        .padding()
                    }.frame(width: 350, height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                    
                    
                    HStack{
                        
                        Image(systemName: "person")
                            .padding()
                            .foregroundStyle(.gray)
                        Text("|")
                            .foregroundStyle(.gray)
                    TextField("Last Name", text: $Lastname)
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
                    
                    
                    HStack{
                        
                        Image(systemName: "lock")
                            .padding()
                            .foregroundStyle(.gray)
                        Text("|")
                            .foregroundStyle(.gray)
                    SecureField("Confirm Password", text: $ConfirmPassword)
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
                    
                      
                    HStack{
                        
                        Text("Already have an account!")
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        
                        Button{
                            
                        }label: {
                            Text("Login")
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
    SignUp()
}
