//
//  CreateAccount.swift
//  LoginApp
//
//  Created by Student on 01/07/26.
//

import SwiftUI

struct CreateAccount: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    var body: some View {
        NavigationStack{
            
            VStack(spacing: 20){
                
                Text("Login")
                    .font(.system(size: 35))
                    .fontWeight(.semibold)
                
                HStack{
                    
                    Image(systemName: "person.fill")
                        .font(.system(size: 22))
                        .foregroundStyle(.gray)
                        .padding()
                    
                    TextField("Email or phone number", text: $email)
                        .padding()
                    
                }.frame(width: 350, height: 60)
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                    .shadow(radius: 5)
                
                HStack{
                    
                    Image(systemName: "key.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.gray)
                        .padding()
                    
                    if showPassword {
                        TextField("Password", text: $password)
                            .padding()
                    }
                    else{
                        SecureField("Password", text: $password)
                            .padding()
                    }
                    
                    Button{
                        showPassword.toggle()
                    }label: {
                        Image(systemName: showPassword ? "eye.fill" : "eye")
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                            .padding()
                    }
                }.frame(width: 350, height: 60)
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                    .shadow(radius: 5)
                
                Button{
                    
                }label: {
                    Text("Login")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 60)
                        .background(.color1)
                        .cornerRadius(25)
                }
                
                Text("Your login Credentials are secure with our platform and encrypted and never shared")
                    .multilineTextAlignment(.center)
                    .padding()
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                
            }.navigationTitle("Welcome Hi..!")
            
            
        }
    }
}

#Preview {
    CreateAccount()
}
