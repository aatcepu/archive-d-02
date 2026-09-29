import SwiftUI

struct ContentView: View {
    @State private var email:String=""
    @State private var password:String=""
    var body: some View {
        
       
        
        NavigationStack{
            ScrollView{
                VStack{
                    Text("welcome")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                    
                    
                    HStack{
                        Image(systemName:"envelope.fill")
                            .foregroundColor(.gray)
                            .padding()
                        TextField("Email or phone number",text: $email)
                    }
                    .frame(width: 350,height: 60)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    
                    HStack{
                        Image(systemName:"key.fill")
                            .foregroundColor(.gray)
                            .padding()
                        TextField("Enter password",text: $password)
                    }
                    .frame(width: 350,height: 60)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    
                    Button{
                        
                    }label: {
                        Text("login")
                            .font(.system(size:18))
                            .foregroundStyle(Color.white)
                            .fontWeight(.semibold)
                            .frame(width: 300 ,height: 60)
                            .background(.blue)
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
