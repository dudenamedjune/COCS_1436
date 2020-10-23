 //
//  main.swift
//  cellpackage
//
//  Created by June Lara on 9/12/20.
//  Copyright © 2020 June Lara. All rights reserved.
//

import Foundation

struct Package {
    var name: String
    var monthlyCost: Double
    var cap: Double?
    var additional: Double?
}

let packages = [
    Package(name: "a", monthlyCost: 39.99, cap: 4.0, additional: 10.0),
    Package(name: "b", monthlyCost: 59.99, cap: 8.0, additional: 5.0),
    Package(name: "c", monthlyCost: 69.99)
]

func checkPackage (packageName: String) -> Int {
    let lowerCasedName = packageName.lowercased()
    for (index, package) in packages.enumerated() {
        if package.name == lowerCasedName {
            return index
        }
    }
    return -1
}

func getPackage() -> Package {
    print("Enter your package: ")
    let userInput = readLine()
        let packageIndex = checkPackage(packageName: userInput!)
        if  packageIndex >= 0 {
            //should of used a hash map here, but this works with not a horrible run time
            return packages[packageIndex]
        }
    print("Please eneter a valid pacakge a, b or c:")
    return getPackage()
}

func getUsage() -> Double {
    print("Enter how many gigs you have used: ")
    //this wasnt an ask but dont see how you could have a negative amount of usage
    if let gigs = (Double)(readLine()!), gigs >= 0{
      return gigs
    } else {
      print("Please enter a valid amount of gigs!")
      return getUsage()
  }
}

func main() {
    let package = getPackage()
    let usage = getUsage()
    
    if let currentCap = package.cap, currentCap < usage {
        let totalWithOverage = package.monthlyCost + ((usage - package.cap!) * package.additional!)
        print("Total: \(Double(round(1000*totalWithOverage)/1000))")
    }
    
    let total = package.monthlyCost
    print("Total: \(total) ")
}

main()

 
