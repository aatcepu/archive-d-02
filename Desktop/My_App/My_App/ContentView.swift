//
//  ContentView.swift
//  My_App
//
//  Created by Student on 08/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var Gotonextpage:Bool = false
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        NavigationStack{
            
        VStack{
            Text("🎼Music Forest🎼")
                .font(.system(size: 30,weight: .semibold,design: .serif))
                .padding(.bottom, 50)
                .italic()
                .foregroundStyle(.green)

            Image("AppIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 300,height:300)
           
            
            HStack{
                Image(systemName: "person.fill")
                    .padding(.leading, 20)
                TextField("Username",text:$username)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .frame(width:300,height:60)
            .background(.gray.opacity(0.3))
            .cornerRadius(15)
            HStack{
                Image(systemName: "key.fill")
                    .padding(.leading, 20)
                SecureField("Password",text:$password)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .frame(width:300,height:60)
            .background(.gray.opacity(0.3))
            .cornerRadius(15)
            
            Text("Forgot Password?")
                .italic()
                .underline()
                
            
            Button{
                Gotonextpage=true //Gotonextpage.toggle() also works
            }label: {
                NavigationLink(destination: NextPage()){
                    Text("Login")
                        .font(.system(size: 30))
                        .frame(width:300,height:60)
                        .fontWeight(.bold)
                        .background(.color)
                        .cornerRadius(15)
                        .foregroundStyle(.white)
                }
            }
            HStack{
               
                Text("Or")
                    .foregroundStyle(.gray)
                
                
            }
            Image("b")
            Text("Continue with Google")
                .font(.system(size: 30))
                .frame(width:300,height:60)
                .fontWeight(.bold)
                .background(.color)
                .cornerRadius(15)
                .foregroundStyle(.white)
            Image("c")
            Text("Continue with Facebook")
                .font(.system(size: 30))
                .frame(width:300,height:60)
                .fontWeight(.bold)
                .background(.color)
                .cornerRadius(15)
                .foregroundStyle(.white)
            
            
            HStack{
                Image("icon")
            }
        }
            
        .navigationDestination(isPresented: $Gotonextpage ){
            NextPage()
        }
    }
        .padding()
    }
}

#Preview {
    ContentView()
}
