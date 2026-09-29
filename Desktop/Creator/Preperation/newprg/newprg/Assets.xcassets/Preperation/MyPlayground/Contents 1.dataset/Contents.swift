//let name = "Harshit"
//var  b = name
//b = "Divyakant"

//struct Student{
//    var name : String = "Harshit"
//    var rollno : Int = 21
//    var marks : Double = 37.5
//}
//let student = Student()
//print("Name: \(student.name)")
//print("Roll Number: \(student.rollno)")
//print("Marks: \(student.marks)")


//class Person{
//    var firstName: String
//    var lastName: String
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//    func sayHello(){
//        print("Hello \(firstName) \(lastName)")
//    }
//}
//let aPerson = Person(firstName : "Harshit", lastName : "Pathak" )
//let anotherPerson = Person(firstName : "Shambhu" , lastName:  "Jha")
//aPerson.sayHello()
//anotherPerson.sayHello()


//let num1 = 100_00_000
//let num2 = Double(num1)
//print(num2)
//
//var isPluggedIn = false
//var hasBatteryPower = false
//
//if isPluggedIn || hasBatteryPower {
//  print(”You can use your laptop.”)
//} else {
//    print("😱")
let distance = 8
switch distance {
case 0...9:
    print("Your destination is close.”)
case 10...99:
    print("Your destination is a medium distance from here.”)
case 100...999:
    print("Your destination is far from here.”)
default:
    print("Are you sure you want to travel this far?”)
}
