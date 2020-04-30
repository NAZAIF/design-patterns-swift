import Foundation

class Point {
    var x: Int
    var y: Int
    var shape: Shape
    
    init(x: Int, y: Int, shape: Shape) {
        self.x = x
        self.y = y
        self.shape = shape
    }
}

extension Point: CustomStringConvertible {
    var description: String {
        return "Point (\(self.x),\(self.y),\(self.shape))"
    }
}

extension Point: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Point(x: self.x, y: self.y, shape: self.shape.copy() as! Shape)
    }
}

class Shape {
    var size: Int
    var type: String
    
    init(size: Int, type: String) {
        self.size = size
        self.type = type
    }
}

extension Shape: CustomStringConvertible {
    var description: String {
        return "Shape(\(self.type),\(self.size)"
    }
}

extension Shape: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Shape(size: self.size, type: self.type)
    }
}

var p1 = Point(x: 0, y: 0, shape: Shape(size: 2, type: "Circle"))
var p2 = p1.copy() as! Point

p2.x = 10
p2.y = 12
p2.shape.size = 4
p2.shape.type = "Square"

print("p1: \(p1)\np2: \(p2)")

