import UIKit

/*
 Exercise 1.1
 
 Create a func calculateResult with argument firstNumber, parametrs numberOne, data type Int, + argument andSecondNumber, parametrs numberTwo, data type Int ,+ argument withCalculationType, parametrs calculationType, data type CalculationType and everything will return Int.
 
 Than use switch case to calculate and return Int result

    var result = numberOne
       
       switch calculationType {
       case .addition: result += numberTwo
        .....
       }
  print("Result:  \(calculationType.rawValue) \(numberOne) and \(numberTwo) = \(result)")
 
    return result
 
 */

enum Errors : Error {
    case divisionByZero
}

enum CalculationType: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

func calculateResult(firstNumber numberOne: Int, secondNumber numberTwo: Int, withCalculationType calculationType: CalculationType) throws -> Int {
    
    var result = numberOne
    
    switch calculationType {
    case .addition:
        result += numberTwo
    case .subtraction:
        result -= numberTwo
    case .multiplication:
        result *= numberTwo
    case .division:
        guard numberTwo != 0 else {
            throw Errors.divisionByZero
        }
        result /= numberTwo
    }
    
    print("Result: \(numberOne) \(calculationType.rawValue) \(numberTwo) = \(result)")
   
      return result
}

/*
Exercise 1.2
Declare two numbers.
Call func 4 times for all calculateResult
*/

let numOne = 10
let numTwo = 0

do {
    let resultOne = try calculateResult(firstNumber: numOne, secondNumber: numTwo, withCalculationType: .addition)
    print("resultOne = \(resultOne)")
    let resultTwo = try calculateResult(firstNumber: numOne, secondNumber: numTwo, withCalculationType: .subtraction)
    print("resultTwo = \(resultTwo)")
    let resultThree = try calculateResult(firstNumber: numOne, secondNumber: numTwo, withCalculationType: .multiplication)
    print("resultThree = \(resultThree)")
    let resultFour = try calculateResult(firstNumber: numOne, secondNumber: numTwo, withCalculationType: .division)
    print("resultFour = \(resultFour)")
    
} catch Errors.divisionByZero {
    print("division by zero is not allowed")
} catch {
    print("some other error occurred")
}


/*
Exercise 2

Create struct Car with elements
    name: String
    productionYear: Int
    horsPower: Int

 Create func getSpecs() print it with elements provided above
 */

struct Car {
    let name: String
    let productionYear: Int
    let horsePower: Int
    
    func getSpecs() {
        print("name: \(name), production year: \(productionYear), horsepower: \(horsePower)")
    }
}

let car = Car(name: "someCar", productionYear: 2023, horsePower: 9000)
car.getSpecs()
