//
//  ContentView.swift
//  hetta
//
//  Created by Student on 25/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var email:String = ""
    @State private var password = ""
    @State private var GoToHome:Bool = false
    @State private var email1 = "Heta1@gmail.com"
    @State private var password1 = "Het@123"
    var body: some View {
        NavigationStack{
            
            ZStack{
                Image(.html)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .offset(x:100, y:-300)
                    .opacity(0.30)
                Image(.c)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 200)
                    .offset(x: 90, y:300)
                    .opacity(0.30)
                Image(.s1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 200)
                    .offset(x: -100, y: -150)
                    .opacity(0.10)
                Image(.py)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 200)
                    .offset(x:-100, y: 170)
                    .opacity(0.30)
                
                VStack(spacing:15){
                    Text("Programmer's Corner")
                        .font(.system(size: 35))
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .shadow(radius: 25)
                    
                    HStack{
                        TextField("E-mail or phone number", text: $email)
                            .padding()
                        Image(systemName: "envelope.fill")
                            .foregroundStyle(.gray)
                            .padding()
                    }.frame(width: 350, height: 60)
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                    HStack{
                        SecureField("Password", text: $password)
                            .padding()
                        Image(systemName: "key.fill")
                            .foregroundStyle(.gray)
                            .padding()
                    }.frame(width: 350, height: 60)
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                    Button{
                        if email == email1 && password == password1{
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
                    HStack{
                        Text("Don't have an account?")
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        Button{
                        }label: {
                            Text("signup")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        }
                    }
                    
                }
            }
            .navigationDestination(isPresented:$GoToHome)
            {
                HomePage()
            }
        }
    }
}
#Preview {
        ContentView()
    }

