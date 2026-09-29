//
//  ContentView.swift
//  login page
//
//  Created by Student on 21/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var changePage: Bool = false
    @State private var username:String = "Shubham@gmail.com"
    @State private var pass:String = "12345"
    @State private var showPopup:Bool = false
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                
                VStack{
                    
                    Image(.educationRafiki)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    
                    
                    Text("Login page")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "envelope")
                            .padding()
                            .foregroundColor(.gray)
                        TextField("Email or phone number",text: $email)
                            .padding()
                    }
                        .frame(width: 350,height: 60)
                        .background(Color.gray
                        .opacity(0.2))
                        .cornerRadius(15)
                    HStack{
                        
                        
                        Image(systemName:"key")
                            .padding()
                        TextField("password",text: $password)
                            .padding()
                    }
                        .frame(width: 350,height: 60)
                    .background(Color.gray
                    .opacity(0.2))
                    .cornerRadius(15)
                    
                    
                    Button{
                     
                    
                        if email == username && password == pass{
                            changePage=true
    
                        }
                        else
                        {
                            showPopup = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now()+2)
                            {
                                showPopup = false
                            }
                        }
                    }label:{
                        Text("Login")
                            .font(.system(size:20))
                            .fontWeight(.bold)
                            .frame(width: 200,height: 40)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .padding()
                    }
                        
                        HStack{
                            Text("Don't have an account")
                            
                            Button{
                                
                            }label:{
                                Text("Sign Up")
                            }
                            
                            
                            
                                
                            
                            
                                
                            
                        }
                    }
                .alert("Login Error", isPresented: $showPopup){
                    
                }message:{
                    Text("Invalid username and password")
                }
                .navigationDestination(isPresented: $changePage){
                    NextPage()
                }
                    
                    
                    
                
            }
            
            
        }
    }
    
}
#Preview {
    ContentView()
}
