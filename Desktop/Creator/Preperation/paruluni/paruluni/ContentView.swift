import SwiftUI
import MapKit
import CoreData
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Image("onbording-2")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(height: 900)
                VStack{
                    Image("Group-2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    Text("welcome to our store")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 40,weight:.semibold))
                    Text("Buy one Get one Free")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 25,weight:.semibold))
                 
                        Button{
                            
                        }label: {
                            //NavigationLink(destination: destinationpage()){
                            Text("Get Started")
                                .font(.system(size:18))
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .frame(width: 300 ,height: 60)
                                .background(.green)
                                .cornerRadius(20)
                            
                        }
                        
                    }
                    
                }
            }
            .padding()
        }
    }
//}
#Preview {
    ContentView()
}
