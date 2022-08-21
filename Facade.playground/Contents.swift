

//MARK: - Facade Design Pattern

protocol Shape {
    func draw()
}

class Circle: Shape {
    
    func draw() {
       print("Circle Drawn")
    }
}

class Square: Shape {
    
    func draw() {
        print("Square Drawn")
    }
}

class Rectangle: Shape {
    
    func draw() {
        print("Rectangle Drawn")
    }
}

class ShapeFacade {
    
    var circle: Shape = Circle()
    var square: Shape = Square()
    var rectangle: Shape = Rectangle()
    
    func drawCircle() {
        circle.draw()
    }
    
    func drawSquare() {
        square.draw()
    }
    
    func drawRectangle() {
        rectangle.draw()
    }
}


class ShapeMaker {
    
    var shapeFacade: ShapeFacade = ShapeFacade()
    
    func drawCircle() {
        shapeFacade.drawCircle()
    }
    
    func drawSquare() {
        shapeFacade.drawSquare()
    }
    
    func drawRectangle() {
        shapeFacade.drawRectangle()
    }
}
