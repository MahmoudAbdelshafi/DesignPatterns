

//MARK: - Abstract Factory Design Pattern Implementation

class Computer {
    var cpu: CPU
    var gpu: GPU
    var display: Display
    
    init(cpu: CPU, gpu: GPU, display: Display) {
        self.cpu = cpu
        self.display = display
        self.gpu = gpu
    }
}

//MARK: - Abstraction

protocol CPU {
    var cores: Int { get }
}

protocol GPU {
    var speed: Int { get }
}

protocol Display {
    var resoultion: Int { get }
}


//MARK: - CPU

class BasicCPU: CPU {
    var cores: Int = 2
}

class StanderdCPU: CPU {
    var cores: Int = 4
}

class AdvancedCPU: CPU {
    var cores: Int = 8
}

//MARK: - GPU

class BasicGPU: GPU {
    var speed: Int = 1000
}

class StanderdGPU: GPU {
    var speed: Int = 2000
}

class AdvancedGPU: GPU {
    var speed: Int = 4000
}
//MARK: - Display

class BasicDisplay: Display {
    var resoultion: Int = 720
}

class StanderdDisplay: Display {
    var resoultion: Int = 1080
}

class AdvancedDisplay: Display {
    var resoultion: Int = 1660
}


//MARK: - Specs

enum Specifications {
    case Standerd, Basic, Advanced
}


class ComputerFactory {
    
    func createCPU() -> CPU {
        fatalError("Not Implemented")
    }
    
    func createGPU() -> GPU {
        fatalError("Not Implemented")
    }
    
    func createDisplay() -> Display {
        fatalError("Not Implemented")
    }
    
    
    static func makeFactory(specifications: Specifications) -> ComputerFactory? {
      //  let factory: ComputerFactory?
        
        switch specifications {
            
        case .Standerd:
            return StanderdComputerFactory()
        case .Basic:
            return BasicComputerFactory()
        case .Advanced:
            return AdvancedComputerFactory()
        }
       // return nil
    }
}


class BasicComputerFactory: ComputerFactory  {
    
   override func createCPU() -> CPU {
        return BasicCPU()
    }
    
    override func createGPU() -> GPU {
        BasicGPU()
    }
    
    override func createDisplay() -> Display {
        BasicDisplay()
    }
}

class StanderdComputerFactory: ComputerFactory  {
    
   override func createCPU() -> CPU {
        return StanderdCPU()
    }
    
    override func createGPU() -> GPU {
        StanderdGPU()
    }
    
    override func createDisplay() -> Display {
        StanderdDisplay()
    }
}


class AdvancedComputerFactory: ComputerFactory  {
    
   override func createCPU() -> CPU {
        return AdvancedCPU()
    }
    
    override func createGPU() -> GPU {
        AdvancedGPU()
    }
    
    override func createDisplay() -> Display {
        AdvancedDisplay()
    }
}


if let factory = ComputerFactory.makeFactory(specifications: .Advanced) {
    let computer = Computer(cpu: factory.createCPU(), gpu: factory.createGPU(), display: factory.createDisplay())
    print(computer.gpu.speed)
    print(computer.cpu.cores)
    print(computer.display.resoultion)
}
