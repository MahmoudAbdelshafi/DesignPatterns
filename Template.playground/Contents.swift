

//MARK: - Template Design Pattern

protocol Bake {
    func mix()
    func boil()
    func garnish()
    
    func make()
}

extension Bake {
    
    func make() {
        mix()
        boil()
        garnish()
    }
}

class Pizza: Bake {
    
    func mix() {
       print("Mix")
    }
    
    func boil() {
        print("Boil")
    }
    
    func garnish() {
        print("Garnish")
    }
    
}

class Cake: Bake {
    func mix() {
       print("Mix")
    }
    
    func boil() {
        print("Boil")
    }
    
    func garnish() {
        print("Garnish")
    }
    
    func make() {
        boil()
        mix()
        garnish()
    }
    
}

class Restaurant {
    
    func createCake() {
        let bake: Bake = Cake()
        bake.make()
    }
    
    func createPizza() {
        let bake: Bake = Pizza()
        bake.make()
    }
}

let restaurant: Restaurant = Restaurant()
restaurant.createPizza()
