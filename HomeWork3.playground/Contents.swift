import UIKit

/*
 Exercise 1
 The user opens a deposit in the bank for 5 years in the amount of 500_000 Eur. The interest rate per annum \(rate). Calculate the amount of income \(profit) at the end of the \(period).
 for _ in 1...period{
 }
 print("Amount of income after \(period) years will be \(profit) Eur. My total deposit will be \(deposit) Eur !")
 */

var deposit: Double = 500_000
let rate: Double = 2.0 // percent
let period: Int = 5
var profit: Double = 0

for _ in 1...period{
    let interest = deposit * (rate / 100)
    profit += interest
    deposit += interest
}
let formattedProfit = String(format: "%.2f", profit)
let formattedDeposit = String(format: "%.2f", deposit)

print("Amount of income after \(period) years will be \(formattedProfit) Eur. My total deposit will be \(formattedDeposit) Eur !")

/*
 Exercise 2
 Create an integer array with any set of numbers and  print("My even numbers are: \(evenNumber)")
 Use a % inside the for loop.
 */

let integerArray = [60, 1, 2, 3, 64, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
var evenNumbers: [Int] = []

for number in integerArray {
    if number % 2 == 0 {
        evenNumbers.append(number)
        print("\(number) is an even number")
    }
}

print("My even numbers are: \(evenNumbers)")

/*
 Exercise 3
 Inside the for loop create randomNumber for the random Int calculation. Calculate and print("Number 5 will be after \(counter) shuffles"). Don't forget to make a break inside the if statement.
 */

let maxIterations = 1_000_000
var numberFound = false

for counter in 1...maxIterations {
    let randomNumber = Int.random(in: 1...10000)
    
    if randomNumber == 5 {
        print("Number 5 will be after \(counter) shuffles")
        numberFound = true
        break
    }
}

if !numberFound {
    print("Max iteration amount was reached and 5 was not generated as the random number")
}

/*
 Exercise 4
 A bug is climbing to a 10-meter electric post. During the day, bug can climb two meters, during the night she slides down to 1 meter. Determine with the help of the cycle how many days bug will climb on the top of the post. Think about which loop to use in which situation. print("bug will spend \(numberOfDays)) to reach top of the post")
 */

var metersClimbed: Int = 0
var numberOfDays: Int = 0

while metersClimbed < 10 {
    metersClimbed += 2
    
    numberOfDays += 1
    
    if metersClimbed < 10 {
        metersClimbed -= 1
    }
}

print("bug will spend \(numberOfDays) days to reach top of the post")
