func Cart(itemPrice1: Double, itemPrice2: Double)->Double{
    let total = itemPrice1 + itemPrice2 + 35.0 + 100.0
    let GST = ((itemPrice1 + itemPrice2)/100.0)*18.0
    let totalBill = total + GST
    return totalBill
}
print("Your total bill \(Cart(itemPrice1:3300.0, itemPrice2:400.0))")
