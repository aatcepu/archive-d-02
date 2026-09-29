
 //
//  ContentView.swift
//  new
//
//  Created by Student on 24/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
            ZStack {
                Image("onbording-2 3")
                    .resizable()
                    .scaledToFit()
                    .frame(width:410)
                    .ignoresSafeArea()
                
                VStack{
                    Image("Group 3")
                        .resizable()
                        .scaledToFit()
                        .frame(width:68)
                    
                    Text("welcome \n to our store")
                        .foregroundStyle(.white)
                        .font(.system(size:50,weight:
                                .semibold))
                        .multilineTextAlignment(.center)
                    Text("Get your groceries in as fast as one hour")
                        .foregroundStyle(.white
                            .opacity(0.7))
                    NavigationLink(destination:SwiftUIView() ){
                        
                        Text("Get Started")
                            .foregroundStyle(.white)
                            .frame(width:330,height:55)
                            .background(.color)
                        .cornerRadius(20)            }
                    
                }
                .padding(.top,380)
                               
            }
        }
    }
}
#Preview {
    ContentView()
}
