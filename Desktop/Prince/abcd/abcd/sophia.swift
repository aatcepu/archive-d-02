//
//  sophia.swift
//  abcd
//
//  Created by Student on 10/09/26.
//

import SwiftUI

struct sophia: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack(spacing: 25){
            Text("Login Here")
                .foregroundStyle(.color)
                .bold()
                .font(.system(size: 35, design: .serif))
            
            Text("Welcome back, you've\nbeen missed")
                .multilineTextAlignment(.center)
                .bold()
            
            TextField("Email" , text: $email)
                .frame(width: 350, height:50)
                .background(.color.opacity(0.1))
                .cornerRadius(10)
            SecureField("Password", text: $password)
            
                .frame(width: 350, height:50)
                .background(.color.opacity(0.1))
                .cornerRadius(10)
            
            Text("Get Started")
                .frame(width: 300, height: 55)
                .background(.color)
                .foregroundStyle(.white)
                .cornerRadius(10)
            
        }
    }
}

#Preview {
    sophia()
}
