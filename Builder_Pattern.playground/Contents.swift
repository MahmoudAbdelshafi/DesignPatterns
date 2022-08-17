

//MARK: - Builder Pattern Implementaion

class Burger {
    var name: String
    var toppings: Bool
    var catchup: Bool
    var isVeg: Bool
    var isSpicy: Bool
    var cheese: Bool
    
    init(name: String, toppings: Bool, catchup: Bool, isVeg: Bool, isSpicy: Bool, cheese: Bool) {
        self.name = name
        self.toppings = toppings
        self.catchup = catchup
        self.isVeg = isVeg
        self.isSpicy = isSpicy
        self.cheese = cheese
    }
}


let burger = Burger(name: "My Fav", toppings: true, catchup: true, isVeg: false, isSpicy: false, cheese: true )


class BurgerBuilder {
    var toppings: Bool = true
    var catchup: Bool = true
    var isVeg: Bool = false
    var isSpicy: Bool = false
    var cheese: Bool = true
    
    
    func setToppings(toppings: Bool) {
        self.toppings = toppings
    }
    
    func setCatchup(catchup: Bool) {
        self.catchup = catchup
    }
    
    func setIsVeg(isVeg: Bool) {
        self.isVeg = isVeg
    }
    
    func setIsSpicy(isSpicy: Bool) {
        self.isSpicy = isSpicy
    }
    
    func setCheese(cheese: Bool) {
        self.cheese = cheese
    }
    
    func buildBurger(name: String) -> Burger {
        Burger(name: name, toppings: self.toppings, catchup: self.catchup, isVeg: self.isVeg, isSpicy: self.isSpicy, cheese: self.cheese)
    }
}


let builderBurger = BurgerBuilder()
builderBurger.setCatchup(catchup: false)

builderBurger.buildBurger(name: "My Custom")

print(builderBurger.catchup)
