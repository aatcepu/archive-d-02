//
//  LoginView.swift
//  Login_interface
//
//  Created by Student on 11/09/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack(spacing: 20){
            Text("Login Here")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(.color)
            Text("Welcome back\n we've missed you!")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .bold()
            HStack{
                Image(systemName: "person.fill")
                    .padding(.leading, 10)
                TextField("Email", text: $email)
                
            }
            .frame(width: 350, height: 60)
            .background(.color.opacity(0.1))
            .cornerRadius(15)
            
                HStack{
                    Image(systemName: "key.fill")
                        .padding(.leading, 10)
                SecureField("password", text: $password)
            }
                .frame(width: 350, height: 60)
                .background(.color.opacity(0.1))
                .cornerRadius(15)
            Text("Forgot Password?")
                .foregroundStyle(.color)
                .bold()
                .padding(.leading, 200)
            Text("Login")
                .frame(width: 350, height: 50)
                .background(.color)
                .foregroundStyle(.white)
                .cornerRadius(10)
                .shadow(radius: 20)
                
        }
        .padding(.bottom, 300)
    }
}

#Preview {
    LoginView()
}
