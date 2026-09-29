//
//  ContentView.swift
//  Yogini
//
//  Created by General on 12/06/26.
//

import SwiftUI

struct ContentView: View {
        @State private var email:String = ""
        @State private var password:String=""
    var body: some View {
        NavigationStack{
            
            VStack{
                
                
                
                ScrollView{
                    
                    Image("Doctors-cuate")
                        .resizable()
                        .scaledToFit()
                        .frame(width:300,height:300)
                    Text("welcome")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    TextField("Email:",text: $email)
                        .padding()
                        .frame(width:300,height:40)
                        .background(Color.gray.opacity(0.3))
                    cornerRadius(15)
                    SecureField("Password" ,text:$password)
                        .padding()
                        .frame(width:360 , height: 55)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(15)
                    
                    HStack{
                        Spacer()
                        Text("Forget password: ")
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                Button{
                }label:{
                    Text("Login")
                        .fontWeight(.semibold)
                        .frame(width: 300,height:55)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(15)
                }
                HStack{
                    Button{
                        
                        

                    }label:{
                        Image(.unknown)
                            .resizable()
                            .scaledToFit()
                        
                        
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
