

//MARK: - Mediator Design Pattern

protocol Mediator {
    var colleagues: [Colleague] { get set }
    
    func send(messgae: String, id: Int)
    func addColleague(colleague: Colleague)
}

class ControllTower: Mediator {
    
    var colleagues: [Colleague] = []
    
    func send(messgae: String, id: Int) {
        colleagues.map { if $0.id != id {
            $0.recive(message: messgae)
        }}
    }
    
    func addColleague(colleague: Colleague) {
        self.colleagues.append(colleague)
    }
    
    
}

protocol Colleague {
    var id: Int { get }
    var mediator: Mediator { get }
    
    func send(message: String)
    func recive(message: String)
}


class AeroPlane: Colleague {
    
    var id: Int
    var mediator: Mediator
    
    init(id: Int, mediator: Mediator) {
        self.id = id
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.send(messgae: message, id: self.id)
    }
    
    func recive(message: String) {
        print("Message recived form AeroPlane \(message) ")
    }
    
}

class Chopper: Colleague {
    
    var id: Int
    var mediator: Mediator
    
    init(id: Int, mediator: Mediator) {
        self.id = id
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.send(messgae: message, id: self.id)
    }
    
    func recive(message: String) {
        print("Message recived form Chopper \(message) ")
    }
    
}


class Jet: Colleague {
    
    var id: Int
    var mediator: Mediator
    
    init(id: Int, mediator: Mediator) {
        self.id = id
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.send(messgae: message, id: self.id)
    }
    
    func recive(message: String) {
        print("Message recived form Jet \(message) ")
    }
    
}

let mediator: Mediator = ControllTower()
let aeroPlane: AeroPlane = AeroPlane(id: 1, mediator: mediator)
let jet: Jet = Jet(id: 2, mediator: mediator)
let chopper: Chopper = Chopper(id: 3, mediator: mediator)

mediator.addColleague(colleague: aeroPlane)
mediator.addColleague(colleague: jet)
mediator.addColleague(colleague: chopper)

jet.send(message: "Fire Fire Fire")
