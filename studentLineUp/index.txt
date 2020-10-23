//
//  main.swift
//  studentLIneUp
//
//  Created by June Lara on 10/21/20.
//

import Foundation


func getNumberOfStudentsInClass() -> Int {
    print("Enter the number of students in class")
    if let numStudents = (Int)(readLine()!), numStudents > 0 && numStudents < 26 {
        return numStudents
    } else {
        print("Please enter a number greater than 0 and less than 26")
        return getNumberOfStudentsInClass()
    }
}

func main() {
    let numStudents = getNumberOfStudentsInClass()
    var firstStudent = ""
    var lastStudent = ""
    //wouldnt use the range operator here on line 28 but an array
    //wasnt provided one in the description
    //A teacher has asked all her students to line up according to their first name. For example, in one class Amy will be at the front of the line, and Yolanda will be at the end. Write a program that prompts the user to enter the number of students in the class, then loops to read that many names. Once all the names have been read, it reports which student would be at the front of the line and which one would be at the end of the line. You may assume that no two students have the same name. Input Validation: Do not accept a number less than 1 or greater than 25 for the number of students.
    for student in 1...numStudents {
        if student == 1 {
            firstStudent = String(student)
        }
        if student == numStudents {
            lastStudent = String(student)
        }
        print("Student \(student)")

    }
    print("Last student \(firstStudent)")
    print("Last student \(lastStudent)")
}

main()

