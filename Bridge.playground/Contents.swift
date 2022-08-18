

//MARK: - Bridge Design Pattern

protocol TV {
    var remote: Remote { get }
    func on()
    func off()
}

class SonyTV: TV {
    
    var remote: Remote
    
    init(remote: Remote) {
        self.remote = remote
    }
    
    func on() {
        print("Sony TV is on")
    }
    
    func off() {
        print("Sony TV is off")
    }
    
}

protocol Remote {
    func increaseVolume()
    func decreaseVolume()
    func on()
    func off()
}


class BasicRemote: Remote {
    
    func increaseVolume() {
        print("Volume up")
    }
    
    func decreaseVolume() {
        print("Volume down")
    }
    
    func on() {
        print("TV on")
    }
    
    func off() {
        print("TV off")
    }
    
}


class AdvancedRemote: Remote {
    
    func increaseVolume() {
        print("Volume up")
    }
    
    func decreaseVolume() {
        print("Volume down")
    }
    
    func on() {
        print("TV on")
    }
    
    func off() {
        print("TV off")
    }
    
    func channelUp() {
        print("Channel Up")
    }
    
    func channelDown() {
        print("Channel Down")
    }
}


let tv: TV = SonyTV(remote: AdvancedRemote())
tv.remote.on()
tv.remote.off()
