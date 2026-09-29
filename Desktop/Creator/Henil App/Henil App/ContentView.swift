//
//  ContentView.swift
//  Henil App
//
//  Created by General on 24/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var GotoLogin:Bool = false
    @State private var GotoSignup:Bool = false
    var body: some View {
        VStack {
            NavigationStack{
                ScrollView{
                    
                    VStack(spacing: 20,){
                        Image(.login)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 330,height: 500)
                        Text("Here you will get experience of designing and development and understanding concepts of code and Algorithm")
                            .font(.system(size: 21))
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                            .foregroundStyle(.henil)
                            .multilineTextAlignment(.center)
                        
                        Button{
                            GotoLogin = true
                        }label: {
                            Text("Login")
                                .padding()
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 300,height: 50)
                                .background(.black)
                                .cornerRadius(20)
                        }
                        
                        Button{
                            GotoSignup = true
                        }label: {
                            Text("Sign Up")
                                .padding()
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 300,height: 50)
                                .background(.black)
                                .cornerRadius(20)
                        }
                        
                        .navigationDestination(isPresented: $GotoLogin )
                        {
                            LoginPage()
                            
                        }
                        
                        .navigationDestination(isPresented: $GotoSignup )
                        {
                            SignUp()
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
