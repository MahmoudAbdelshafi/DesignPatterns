

//MARK: - Command Design Pattern

protocol Reciver {
    var isOn: Bool { get set }
    func on()
    func off()
}

class Buld: Reciver {
    
    var isOn: Bool = false
    
    
    func on() {
        isOn = true
        print("Build is on")
    }
    
    func off() {
        isOn = false
        print("Build is off")
    }
    
}


class Fan: Reciver {
    
    var isOn: Bool = false
    
    func on() {
        isOn = true
        print("Fan is on")
    }
    
    func off() {
        isOn = false
        print("Fan is off")
    }
    
}

protocol Command {
    func execute()
    func undo()
}

class TurnOnCommand: Command {
    
    var reciver: Reciver
    
    init(reciver: Reciver){
        self.reciver = reciver
    }
    
    func execute() {
        reciver.on()
    }
    
    func undo() {
        if reciver.isOn {
            reciver.off()
        } else {
            reciver.on()
        }
    }
    
}

class Invoker {
    
    var command: Command
    
    init(command: Command) {
        self.command = command
    }
    
    func execute() {
        command.execute()
    }
    
    func undo() {
        command.undo()
    }
}

let invoker = Invoker(command: TurnOnCommand(reciver: Fan()))
invoker.execute()
invoker.undo()
