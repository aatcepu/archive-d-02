import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           Text("New Project")
                .bold()
                .italic()
                .underline()
                .foregroundStyle(.red)
                .font(.system(size:50, design:
                        .serif))
                .background(.black.opacity(1))
                .frame(width:400, height:40)
                .padding(.bottom,600)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
