import Cocoa

func validPassword(numStr: String, twoPairOnly: Bool)->Bool{
    var ascendingOnly = true
    var pair = false
    
    let sortedNumStr = numStr.sorted()
    if(String(sortedNumStr) != numStr){
        ascendingOnly = false
    }
    
    if (ascendingOnly == true){
        var pairNumber = [Int:Int]()
        for i in 0..<numStr.count{
            let firstIndex = numStr.index(numStr.startIndex, offsetBy: i)
            let first: Int = numStr[firstIndex].wholeNumberValue!
            if (pairNumber[first] == nil){
                pairNumber[first] = 1
            }
            else {
                pairNumber[first]? += 1
            }
        }
        if (twoPairOnly == true){
            for (_,count) in pairNumber{
                if (count == 2){
                    pair = true
                    break
                }
            }
        }
        else {
            for (_,count) in pairNumber{
                if (count >= 2){
                    pair = true
                    break
                }
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
    print(": \(validPassword(numStr:testPass[i], twoPairOnly: false))")
}

print("TWO PAIR ONLY")
let testTwoPairOnly = ["112233", "123444", "111122"]
let testTwoPairResult = [true, false, true]
for i in 0..<testTwoPairOnly.count{
    print("\(testTwoPairOnly[i]) is supposed to be \(testTwoPairResult[i])", terminator: " ")
    print(": \(validPassword(numStr: testTwoPairOnly[i], twoPairOnly: true)) ")
}

print()

let minNumber = 123257
let maxNumber = 647015
var count = 0

print("NUMBER TO TEST")
print("\(maxNumber - minNumber)")
for i in minNumber..<maxNumber{
    let numberString = String(i)
    if (validPassword(numStr: numberString, twoPairOnly:true)){
        count += 1
    }
}
 print(count)
