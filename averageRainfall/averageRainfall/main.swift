//
//  main.swift
//  averageRainfall
//
//  Created by June Lara on 10/22/20.
//
//

import Foundation

func defaultComparison (userInput: Double) -> Bool{
    userInput > 0
}

func isPositive (userInput: Double) -> Bool {
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


let getYears = userInput(inputMessage: "Years: ", tryAgainMessage: "Please enter a number greater than 0")
func main() {
    let years = getYears(defaultComparison)
    var totalRain = 0.0
    for year in 1...Int(years) {
        for month in 1...12 {
            let getRain = userInput(inputMessage: "Inches of rainfall Rainfall in year \(year) month \(month):", tryAgainMessage: "Please enter a non-negative number")
            let rain = getRain(isPositive)
            totalRain += rain
        }
    }
    let totalMonths = 12 * years
    print("Total Months \(totalMonths)")
    print("Total rainfall \(totalRain)")
    print("Average monthly rainfall \(totalRain / totalMonths)")
}

main()

