import UIKit

/*
Exercise 1
1.Create new Class Orange(Fruit). Inside the Class declare:
     color = ""
     teste = ""
     weight = 0.0
 2.Make Class example from Orange Class and named it as someOrange.
 3.Give specific value for:
     color = "Orange"
     taste = "Sweet"
     weight = 0.66
 4.print("My \(someOrange.weight) kg orange has \(someOrange.color) color and \(someOrange.taste) taste")
*/

class Orange {
    var color: String = ""
    var taste: String = ""
    var weight: Double = 0.0
    
    init(color: String, taste: String, weight: Double) {
        self.color = color
        self.taste = taste
        self.weight = weight
    }
}

let someOrange = Orange(color: "Orange", taste: "Sweet", weight: 0.66)

print("My \(someOrange.weight) kg orange has \(someOrange.color) color and \(someOrange.taste) taste")

/*
Exercise 2
1.Create new Parent(Superclass) Class Figure. Inside the Class declare:
         height: Float
         width: Float
         radius: Float
         square: Float
         perimeter: Float
 2. init(height: Float, width: Float) and 2 methods:
         func squareOfFigure() -> Float { return square }
         func perimeterOfFigure() -> Float { return perimeter }
 3.Create new Child(Subclass) Rectangle of Paret Class Figure
 3.Inside Rectangle override func squareOfFigure() -> Float to calculate and return square and override func perimeterOfFigure() -> Float to calculate and return perimeter !
 4.Inside Rectangle make a func description() where we can print("Rectangle area is: \(squareOfFigure()), and perimeter Of Figure is: \(perimeterOfFigure())")
 5.Make Class example from Rectangle Class and named it as myRectangle and give a value as you want for height and width.
 6.Finally call myRectangle.description()
*/

class Figure {
//    var height: Float
//    var width: Float
//    var radius: Float
    var square: Float?
    var perimeter: Float?
    
//    init(height: Float = 0.0, width: Float = 0.0, radius: Float = 0.0) {
//        self.height = height
//        self.width = width
//        self.radius = radius
//        self.square = 0.0
//        self.perimeter = 0.0
//    }
    
    func squareOfFigure() -> Float { 
        if let square = square {
            return square
        } else {
            return 0.0
        }
    }
    func perimeterOfFigure() -> Float {
        if let perimeter = perimeter {
            return perimeter
        } else {
            return 0.0
        }
    }
}

class Rectangle: Figure {
    var height: Float
    var width: Float
    
    init(height: Float, width: Float) {
        self.height = height
        self.width = width
    }
    
    override func squareOfFigure() -> Float {
        return width * height
    }
    
    override func perimeterOfFigure() -> Float {
        return 2 * (width + height)
    }
    
    func description() {
        print(String(format: "Rectangle area is: %.1f, and perimeter of the figure is: %.1f",
                     squareOfFigure(),
                     perimeterOfFigure()))
    }
}

let myRectangle = Rectangle(height: 5.2, width: 3.5)
myRectangle.description()

class Circle: Figure {
    var radius: Float
    
    init(radius: Float) {
        self.radius = radius
    }
    
    override func squareOfFigure() -> Float {
        return 3.14 * pow(radius, 2)
    }
    
    override func perimeterOfFigure() -> Float {
        return 2 * 3.14 * radius
    }
    
    func description() {
        print(String(format: "Circle area is: %.1f, and perimeter of the figure is: %.1f",
                     squareOfFigure(),
                     perimeterOfFigure()))
    }
}

let myCircle = Circle(radius: 5.5)
myCircle.description()
