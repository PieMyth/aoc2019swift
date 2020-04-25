import Cocoa

let inputOfFile = try! String(contentsOfFile: "/Users/williamhaugen/dev/aoc2019swift/day1/day1.playground/Resources/input.txt")
let lines = inputOfFile.split(separator: "\n")
let ints = lines.map({Int($0)!})
var total = 0
for number in ints{
    total += (number/3-2)
}
print("Total of the modules = \(total)")
