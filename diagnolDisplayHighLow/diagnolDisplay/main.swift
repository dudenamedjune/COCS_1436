//
//  main.swift
//  squareDisplay
//
//  Created by June Lara on 10/22/20.
//
//

import Foundation


// Assignment didnt ask for validation
//Write a program that asks the user for a positive integer no greater than 7.
//The program should then display a square on the screen using the character ‘X’.
//The number entered by the user will be the length of each side of the square.
//For example, if the user enters 7, the program should display the following:

print("Enter a positive integer no greater than 7")
let number = (Int)(readLine()!)

var xString = ""
for x in 1...number! {
    for i in 0...number! - x {
        xString += "X"
    }
    print(xString)
    xString  = ""
}