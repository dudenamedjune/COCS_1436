//
//  main.swift
//  playground
//
//  Created by June Lara on 9/27/20.
//

import Foundation

var charge = 2500.0
for x in 1...6 {
    print("\(x): $\(Double(round(100*(charge * 1.04))/100))")
    charge *= 1.04
}
