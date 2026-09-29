import SwiftUI

struct ContentView: View {
    @State private var value: String=""
    var body: some View {
        VStack {
            Text("Instagram")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(colors: [.yellow, .orange, .pink, .purple ,.blue], startPoint:.leading, endPoint: .trailing)
                )
            
            
        }
        HStack{
            
            
            Image(systemName: "infinity")
                .font(.system(size: 18,weight:  .bold ))
                .foregroundStyle(LinearGradient(colors: [.pink,.purple,.blue,.cyan], startPoint: .leading, endPoint: .trailing))
            
            
            Text("meta")
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(colors: [.red, .orange , .pink , .purple], startPoint:.leading, endPoint: .trailing)
                )
        }
        
        Button {
            print(" welcome to the instagram ")
            
        }label: {
            Text("click here")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .frame(width: 200 , height: 60)
                .foregroundStyle(.white)
                .background(.cyan)
                .cornerRadius(15)
        }
        HStack{
            Image(systemName: "envelope.fill")
                .padding()
                .foregroundStyle(.gray)
            TextField("Email", text: $value)
            
    
        }
        .frame(width: 200 , height: 40)
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

#Preview {
    ContentView()
}
