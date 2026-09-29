//
//  signup.swift
//  hetta
//
//  Created by Student on 26/09/26.
//

import SwiftUI

struct signup: View {
    @State private var email2 = ""
    @State private var pass1 = ""
    @State private var pass2 = ""
    @State private var email3 = "Het@gmail.com"
    var body: some View {
        NavigationStack{
            HStack{
                TextField("Enter E-mail or phone number", text: $email2)
                    .padding()
                Image(systemName: "envelope.fill")
                    .foregroundStyle(.gray)
                    .padding()
            }.frame(width: 350, height: 60)
                .background(.white)
                .cornerRadius(15)
                .shadow(radius: 10)
            HStack{
                SecureField("Set Password", text: $pass1)
                    .padding()
                Image(systemName: "key.fill")
                    .foregroundStyle(.gray)
                    .padding()
            }.frame(width: 350, height: 60)
                .background(.white)
                .cornerRadius(15)
                .shadow(radius: 10)
            HStack{
                SecureField("Conform Password", text: $pass2)
                    .padding()
                Image(systemName: "key.fill")
                    .foregroundStyle(.gray)
                    .padding()
            }.frame(width: 350, height: 60)
                .background(.white)
                .cornerRadius(15)
                .shadow(radius: 10)
            Button{
                if email2 == email3 && password == password1{
                    GoToHome = true
                }
                else{
                    print("Username and password is incorrect")
                }
                email = ""
                password = ""
            }label: {
                Text("login")
                    .font(.system(size:20))
                    .frame(width: 350, height: 60)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .background(.black)
                    .shadow(radius: 10)
                    .cornerRadius(15)
            }
        }
        
    }
}

#Preview {
    signup()
}
