import SwiftUI
    
struct ContentView: View{
    @State private var bgColor = Color.white
    var body: some View {
        VStack(spacing: 20) {
            Text("Choose Theme Color")
                .font(.title)
    
    HStack {
        Button("Red") { bgColor = .red }
        Button("Green") { bgColor = .green }
        Button("Blue") { bgColor = .blue }
                }
        .padding()
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor.opacity(0.3))
        }
        }
