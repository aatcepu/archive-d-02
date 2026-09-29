import UIKit

var greeting = "Hello, playground"
// = is assignment operator used to assign value to the variable or constant
//Basic Arithmatic Operate
var opponentScore=3*8
var myScore=100/4
var totalScore=opponentScore+myScore
myScore=myScore+3


//Type Conversion
var v1=20
var v2=30.3
// var sum1=v1+v2 => error becuse both var are in different data type

var sum=Double(v1)+v2 //sum = 50.3

//order of operation
//When more than two mathematicle or any operation are being execute at given point of time they need order of operation to give answer with full accuracy.
/*  1.( )
    2.* /
    3.+ -
        */
var x=2,y=3,z=5
print(x+y*z)
print((x+y)*z)

let temp=100
if temp>=100{
    print("The water is boiling")
}


//Control Flow
let numberOfWheels=2
switch numberOfWheels{
case 0:
    print("Missing Something")
case 1:
    print("Unicycle")
case 2:
    print("Bicycle")
case 3:
    print("Tricycle")
case 4:
    print("Quadcycle")
default:
    print("Not Avilable")
}
