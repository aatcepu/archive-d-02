//
//  ContentView.swift
//  Day1.2
//
//  Created by Student on 08/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("Gopal")
                    .foregroundColor(.green)
                    .bold()
                    .italic()
                    .underline()
                    .font(.system(size:50,design:.serif))
                    .background(.brown)
                
                Image("pexels-hana")
                    .resizable()
                    .scaledToFit()
                    .frame(width:400,
                           height:400)
                
               
                
   
                
                NavigationLink(destination: AboutView() ){
                 
                        
                        
                        
                        
                        
                        Text("About me")
                            .padding(.top,10)
                            .font(.system(size:30)).bold()
                            .foregroundStyle(.white)
                            .frame(width:300,height: 60)
                    
                            .background(.blue)
                            .cornerRadius(20)
                        
                    
                }
            }
        }
    }
}
#Preview {
        ContentView()
    }

