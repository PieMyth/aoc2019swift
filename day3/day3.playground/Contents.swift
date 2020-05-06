import Cocoa

func makePathFromCommands(commandList: Array<Substring.SubSequence>)->Array<(Int, Int)>{
    var path: Array<(Int, Int)> = [(0,0)]
    for command in commandList{
        var tempCommand = String(command)
        let movement: Character = tempCommand.remove(at: tempCommand.startIndex)
        let unit = Int(tempCommand)!
//       print("\(movement) \(unit)")
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
//    print (path)
    return path
}

func isIntersection(firstStart: (Int,Int), firstEnd: (Int,Int), secondStart: (Int,Int), secondEnd: (Int,Int)) ->Bool{
    var result = false
    
    if(((secondStart.0 < firstEnd.0 && secondEnd.0 > firstEnd.0) || (secondStart.0 > firstEnd.0 && secondEnd.0 < firstEnd.0)) &&
        ((secondStart.1 < firstEnd.1 && secondStart.1 > firstStart.1) || (secondStart.1 > firstEnd.1 && secondStart.1 < firstStart.1))){
        result = true
    }
    return result
}

func getLineIntersections(startPoint: (Int, Int), endPoint: (Int, Int), pathList: Array<(Int, Int)>) ->Array<Int> {
    var intersection: Array<Int> = []
    let change = startPoint.0 - endPoint.0 != 0
    
    for i in 1..<pathList.count{
        let pathStartPoint = pathList[i-1]
        let pathEndPoint = pathList[i]
        let pathchange = pathStartPoint.0 - pathEndPoint.0 != 0
        if (change != pathchange){
                if(change){
                    if (isIntersection(firstStart: pathStartPoint, firstEnd: pathEndPoint, secondStart: startPoint, secondEnd: endPoint)){
//                        print("\(startPoint)\(endPoint) \(pathStartPoint)\(pathEndPoint) Intersection ", terminator: "")
//                        print("(\(pathEndPoint.0),\(startPoint.1))")
                        intersection.append((abs(pathEndPoint.0)+abs(startPoint.1)))
//                        print("\(abs(pathEndPoint.0)+abs(startPoint.1))")
                    }
                }
                else{
                    if(isIntersection(firstStart: startPoint, firstEnd: endPoint, secondStart: pathStartPoint, secondEnd: pathEndPoint)){
//                        print("\(startPoint)\(endPoint) \(pathStartPoint)\(pathEndPoint) Intersection ", terminator: "")
//                        print("(\(startPoint.0),\(pathEndPoint.1))")
                        intersection.append((abs(startPoint.0)+abs(pathEndPoint.1)))
//                        print("\(abs(pathEndPoint.1)+abs(startPoint.0))")
                    }
                }
        }
    }
    
    return intersection
}

func makeIntersectionsFromPaths(commandList: Array<Array<(Int, Int)>>)->Array<Int>{
    var intersections:Array<Int> = []
    
    for i in 1..<commandList[0].count{
        let startPoint = commandList[0][i-1]
        let endPoint = commandList[0][i]
        intersections.append(contentsOf: getLineIntersections(startPoint: startPoint, endPoint: endPoint, pathList: commandList[1]))
    }
    
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
var intersections = makeIntersectionsFromPaths(commandList: path)
intersections = intersections.sorted()
print(intersections)
print("Finished")
