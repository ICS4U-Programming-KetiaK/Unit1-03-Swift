//
// Microwave.swift
//
// created by Ketia Gaelle Kaze
// created on 2022-02-27
// version 1.3
// copyright (c) 2022 Ketia Gaelle Kaze. ALl rights reserved.
//
// This Microwave program asks the user the food they want to eat
// and its amount and displays the time it takes to heat the food.

import Foundation
// Exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that gives the exception
func catchString() throws {
    throw MyError.runtimeError("Your input is not valid.")
}

// declaring constants
let aMin = 60
let singleFood = 1
let doubleFood = 2
let tripleFood = 3
let singleSoup = Double(105)
let singlePizza = Double(45)
let singleSub = Double(60)
let oneHalf = 1.5
let soupUser = "SOUP"
let pizzaUser = "PIZZA"
let subUser = "SUB"

// declaring variables
var time = Double(0)

// get user input
print("What would you like to heat?: ", terminator: "")
// read user input
var foodLower = readLine()
// convert user input to uppercase
var foodUpper = foodLower!.uppercased()
// convert time into seconds
if foodUpper == soupUser {
    time = singleSoup
} else if foodUpper == pizzaUser {
    time = singlePizza
} else if foodUpper == subUser {
    time = singleSub
} else {
    print("Invalid food!")
}

if foodUpper == soupUser || foodUpper == pizzaUser || foodUpper == subUser {
    // get user input
    print("How many \(foodUpper) are you cooking (max 3))?: ", terminator: "")
    // read user input
    let amountString = readLine()
   do {
       // convert user input to int
       let amountInt = Int(amountString!) ?? 0
       // convert time into seconds
       if amountInt == singleFood {
           time *= 1
       } else if amountInt == doubleFood {
           time *= oneHalf
       } else if amountInt == tripleFood {
           time *= 2
       } else if amountInt != Int(amountString!) {
           try catchString()
       } else {
           // display error input message
           print("Quantity should be between 1 and 3")
           exit(0)
       }

       // calculate minutes and seconds taken to heat the food
       let minutes = Int(time)/aMin
       let seconds = time.truncatingRemainder(dividingBy: Double(aMin))
       // display result to user
       print("Time to heat the food is \(minutes) minutes and \(seconds) seconds.")

  } catch MyError.runtimeError(let errorMessage) {
      // identify invalid inputs
      print(errorMessage)
  }
}
