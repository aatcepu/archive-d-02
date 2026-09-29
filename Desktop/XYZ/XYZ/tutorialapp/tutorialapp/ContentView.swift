//
//  ContentView.swift
//  tutorialapp
//
//  Created by Student on 23/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack(spacing:20)
                {
                    Button{
                    }label: {
                        VStack{
                            Image(.swift)
                                .resizable()
                                .scaledToFit()
                                .frame(width:60,height:60)
                                Text("swift programming")
                            
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
