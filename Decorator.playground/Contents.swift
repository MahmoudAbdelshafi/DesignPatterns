

//MARK: - Decorator Design Pattern

protocol Dress {
    func assemble()
}


class BasicDress: Dress {
    
    func assemble() {
        print("Basic dress features")
    }
}

class DressDecorator: Dress {
    var dress: Dress
    
    init(dress: Dress) {
        self.dress = dress
    }
    
    func assemble() {
        dress.assemble()
    }
}

class CasualDress: DressDecorator {
    
    override init(dress: Dress) {
        super.init(dress: dress)
    }
    
    override func assemble() {
         super.assemble()
        print("Casual Dress Features")
    }
}

class FancyDress: DressDecorator {
    
    override init(dress: Dress) {
        super.init(dress: dress)
    }
    
    override func assemble() {
         super.assemble()
        print("Fancy Dress Features")
    }
}

class SportyDress: DressDecorator {
    
    override init(dress: Dress) {
        super.init(dress: dress)
    }
    
    override func assemble() {
         super.assemble()
        print("Sporty Dress Features")
    }
}

let fancySporty: Dress = FancyDress(dress: SportyDress(dress: BasicDress()))
fancySporty.assemble()
