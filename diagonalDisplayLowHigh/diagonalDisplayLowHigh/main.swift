//
//  main.swift
//  diagonalDisplayLowHigh
//
//  Created by June Lara on 10/22/20.
//
//

import Foundation

//print("Enter an integer no greater than 7")
//
//let number = (Int)(readLine()!)
//
//var xString = "X"
//for x in 1...number! {
//    print(xString)
//    xString += "X"
//}


let number = 5

switch number {
case 0..<5:
    print("First group")
case 5...10:
    print("Second group")
case 0...5:
    print("Third group")
default:
    print("Fourth group")
}
