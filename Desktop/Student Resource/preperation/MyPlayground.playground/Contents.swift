//func Sayhello(firstname: String ){
//    print("Hello my name is \(firstname)")
//    
//}
//Sayhello(firstname: "Harshit")
//
//Sayhello(to: "Mirza" , and: "pur")
//func Sayhello(to: String, and: String){
//    print("Say hello to \(to) and \(and)")
//}

//
//func add(firstnumber: Int ,to secondnumber: Int)->Int{
//    return firstnumber + secondnumber
//}
//let total = add(firstnumber: 2, to: 4)
//print(total)


//struct Person{
//    var name: String
//    func sayHello(){
//        print("Hello My name is \(name)")
//    }
//    
//}
//let person = Person(name : "Harshit")
//person.sayHello()
struct Car {
    var type: String
    var colour: String
    var year : Int
    var topSpeed : Int
    
    func startEngine(){
        print("the \(colour) \(year) \(type)'s engine has started")
        
    }
    func drive(){
        print("The \(colour) \(year) \(type) is moving ")
    }
    func park(){
        print("the \(colour) \(year) \(type ) is parked.")
        
    }
    
    
}

let firstCar = Car(type: "truck", colour: "brown", year: 2008, topSpeed: 40)
let secondCar = Car(type: "sedan", colour: "white", year: 1957, topSpeed: 140)


firstCar.startEngine()
firstCar.drive()
