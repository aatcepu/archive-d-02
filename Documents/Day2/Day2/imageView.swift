//
//  imageView.swift
//  Day2
//
//  Created by Student on 10/07/26.
//

import SwiftUI

struct imageView: View {
    var body: some View {
        Image("images-1")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white,lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    imageView()
}
