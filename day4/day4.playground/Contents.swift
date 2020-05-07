import Cocoa

func validPassword(numStr: String)->Bool{
    var ascendingOnly = true
    var pair = false
    
    let sortedNumStr = numStr.sorted()
    if(String(sortedNumStr) != numStr){
        ascendingOnly = false
    }
    
    if (ascendingOnly == true){
        for i in 1..<numStr.count{
            let firstIndex = numStr.index(numStr.startIndex, offsetBy: i-1)
            let secondIndex = numStr.index(numStr.startIndex, offsetBy: i)
            let first: Int = numStr[firstIndex].wholeNumberValue!
            let second: Int = numStr[secondIndex].wholeNumberValue!
            if (!pair && first == second){
                pair = true
            }
        }
    }
    
    return ascendingOnly && pair
}

print("TEST CASES")
let testPass = ["111111", "223450", "123789"]
let testResults = [ true, false, false]
for i in 0..<testPass.count{
    print("\(testPass[i]) is supposed to be \(testResults[i])", terminator: " ")
    print(": \(validPassword(numStr: testPass[i]))")
}
print()

let minNumber = 123257
let maxNumber = 647015
var count = 0

print("NUMBER TO TEST")
print("\(maxNumber - minNumber)")
for i in minNumber..<maxNumber{
    let numberString = String(i)
    if (validPassword(numStr: numberString)){
        count += 1
    }
}
 print(count)
