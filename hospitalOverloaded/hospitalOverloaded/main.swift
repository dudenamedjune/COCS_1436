//
//  main.swift
//  hospitalOverloaded
//
//  Created by June Lara on 11/24/20.
//
//

import Foundation

print("Hello, World!")
//
//  main.swift
//  markup
//
//  Created by June Lara on 11/23/20.
//
//
import Foundation

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


func getIsOutPatient () -> Bool {
    print("Where you an outpatient? (Enter y for yes or anything else for no)")
    let type = readLine()!
    if type == "y" {
        return true
    }
    return false
}
let tryAgainString = "Please enter a positive number";
let getNumberOfDaysInHospital = userInput(inputMessage: "Enter the number of days in hospital:", tryAgainMessage: "\(tryAgainString)")
let getDailyRate = userInput(inputMessage: "Enter daily rate for hospital:", tryAgainMessage: "\(tryAgainString)")
let getHospitalMedicationCharge = userInput(inputMessage: "Enter hospital medication charge:", tryAgainMessage: "\(tryAgainString)")
let getChargesForHospitalServices = userInput(inputMessage: "Enter charge for hospital services:", tryAgainMessage: "\(tryAgainString)")

func isPositive (userInput: Double) -> Bool {
    userInput >= 0
}


func convertUSD (_ amount: Double) -> String {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    currencyFormatter.locale = Locale(identifier: "en_US")
    let priceString = currencyFormatter.string(from: NSNumber(value: amount))!
    return priceString
}

func total ( _ serviceCharge: Double, plus medCharge: Double) -> Double {
    serviceCharge + medCharge
}

func total ( _ numDays: Double, times dailyRate: Double) -> Double {
    numDays * dailyRate
}

func main() {
    let outPatient = getIsOutPatient();
    let serviceCharge = getChargesForHospitalServices(isPositive)
    let medCharge = getHospitalMedicationCharge(isPositive)
    let standardTotal = total(serviceCharge, plus: medCharge)
    if(!outPatient) {
        let numDays = getNumberOfDaysInHospital(isPositive)
        let dailyRate = getDailyRate(isPositive)
        let inPatientTotal = standardTotal + total(numDays, times: dailyRate)
        print(convertUSD(inPatientTotal))
        return
    }
    print(convertUSD(standardTotal))
}

main();