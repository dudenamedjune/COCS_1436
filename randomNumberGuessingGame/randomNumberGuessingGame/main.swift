//
//  main.swift
//  randomNumberGuessingGame
//
//  Created by June Lara on 10/22/20.
//
//

import Foundation

let number = Int.random(in: 0..<10)


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

func lessThanOrEqual (num: Double) -> (Double) -> Bool {
    func getOtherValue (guess: Double) -> Bool {
        if(guess > num) {
            print("Too high, try again")
            return false
        }
        if(guess < num) {
            print("Too low, try again.")
            return false
        }
        return true
    }
    return getOtherValue
}

func main() {
    let validation = lessThanOrEqual(num: Double(number))
    let correct = userInput(inputMessage: "Guess a number between 0 and ten", tryAgainMessage: "Restart in 3, 2, 1")(validation)
    print("Yeh, you guessed the correct number \(Int(correct))")
}

main()
