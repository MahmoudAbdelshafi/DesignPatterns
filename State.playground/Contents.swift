

//MARK: - State Design Pattern

protocol GearState {
    func gearUp()
    func gearDown()
}


class FirstGear: GearState {
    
    var bike: Bike
    
    init(bike: Bike) {
        self.bike = bike
    }
    
    func gearUp() {
        self.bike.gearState = SecondGear(bike: bike)
        print("Bike moved form first gear to second gear")
    }
    
    func gearDown() {
         print("Bike Already in the first gear")
    }
}

class SecondGear: GearState {
    
    var bike: Bike
    
    init(bike: Bike) {
        self.bike = bike
    }
    
    func gearUp() {
        self.bike.gearState = ThirdGear(bike: bike)
        print("Bike moved form second gear to third gear")
    }
    
    func gearDown() {
        self.bike.gearState = FirstGear(bike: bike)
    }
}

class ThirdGear: GearState {
    
    var bike: Bike
    
    init(bike: Bike) {
        self.bike = bike
    }
    
    func gearUp() {
        self.bike.gearState = FourthGear(bike: bike)
        print("Bike moved form third gear to fourth gear")
    }
    
    func gearDown() {
        self.bike.gearState = SecondGear(bike: bike)
    }
}

class FourthGear: GearState {
    
    var bike: Bike
    
    init(bike: Bike) {
        self.bike = bike
    }
    
    func gearUp() {
        print("Bike Already in the Fourth gear")
    }
    
    func gearDown() {
        self.bike.gearState = ThirdGear (bike: bike)
    }
}

class Bike {
    
    lazy var gearState: GearState = {
        return FirstGear(bike: self)
    }()
    
    init() {
        
    }
    
    func gearUp() {
        gearState.gearUp()
    }
    
    func gearDown() {
        gearState.gearDown()
    }
    
}

let bike = Bike()
bike.gearUp()
bike.gearUp()
bike.gearDown()
bike.gearDown()
bike.gearUp()

