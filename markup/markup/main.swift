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

func calculateRetail (for cost: Double, times percentMarkup: Double) -> Double {
    return cost * ((percentMarkup + 100) / 100.0);
}

func convertUSD (amount: Double) -> String {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    currencyFormatter.locale = Locale(identifier: "en_US")
    let priceString = currencyFormatter.string(from: NSNumber(value: amount))!
    return priceString
}

let tryAgainString = "Please enter a positive number";
let getWholeSaleCost = userInput(inputMessage: "Enter wholesale cost:", tryAgainMessage: tryAgainString)
let getMarkUpPercentage = userInput(inputMessage: "Enter mark up percentage:", tryAgainMessage: tryAgainString)

func main() {
    let wholeSaleCost = getWholeSaleCost(defaultComparison);
    let markUpPercentage = getMarkUpPercentage(defaultComparison);
    let total = calculateRetail(for: wholeSaleCost, times: markUpPercentage)
    print(convertUSD(amount: total))
}

main();