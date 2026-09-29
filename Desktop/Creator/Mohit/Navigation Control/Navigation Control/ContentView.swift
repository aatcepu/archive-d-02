//
//  ContentView.swift
//  Navigation Control
//
//  Created by General on 30/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var moveToNext: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                Button{
                    moveToNext = true
                }label: {
                    Text("Go next page")
                        .fontWeight(.semibold)
                        .font(.system(size: 30))
                        .frame(width: 200, height: 50)
                        .background(.gray)
                        .cornerRadius(30)
                        .foregroundStyle(Color(.white))
                }
                .navigationDestination(isPresented: $moveToNext){
                    NextPage()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
