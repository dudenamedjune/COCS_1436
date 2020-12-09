//
//  main.swift
//  isPrime
//
//  Created by June Lara on 11/24/20.
//
//

import Foundation

func isPrime(num:Int) -> Bool{
    if (num == 2 || num == 3){
        return true
    }
    var isPrime = true
    let maxDivisor = Int(sqrt(Double(num)))
    for i in 2...maxDivisor{
        if (num % i) == 0{
            isPrime = false
            break
        }
    }
    return isPrime
}

func main() {
    if(isPrime(num: 7)) {
        print("7 is a prime number")
    }
}

main()

