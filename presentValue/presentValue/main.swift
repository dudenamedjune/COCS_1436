//
//  main.swift
//  markup
//
//  Created by June Lara on 11/23/20.
//
//
import Foundation


func defaultComparison (userInput: Double) -> Bool{
    userInput >= 0
}

func userInput (
        inputMessage: String,
        tryAgainMessage: String
) -> (@escaping (Double) -> Bool) -> Double {
    func inputValidation (comparisonCb: @escaping (Double) -> Bool) -> Double {
        print(inputMessage)
        if let num = (Double)(readLine()!), comparisonCb(num) == true {
            return num
        } else {
            print(tryAgainMessage)
            return inputValidation(comparisonCb: comparisonCb)
        }
    }
    return inputValidation;
}

func presentValue (futureValue: Double, rate: Double, years: Double) -> Double {
    return futureValue / pow((1 + rate), years)
}

let tryAgainString = "Please enter a positive number";
let getFutureValue = userInput(inputMessage: "Enter the future value:", tryAgainMessage: tryAgainString)
let getInterestRate = userInput(inputMessage: "Enter annual interest rate:", tryAgainMessage: tryAgainString)
let getNumberOfYears = userInput(inputMessage: "Enter number of years:", tryAgainMessage: tryAgainString)

func main() {
    let futureValue = getFutureValue(defaultComparison)
    //instructions weren't clear on how the user would enter this field
    let interestRate = (getInterestRate(defaultComparison)) / 100
    let numberOfYears = getNumberOfYears(defaultComparison)
    let needed = presentValue(futureValue: futureValue, rate: interestRate, years: numberOfYears)
    print("Please deposit \(needed) to reach \(futureValue) in \(numberOfYears)")
}

main();