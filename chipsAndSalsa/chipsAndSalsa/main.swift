//
//  main.swift
//  chipsAndSalsa
//
//  Created by June Lara on 12/8/20.
//
//

import Foundation
//wouldn't normally solve it this way but the data structure was a constraint


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

let tryAgainString = "Please enter a non negative value ";
let getJarsSold = userInput(inputMessage: "Jars Sold:", tryAgainMessage: "\(tryAgainString)")

func greaterThanZero(userInput: Double) -> Bool {
    userInput >= 0
}

func printTotalSales (sales: [Int]) -> Int {
     sales.reduce(0, { sold, jars in
        sold + jars
    })
}

func salesForEachSalsaType (sales: [Int], for names: [String] ) {
    for index in 0...names.count - 1 {
       print("\(names[index]) sales \(sales[index])" )
    }
}

func minSold (sales: [Int], for names: [String]) {
    var min = Int()
    var type = String()
    for (index, sold) in sales.enumerated() {
        if index == 0 {
            min = sold
            type = names[index]
            continue
        }
        if sold < min {
            min = sold
            type = names[index]
        }
    }
    print("\(type) is the least sold")
}

func maxSold  (sales: [Int], for names: [String]) {
    var max = Int()
    var type = String()
    for (index, sold) in sales.enumerated() {
        if index == 0 {
            max = sold
            type = names[index]
            continue
        }
        if sold > max {
            max = sold
            type = names[index]
        }
    }
    print("\(type) is the most sold")
}

func main() {
    let salsaTypes = ["mild", "medium", "sweet", "hot", "zesty"];
    var salsasSoldPerMonth = [0, 0, 0, 0, 0];
    for index in 0...salsaTypes.count - 1 {
        print("\n\(salsaTypes[index]) salsa")
        print("------------------------- ")
        let jarsSold = getJarsSold(greaterThanZero)
        salsasSoldPerMonth[index] = Int(jarsSold)
    }
    print("\nIndividual sales")
    print("-------------------")
    salesForEachSalsaType(sales: salsasSoldPerMonth, for: salsaTypes)
    print("\nTotal sales \(printTotalSales(sales: salsasSoldPerMonth))")
    minSold(sales: salsasSoldPerMonth, for: salsaTypes)
    maxSold(sales: salsasSoldPerMonth, for: salsaTypes)
}

main()