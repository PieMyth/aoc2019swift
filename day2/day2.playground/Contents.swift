import Cocoa

let inputOfFile = try! String(contentsOfFile: "/Users/williamhaugen/dev/aoc2019swift/day2/input.txt")
let lines = inputOfFile.split(separator: ",")

var index = 0
var numbers = lines.map({Int($0)!})
while index < numbers.count-1 {
    let opcode = numbers[index]
    if opcode == 99 {
        break
    }
    index += 1
    let firstindex = numbers[index]
    index += 1
    let secondindex = numbers[index]
    index += 1
    let thirdindex = numbers[index]
    index += 1
    switch opcode{
    case 1:
        numbers[thirdindex] = numbers[firstindex] + numbers[secondindex]
        break
    case 2:
        numbers[thirdindex] = numbers[firstindex] * numbers[secondindex]
        break
    case _:
        print(index)
        print("Unknown opcode: \(opcode)")
    }
}
print("First question: \(numbers[0])")

for firstadjust in 0...99{
    for secondadjust in 0...99{
        var numbers = lines.map({Int($0)!})
        numbers[1] = firstadjust
        numbers[2] = secondadjust
        var index = 0
        while index < numbers.count-1 {
            let opcode = numbers[index]
            if opcode == 99 {
                break
            }
            index += 1
            let firstindex = numbers[index]
            index += 1
            let secondindex = numbers[index]
            index += 1
            let thirdindex = numbers[index]
            index += 1
            switch opcode{
            case 1:
                numbers[thirdindex] = numbers[firstindex] + numbers[secondindex]
                break
            case 2:
                numbers[thirdindex] = numbers[firstindex] * numbers[secondindex]
                break
            case _:
                print(index)
                print("Unknown opcode: \(opcode)")
            }
        }
        if numbers[0] == 19690720{
            print("Second question:\nFirst Number: \(firstadjust) Second Number: \(secondadjust)")
            print("Number: \(numbers[0])")
            break
        }
    }
    if numbers[0] == 19690720{
        break
    }
}
