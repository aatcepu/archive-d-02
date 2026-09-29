func display(name: String)
{
    print("Welcome to grocery store \(name)")
    print("Good morning \(name)")
}
display(name: "sandhya")
display(name: "Akash")
func cart(product:String , price:Double , quantity:Int)
{
    var total = price * Double(quantity)
    print("Cart total = \(product) * \(quantity) = \(total) INR")
    if total >= 100
    {
        print("you will get free delivery")
    }
    else{
        print("Cart total = \(product) * \(quantity) = \(total) INR")oø
    }
}
cart(product: "apple", price: 20.3, quantity: 10)


