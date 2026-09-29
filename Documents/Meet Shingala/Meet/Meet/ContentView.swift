import SwiftUI

struct ContentView: View {

    @State  var Username = ""
    @State  var password = ""

    var body: some View {

        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .foregroundColor(.indigo)
            HStack{
                Text("Username :")
                    .foregroundColor(.accentColor)
                TextField("Username",text: $Username)
                    .textFieldStyle(.roundedBorder)
            }
        
            HStack{
                Text("Password :")
                    .foregroundColor(.secondary)
                SecureField("Password",text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            
            Button("Login"){
                if(Username.contains("Admin") && password.contains("1234")){
                    print("login success full")
                }
                else{
                    print("invalid pssword and username")
                }
            }
            .buttonStyle(.borderedProminent)
        
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
