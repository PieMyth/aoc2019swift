import Cocoa

func makePathFromCommands(commandList: Array<Substring.SubSequence>)->Array<(Int, Int)>{
    var path: Array<(Int, Int)> = [(0,0)]
    for command in commandList{
        var tempCommand = String(command)
        let movement: Character = tempCommand.remove(at: tempCommand.startIndex)
        let unit = Int(tempCommand)!
       print("\(movement) \(unit)")
        var coordinateMovement: (Int, Int) = (0,0)
        switch movement{
        case "U":
            coordinateMovement = (0, unit)
            break
        case "D":
            coordinateMovement = (0, -unit)
            break;
        case "R":
            coordinateMovement = (unit, 0)
        case "L":
            coordinateMovement  = (-unit, 0)
            break;
        case _:
            print("Unidentified command! \(movement)")
        }
        var previous_movement: (Int, Int) = path[path.count-1]
        previous_movement.0 += coordinateMovement.0
        previous_movement.1 += coordinateMovement.1
        path.append(previous_movement)
    }
    
    return path
}

func makeIntersectionsFromPaths(commandList: Array<Array<(Int, Int)>>)->Array<(Int,Int)>{
    var intersections:Array<(Int,Int)> = []
    
    return intersections
}

var inputString = ""
if let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt") {
    inputString = try! String(contentsOf: fileURL.absoluteURL)
}
else {
    print("Error finding input.txt")
    exit(EXIT_FAILURE)
}

let commands = inputString.split(separator: "\n")

//Path where each wire goes
var path : Array<Array<(Int,Int)>> = []

//List of commands parsed for each wire
var commandList: Array<Array<Substring.SubSequence>> = []
for command in commands{
    commandList.append(command.split(separator: ","))
}

//Build the path that the wire takes
for i in 0..<2{
    path.append(makePathFromCommands(commandList: commandList[i]))
}

//Find the intersections between the different paths


print(path[0])
var intersections = [(0,0)]
