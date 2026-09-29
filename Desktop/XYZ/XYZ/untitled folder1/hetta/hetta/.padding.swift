//
//  HomePage.swift
//  hetta
//
//  Created by Student on 26/09/26.
//

import SwiftUI

struct HomePage: View {
    @State private var GoToSwift:Bool = false
    @State private var GoToJAva:Bool = false
    @State private var GoToPython:Bool = false
    @State private var GoToHTML:Bool = false

    var body: some View {
        NavigationStack
        {
            
            ScrollView{
                Button{
                    GoToSwift = true
                }label:{
                    VStack(){
                        Image(.swift)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("Swift Programming")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    }.frame(width: 350, height: 150)
                        .background(.orange.opacity(0.30))
                        .cornerRadius(20)
                }
                Button{
                    GoToJAva = true
                }label:{
                    VStack(){
                        Image(.icons8Java94)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("java Programming")
                            
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    }.frame(width: 350, height: 150)
                        .background(.purple.opacity(0.10))
                        .cornerRadius(20)
                }
                Button{
                    GoToPython = true
                }label:{
                    VStack(){
                        Image(.python)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("Python Programming")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                            
                    }.frame(width: 350, height: 150)
                        .background(.yellow.opacity(0.30))
                        .cornerRadius(20)
                }
                Button{
                    GoToHTML = true
                }label:{
                    VStack(){
                        Image(.html)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("HTML Programming")
                            
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    }.frame(width: 350, height: 150)
                        .background(.black.opacity(0.15))
                        .cornerRadius(20)
                }
                .navigationTitle("Subjects")
            }
            .navigationDestination(isPresented:$GoToSwift)
            {
                swiftprog()
            }
            .navigationDestination(isPresented:$GoToJAva)
            {
                java()
            }
            .navigationDestination(isPresented:$GoToPython)
            {
                python()
            }
            .navigationDestination(isPresented:$GoToHTML)
            {
                html()
            }
        }
    }
}

#Preview {
    HomePage()
}
