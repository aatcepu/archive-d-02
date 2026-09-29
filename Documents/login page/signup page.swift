//
//  signup page.swift
//  login page
//
//  Created by Student on 22/07/26.
//

import SwiftUI

struct signup_page: View {
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Image(.educationRafiki)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    
                    Text("Signup Page")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "Person")
                            .padding()
                            .foregroundStyle(.gray)
                        TextField("First Name", text: $firstname)
                            .padding()
                    }.frame(width: 350, height: 60)
                     .background(Color.gray.opacity(0.2))
                     .cornerRadius(15)
                        
                    HStack{
                        Image(systemName: "person")
                            .padding()
                            .foregroundStyle(.gray)
                        
                        TextField("last Name", text: $lastname)
                            .padding()
                    }.frame(width:350, height: 60)
                     .background(Color.gray.opacity(0.2))
                     .cornerRadius(15)
                    
                    HStack{
                        Image(systemName: "envelope")
                            .padding()
                            .foregroundStyle(.gray)
                        TextField("Email", text:$email)
                            .padding()
                    } .frame(width: 350,height: 60)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(15)
                    
                    Button{
                        
                    }label: {
                        Text("Sign Up")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                            .frame(width:100, height: 60)
                            .background(.blue)
                            .cornerRadius(15)
                            .fontWeight(.semibold)
                    }
                            
                            
                        }
                    }
                }
            }
        }
     
    


#Preview {
    signup_page()
}
