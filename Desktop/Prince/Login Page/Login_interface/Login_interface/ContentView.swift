//
//  ContentView.swift
//  Login_interface
//
//  Created by Student on 11/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
            ZStack{
                Circle()
                    .foregroundStyle(.color.opacity(0.2))
                    .frame(width: 400, height: 380)
                    .padding(.top, -370)
                //                .padding(.trailing, -300)
                VStack(spacing: 30) {
                    Image("img")
                        .resizable()
                        .scaledToFit()
                    Text("Fitness in one Click \n Go Ahead")
                        .font(.system(size: 30, design: .serif))
                        .bold()
                        .foregroundColor(.color)
                        .multilineTextAlignment(.center)
                    Text("Explore all the existing exercise based on your interest")
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 50){
                        NavigationLink(destination: LoginView()){
                            Text("Login")
                                .foregroundStyle(.white)
                                .frame(width: 100, height: 50)
                                .background(.color)
                                .cornerRadius(10)
                                .bold()
                        }
                        Text("Sign in")
                            .bold()
                    }
                }
                .padding(.bottom, 100)
            }
        }
    }
}
    #Preview {
        ContentView()
    }
