
import SwiftUI

struct ContentView: View{
    @State private var display: String=""
    @State private var value: String=""
    var body: some View{
        VStack{
            Text("Swift Coding Club")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundStyle(LinearGradient(colors:
                                                    [.orange, .yellow, .red, .purple, .blue],
                                                startPoint: .leading, endPoint: .trailing))
            Image(systemName: "person.crop.circle")
                .font(.system(size: 100))
                .foregroundStyle(
                    LinearGradient(colors:
                                    [.orange, .yellow, .red,.purple, .blue],
                                   startPoint: .leading, endPoint: .trailing)
                )
            
            Button{

                display = value
                value = ""
                
            }label: {
                Text("Click Me")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(width: 350, height: 60)

                    .cornerRadius(30)
                    .background(
                        LinearGradient(colors:
                                        [.blue, .red, .purple],
                                       startPoint: .leading, endPoint: .trailing)
                    )
                    
                        
            }
            TextField ("Enter value:", text: $value)
                .padding()
                .frame(width: 350, height: 60)
            
                .background(Color(.systemGray6))
                .cornerRadius(15)
            Text("You enterd the value: \(display)")
                .font(.system(size: 20))
                .fontWeight(.bold)
            
            

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
