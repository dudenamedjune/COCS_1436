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

func getArea ( _ length: Double, times width: Double) -> Double {
    return length * width;
}

func displayData (print length: Double, print width: Double, print area: Double) {
    print("Length: \(length)")
    print("Width: \(width)")
    print("Area: \(area)")
}
let tryAgainString = "Please enter a positive number";
let getLength = userInput(inputMessage: "Enter rectangle length:", tryAgainMessage: tryAgainString)
let getWidth = userInput(inputMessage: "Enter rectangle width:", tryAgainMessage: tryAgainString)

func main() {
    let length = getLength(defaultComparison)
    let width = getWidth(defaultComparison)
    let area = getArea(length, times: width)
    displayData(print: length, print: width, print: area)
}

main();