import UIKit

/*
 Ex1:
 1.1 Declare two variables of type Float and assign each a number with a fractional part - for example, 3.14 or 42.0
 1.2 Declare another variable of type Double and assign it the sum of two variables of type Float
 1.3 Print the result with print ()

 */

let floatOne: Float = 3.14
let floatTwo: Float = 42.0

var sumOfFloats: Double = Double(floatOne) + Double(floatTwo)

let formattedSum = String(format: "%.2f", sumOfFloats)

print(formattedSum)

/*
 Ex2:
 2.1 Create a variable numberOne and assign any integer value to it
 
 2.2 Create another integer variable numberTwo and assign it any value less than numberOne
 
 2.3 Set the new integer constant result to the result of dividing numberOne by numberTwo
 
 2.4 Assign the new integer constant remainder the remainder of numberOne divided by numberTwo
 
 2.5 Output to the console the message: "When dividing <...> by <...>, the result is <...>, the remainder is <...>".
 
 */

let numberOne = 5
let numberTwo: Int = 2

let result = numberOne / numberTwo

let remainder = numberOne % numberTwo

print("When dividing \(numberOne) by \(numberTwo), the result is \(result), the remainder is \(remainder)")


/*
 Ex3:
 You need to buy several new MacBook Pro, each cost 1000 EUR.
 If you are buying 5 and more, with discount it will cost you 900 each! If you are buying 10 and more with discount it will cost you 850 each! Create if-else statements to check Conditions of buying in different amount!
 print("new: \(qty) MacBook Pro with the price of: \(price) EUR, will cost you: \(totalSum) Eur")
 */

let qty: Int = 11

if qty < 1 {
    print("Quantity can't be less than 1")
} else {
    var price: Int = 1000
    
    if qty >= 10 {
        price = 850
    } else if qty >= 5 {
        price = 900
    }
    
    let totalSum: Int = price * qty

    print("new: \(qty) MacBook Pro with the price of: \(price) EUR, will cost you: \(totalSum) Eur")
}


/*
 Ex4:
 Create String userInputAge and put value "33a" and convert to Int to make Fatal error: Unexpectedly found nil while unwrapping an Optional value!
 Fix this Fatal error inside the if-else statements to print whenever this age can be converted to Int or not!
 */

let userInputAge: String = "33a"
//let userAge: Int = Int(userInputAge)! // causing fatal error

if let userAge = Int(userInputAge) {
    print("userInputAge can be converted to Int: \(userAge)")
} else {
    print("Cannot convert userInputAge with the value of '\(userInputAge)' to Int")
}

//let userAge = Int(userInputAge)
//
//if userAge != nil {
//    print("userInputAge can be converted to Int: \(userAge!)")
//} else {
//    print("Cannot convert userInputAge with the value of '\(userInputAge)' to Int")
//}

/*
 Ex5:
 Calculate the number of years, months, days have passed from you birthday to current date.
 print("Total years: \(totalYearsFromBirth) , total months: \(totalMonthFromBirth), total days: \(totalDaysFromBirth) have passed")
 */

let yearOfBirth = 2000
let monthOfBirth = 4
let dayOfBirth = 2

let currentFullDate: Date = Date.now

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy/MM/dd"
let birthDate = dateFormatter.date(from: "\(yearOfBirth)/\(monthOfBirth)/\(dayOfBirth)") ?? Date.now

let yearComponents = Calendar.current.dateComponents([.year], from: birthDate, to: currentFullDate)
let totalYearsFromBirth: Int = yearComponents.year ?? 0

let monthComponents = Calendar.current.dateComponents([.month], from: birthDate, to: currentFullDate)
let totalMonthFromBirth: Int = monthComponents.month ?? 0

let dayComponents = Calendar.current.dateComponents([.day], from: birthDate, to: currentFullDate)
let totalDaysFromBirth: Int = dayComponents.day ?? 0

if totalYearsFromBirth != 0 || totalMonthFromBirth != 0 || totalDaysFromBirth != 0 {
    print("Total years: \(totalYearsFromBirth) , total months: \(totalMonthFromBirth), total days: \(totalDaysFromBirth) have passed")
} else {
    print("Wrong input, or something went horribly wrong!")
}


/*
 Ex6:
 Use Exercise 5 monthOfBirth to calculate in which quarter of the year you were born.
 Use switch case to print("I was born in the ... quarter")
 */

switch monthOfBirth {
case 1...3:
    print("I was born in the first quarter")
case 4...6:
    print("I was born in the second quarter")
case 7...9:
    print("I was born in the third quarter")
case 10...12:
    print("I was born in the fourth quarter")
default:
    print("\(monthOfBirth) is not a valid month to be born in")
}

