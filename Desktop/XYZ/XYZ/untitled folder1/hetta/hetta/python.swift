//
//  python.swift
//  hetta
//
//  Created by Student on 26/09/26.
//

import SwiftUI

struct python: View {
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Section("Unit 1 - Introduction to Python")
                    {
                        Text("1.1 Basics of Python")
                        Text("1.2 History of Python")
                        Text("1.3 DataTypes Variables & Functions")
                    }
                    Section("Unit 2 - projects")
                    {
                        Text("1.1 Build E-commers app")
                        Text("1.2 Setup Project")
                        Text("1.3 Make a report n Projects")
                    }
                }
                .navigationTitle("Python Programming")
            }
        }
    }
}

#Preview {
    python()
}
