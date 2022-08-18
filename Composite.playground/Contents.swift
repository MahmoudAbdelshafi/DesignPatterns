

//MARK: - Composite Design Pattern

protocol CarPart {
    var name: String { get }
    var price: Double { get }
}

class IndividualPart: CarPart {
    
    var name: String
    var price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

class CompositePart: CarPart {
    
    var name: String
    var parts: [CarPart] = []
    var price: Double {
        return parts.reduce(0) { (total, part) -> Double in
            return total + part.price
        }
    }
    
    init(name: String, parts: [CarPart]) {
        self.name = name
        self.parts = parts
    }
    
    func addPart(carPart: CarPart) {
        self.parts.append(carPart)
    }
    
    func removePart(carPart: CarPart) {
        parts.removeAll(where: { $0.name == carPart.name })
    }
}


class Customer {
    
    var name: String
    var parts: [CarPart]
    
    var totalOrderPrice: Double {
        return parts.reduce(0) { (total, part) -> Double in
            return total + part.price
        }
    }
    
    init(name: String, parts: [CarPart]) {
        self.name = name
        self.parts = parts
    }
    
    func printOrderDetails() {
        print("These are the parts prices")
        for part in parts {
            print("name: \(part.name) price: \(part.price)")
        }
        
        print("Total Order Price: \(totalOrderPrice)")
    }
}

let windowDoor: CompositePart = CompositePart(name: "WindowDoor", parts: [IndividualPart(name: "WindowDoor", price: 1000),
                                                                         IndividualPart(name: "WindowGlass", price: 500),
                                                                          IndividualPart(name: "Switch", price: 12.54)])
let door: CompositePart = CompositePart(name: "Door", parts: [IndividualPart(name: "Handler", price: 12)])

let seatCover: CarPart = IndividualPart(name: "Seat Cover", price: 40)

let customer: Customer = Customer(name: "Customer", parts: [door, seatCover])
customer.printOrderDetails()
