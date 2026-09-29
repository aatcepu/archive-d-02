//
//  ContentView.swift
//  fooddeliver app
//
//  Created by Student on 07/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("Image 3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing:20){
                    Image("Image 2")
                        .resizable()
                        .scaledToFit()
                        .frame(width:70,height:70)
                    Text("Welcome \n to our store")
                        .foregroundStyle(.white)
                        .font(.system(size:35,weight:.semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("get your groceries as fast as one hour")
                        .foregroundStyle(.white)
                        .font(.system(size:15,weight:.semibold))
                    
                    NavigationLink(destination:signinview() ){
                        Text("Get started")
                            .foregroundStyle(.white)
                            .font(.system(size:15,weight:.semibold))
                            .frame(width:100,height:50)
                            .background(.green)
                            .cornerRadius(20)
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }.padding(.top,300)
            }
        }
    }
}
      
#Preview {
    ContentView()
}
