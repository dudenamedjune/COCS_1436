# Swift COCS 1436

Just a newb in this swift world but this is the best I got so far in the class


I still see some clean up I can do, but hey I needed to move on to the next assignment 


```swift
//
//  main.swift
//  payrollReport
//
//  Created by June Lara on 10/21/20.
//

import Foundation

func withHoldingsComparison (earnings: Double) -> (Double) -> Bool {
    func getOtherValue (num: Double) -> Bool {
        earnings >= num
    }
    return getOtherValue
}

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


let tryAgainString = "Please enter a positive number";
let lessThanGross = "Can not be greater than gross";
let getEmployeeNumber = userInput(inputMessage: "Employee Number:", tryAgainMessage: "\(tryAgainString)if you want to terminate enter 0")
let getGrossPay = userInput(inputMessage: "Gross Pay:", tryAgainMessage: tryAgainString)
let getStateTax = userInput(inputMessage: "State Tax: ", tryAgainMessage: lessThanGross)
let getFederalTax = userInput(inputMessage: "Federal Tax: ", tryAgainMessage: lessThanGross)
let getFICA = userInput(inputMessage: "FICA: ", tryAgainMessage: lessThanGross)
let getNetPay = userInput(inputMessage: "Net Pay: ", tryAgainMessage: tryAgainString)

struct Report {
    let employeeNumber: Int
    let grossPay: Double
    let stateTax: Double
    let federalTax: Double
    let fica: Double
    let netPay: Double
}
func getGovCollections(validation: @escaping (Double) -> Bool , grossPay: Double) -> (stateTax: Double, federalTax: Double, fica: Double) {
    let stateTax = getStateTax(validation)
    let federalTax = getFederalTax(validation)
    let fica = getFICA(validation)
    let realisticSum = stateTax + federalTax + fica
    if realisticSum > grossPay {
        print("whoops looks like this is a miscalculation. Please re enter state, federal, and fica tax")
        return getGovCollections(validation: validation, grossPay: grossPay)
    }
    return (stateTax, federalTax, fica)
}
func main () {
    var employeeNumber = getEmployeeNumber(defaultComparison)
    var payroll = [Report]()
    while(employeeNumber > 0) {
        let grossPay = getGrossPay(defaultComparison)
        let withHoldingValidation = withHoldingsComparison(earnings: grossPay);
        let  (stateTax, federalTax, fica) = getGovCollections(validation: withHoldingValidation, grossPay: grossPay)

        let netPay = getNetPay(defaultComparison)
        let newReport = Report(
            employeeNumber: Int(employeeNumber),
            grossPay: grossPay,
            stateTax: stateTax,
            federalTax: federalTax,
            fica: fica,
            netPay: netPay
        )
        payroll.append(newReport)
        employeeNumber = getEmployeeNumber(defaultComparison)
    }
    for report in payroll {
        print("--------------------------------")
        print("Employee: \(report.employeeNumber)")
        print("Gross Pay: \(report.grossPay)")
        print("State Tax: \(report.stateTax)")
        print("Federal Tax: \(report.federalTax)")
        print("FICA: \(report.fica)")
        print("Net Pay: \(report.netPay)")
        print("--------------------------------")
    }
}
main()
```