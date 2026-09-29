//
//  homepage.swift
//  P2
//
//  Created by Student on 09/09/26.
//

import SwiftUI

struct homepage: View {
    @State private var gotoswift:Bool=false
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("Courses")
                        .bold()
                        .font(.system(size: 30))
                        .padding(.trailing,200)
                    Button{
                        gotoswift = true
                        
                    }label:{
                        VStack{
                            Image("swift")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                            Text("Swift Programming")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                        }.frame(width:350,height:150)
                            .background(.orange.opacity(0.3))
                            .cornerRadius(15)
                    }
                    
                    Button{
                        gotoswift = true
                        
                    }label:{
                        VStack{
                            Image("pythone")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                            Text("Python Programming")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                        }.frame(width:350,height:150)
                            .background(.yellow.opacity(0.3))
                            .cornerRadius(15)
                    }
                    Button{
                        gotoswift = true
                        
                    }label:{
                        VStack{
                            Image("java")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                            Text("JAVA Programming")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                        }.frame(width:350,height:150)
                            .background(.purple.opacity(0.3))
                            .cornerRadius(15)
                    }                }
            }
        }
    }
}

#Preview {
    homepage()
}
