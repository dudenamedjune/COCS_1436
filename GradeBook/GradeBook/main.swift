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

func validationOverride(userInput: Double) -> Bool {
    true
}

func greaterThanZeroLessThanOneHundred(userInput: Double) -> Bool {
    0...100 ~= userInput
}

let tryAgainString = "Please enter a value between 0 and 100";
let getGrade = userInput(inputMessage: "Enter grade:", tryAgainMessage: "\(tryAgainString)")


func totalGrades (grades: [Double]) -> Double {
    grades.reduce(0.0, { sold, jars in
        sold + jars
    })
}

func average(sum: Double, count: Int) -> Double {
    sum / Double(count)
}

func getLetterGrade(grade: Double) -> String{
   switch grade {
   case 90...100:
       return "A"
   case 80..<90:
       return "B"
   case 70..<80:
       return "C"
   case 60..<70:
       return "D"
   default:
       return "F"
   }
}

func main() {
    // data structures and use of them are constraints
    var students = [String]()
    var studentsLetterGrades = [String]()
    var gradeBook = [[Double]]()

    for studentIndex in 0...4 {
        print("Enter student's name: ")
        let name = readLine()
        students.append(name!)
        gradeBook.append([Double]())
        print("Enter \(name!)'s grades below")
        print("=============================")
        for examNumberIndex in 0...3 {
            let grade = getGrade(greaterThanZeroLessThanOneHundred)
            gradeBook[studentIndex].insert(grade, at: examNumberIndex)
        }
        //TODO: Clean this up
        let studentGrades = gradeBook[studentIndex]
        let numberOfExams = studentGrades.count
        let sumOfExams = totalGrades(grades: studentGrades)
        let average = sumOfExams / Double(numberOfExams)
        let letterGrade = getLetterGrade(grade: average)
        studentsLetterGrades.append(letterGrade)
    }
    for (studentsIndex, student) in students.enumerated() {
        let studentGrades = gradeBook[studentsIndex]
        let numberOfExams = studentGrades.count
        let sumOfExams = totalGrades(grades: studentGrades)
        let average = sumOfExams / Double(numberOfExams)
        print(" \(student)'s average is \(average) and received the letter grade \(studentsLetterGrades[studentsIndex])")
    }
}

main()