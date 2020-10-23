
let MONTHLY_CHARGE = 10.0
func getBalance() -> Double? {
    print("Enter beginning balance: ")
      if let balance = (Double)(readLine()!), balance >= 0 {
        return balance
      } else {
        print("Oh no you are overdrawn! PLeas fix this as soon as possible")
        return nil
    }
}
func getChecksWritten() -> Int {
print("Enter checks written: ")
      if let checks = (Int)(readLine()!), checks >= 0 {
        return checks
      } else {
        print("Please enter a valid number of checks!")
        return getChecksWritten()
    }
}

func checksCost(units: Int) -> Double {
  let test8cents = range(min: 20, max: 39)
  let test6cents = range(min: 40, max: 59)
  let is4cents = units >= 60
  if test8cents(units) {
    return 0.08
  }
  if test6cents(units) {
    return 0.06
  }
  if is4cents {
    return 0.04
  }
  return 0.10
}

func range(min: Int, max: Int) -> (Int) -> Bool {
  let range = min..<max + 1
  func contains(num: Int) -> Bool {
    return range.contains(num)
  }
  return contains
}

func round(num: Double) -> Double {
  return (num * 100).rounded() / 100
}

let balance = getBalance()
if balance != nil {
  let numChecks = getChecksWritten()
  let costPerCheck = checksCost(units: numChecks)
  let fees = MONTHLY_CHARGE + costPerCheck * Double(numChecks)
  if balance! < 400 {
      print("Montly Service Fee: $\(fees + 15)")
  } else {
  print("Montly Service Fee: $\(round(num: fees))")
  }
}
