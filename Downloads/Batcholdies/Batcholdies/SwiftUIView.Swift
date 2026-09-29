//
//  SwiftUIView.swift
//  Batcholdies
//
//  Created by Student on 15/09/26.
//

import SwiftUI

struct SwiftUIView: View {
   
        @State private var email = ""
        @State private var password = ""
    var body: some View {
        Text("Create Account")
            .bold()
            .foregroundStyle(.color)
            .font ( .system (size:30 , design : .serif))
        Text ("Create an account so you can explore all \n the existing jobs")
            .bold()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        
        HStack(spacing: 50){
            Image(systemName: "person.fill")
                .padding(.leading, 20)
            TextField("Email", text: $email)
            
        }
        .frame(width: 350, height: 60)
        .background(.color.opacity(0.1))
        .cornerRadius(15)
        
        HStack(spacing: 20){
            Image(systemName: "key.fill")
                .padding(.leading, 20)
            SecureField("password", text: $password)
        }
        .frame(width: 350, height: 60)
        .background(.color.opacity(0.1))
        
        .cornerRadius(15)
        Text("Sign in ")
            .frame(width: 350, height : 60)
            .background(.color)
            .foregroundStyle(.white)
            .bold()
            .cornerRadius(10)
            .shadow(radius: 20)
        
   
            NavigationLink(destination: SwiftUIView() ){
                
            
   
        
        Text ("Create New Account")
            .bold()
            .shadow (radius:20)
                
        }
        
        Text(" or continue with ")
            .foregroundStyle(.color)
            .bold()
        
        
        HStack{
            Image("Vector-2 2")
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius (15)
            Image("Vector-3 2")
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(15)
            
            Image("Vector-4 2")
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(15)
                .padding(.bottom)
                
        }
    }
    
    
    
}

#Preview {
LoginView()
}
        
        
            
