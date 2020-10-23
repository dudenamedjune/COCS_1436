//
//  main.swift
//  playground
//
//  Created by June Lara on 9/27/20.
//

import Foundation

func sumOfRange() -> Int {
    print("Please enter a positive integer value: ")
    if let userValue = (Int)(readLine()!), userValue > 0 {
        var sum = 0
        for num in 1...userValue {
            sum += num
        }
        return sum;
    } else {
      return sumOfRange()
  }
}
let reducedNumber = sumOfRange();
