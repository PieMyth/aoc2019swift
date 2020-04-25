import Cocoa

let inputOfFile = try! String(contentsOfFile: "/Users/williamhaugen/dev/aoc2019swift/day2/input.txt")
let lines = inputOfFile.split(separator: ",")

var numbers = lines.map({Int($0)!})

//var numbers = [1,9,10,3,2,3,11,0,99,30,40,50]
var counter = 0
var index = 0
numbers[1] = 12
numbers[2] = 2
while index < numbers.count-1 {
    let opcode = numbers[index]
    if opcode == 99 {
        print("99 at index \(index)")
        break
    }
    index += 1
    let firstindex = numbers[index]
    index += 1
    let secondindex = numbers[index]
    index += 1
    let thirdindex = numbers[index]
    index += 1
    print("\(opcode) \(firstindex) \(secondindex) \(thirdindex)")
    switch opcode{
    case 1:
        print ("\(numbers[firstindex]) [\(firstindex)] + \(numbers[secondindex]) [\(secondindex)] on index \(thirdindex)")
        numbers[thirdindex] = numbers[firstindex] + numbers[secondindex]
        break
    case 2:
        print ("\(numbers[firstindex]) [\(firstindex)] * \(numbers[secondindex]) [\(secondindex)] on index \(thirdindex)")
        numbers[thirdindex] = numbers[firstindex] * numbers[secondindex]
        break
    case _:
        print(index)
        print("Unknown opcode: \(opcode)")
        print("\(numbers[0])")
    }
}
print(numbers.count-1)
print("Number: \(numbers[0])")
