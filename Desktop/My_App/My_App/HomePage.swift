//
//  HomePage.swift
//  My_App
//
//  Created by Student on 09/09/26.
//

import SwiftUI

struct HomePage: View {
    @State private var gotoswift:Bool = false
    var body: some View {
        NavigationLink{
            ScrollView{
                Vstack(spacing:15){
                    Button{
                        gotoswift=true
                    }label:{
                        VStack{
                            Image(.homepage)
                                .resizable()
                                .scaledToFit()
                                .frame(width:60,height:60)
                            Text("")
                        }
                    }
                }
            }
        }    }
}

#Preview {
    HomePage()
}
