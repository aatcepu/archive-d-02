    
import SwiftUI
struct ContentView: View {
    @State private var number = ""
    @State private var result = ""
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter Number", text: $number)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            Button("Check Prime") {
                if let num = Int(number) {
                    result = isPrime(num) ? "Prime Number" : "Not Prime"
                }
            }
        }
        Text(result)
            .padding()
    }
    func isPrime(_ num: Int) -> Bool {
        if num < 2 { return false }
        for i in 2..<num {
            if num % i == 0 {
                return false
            }
        }
    return true
    }
}
#Preview{
    ContentView()
    }
