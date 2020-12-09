//
//  main.swift
//  lowestScore
//
//  Created by June Lara on 11/24/20.
//
//



//
//  main.swift
//  markup
//
//  Created by June Lara on 11/23/20.
//
//
import Foundation




func defaultComparison (userInput: Double) -> Bool{
    //COOL STUFFS: Pattern matching 
  0...100 ~= userInput
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

let tryAgainString = "Please enter a number between or equal to 0 and 100";
let askScore = userInput(inputMessage: "Enter the future value:", tryAgainMessage: tryAgainString)


func findLowest(scores: [Double]) -> Int {
  Int(scores.min()!)
}
func calcAverage(scores: [Double]) -> Void {
    let lowest = findLowest(scores: scores)
    let average = scores.reduce(0.0, {sum, score in
        if score != Double(lowest) {
            return sum + score
        }
        return sum
    }) / 4
    print("Average: \(average)")
}

func getScore(scores: inout [Double]) -> Void {
    let score = askScore(defaultComparison);
    scores.append(score)
}

func main() {
    var scores = [Double]()
    for _ in 0...4 {
        getScore(scores: &scores)
    }
    calcAverage(scores: scores)
}



main();