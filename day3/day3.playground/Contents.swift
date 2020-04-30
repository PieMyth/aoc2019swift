import Cocoa

var inputString = ""
if let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt") {
    inputString = try! String(contentsOf: fileURL.absoluteURL)
}
else {
    print("Error finding input.txt")
    exit(EXIT_FAILURE)
}

let commands = inputString.split(separator: "\n")

// Each path starts at center point (0,0)
var path = [[(0,0)],[(0,0)]]
// Keep track on where paths intersect
var intersections = [(0,0)]
