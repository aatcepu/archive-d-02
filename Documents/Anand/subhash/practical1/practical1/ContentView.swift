import SwiftUI

@main
struct HelloApp: App {
  var body: some Scene {
   WindowGroup {
ContentView()
  }
 }
}
struct ContentView: View {
  var body: some View {
   ZStack {
    Color.blue.opacity(0.2)
   .ignoresSafeArea()
       
VStack(spacing: 20) {
 Image(systemName: "hand.wave.fill")
  .font(.system(size: 60))
  .foregroundColor(.blue)
    
Text("Hello, iOS Students!")
  .font(.largeTitle)
  .fontWeight(.bold)
Text("Welcome to SwiftUI Development")
  .font(.title3)
  .foregroundColor(.gray)
    }
  }
 }
}
