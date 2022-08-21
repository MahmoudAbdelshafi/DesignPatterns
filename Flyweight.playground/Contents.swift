

//MARK: - Flyweight Design Pattern

protocol Pen {
    var brush: String { get }
    var color: String { get }
    
    func draw(content: String, color: String)
}

class ThickPen: Pen {
   
    var brush: String = "Thick"
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func draw(content: String, color: String) {
        print("Drawing Content\(content) in \(color)")
    }
}


class ThinPen: Pen {
   
    var brush: String = "Thin"
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func draw(content: String, color: String) {
        print("Drawing Content\(content) in \(color)")
    }
}

class MediumPen: Pen {
   
    var brush: String = "Medium"
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func draw(content: String, color: String) {
        print("Drawing Content\(content) in \(color)")
    }
}


class PenFactroy {
    
   static var cache: [String: Pen] = [:]
    
    static func getPen(brush: String, color: String) -> Pen {
        let key = "\(brush) - \(color)"
        if let pen = PenFactroy.cache[key] {
            print("Returnning the existing pen form cache")
            return pen
        } else {
            var pen: Pen!
            print("Creating a new pen with a brush")
            switch brush {
            case "Thick":
                pen = ThickPen(color: color)
            case "Medium":
                pen = MediumPen(color: color)
            case "Thin":
                pen = ThinPen(color: color)
            default:
                print( "There is no such a brush" )
            }
            cache[key] = pen
            return pen
        }
    }
}

let pen: Pen = PenFactroy.getPen(brush: "Thick", color: "Red")
let samePen: Pen = PenFactroy.getPen(brush: "Thick", color: "Red")
