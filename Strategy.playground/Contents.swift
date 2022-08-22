

//MARK: - Strategy Design Pattern

protocol DBOperations {
    func create()
    func update()
    func delete()
    func read()
}

class RemoteDB: DBOperations {
    
    func create() {
        print("Create Form Remote DB")
    }
    
    func update() {
        print("Update Form Remote DB")
    }
    
    func delete() {
        print("Delete Form Remote DB")
    }
    
    func read() {
        print("Read Form Remote DB")
    }
    
}

class LocalDB: DBOperations {
    
    func create() {
        print("Create Form Local DB")
    }
    
    func update() {
        print("Update Form Local DB")
    }
    
    func delete() {
        print("Delete Form Local DB")
    }
    
    func read() {
        print("Read Form Local DB")
    }
    
}


class Storage {
   
    var dateBase: DBOperations
    
    init(dataBase: DBOperations) {
        self.dateBase = dataBase
    }
    
    func create() {
        dateBase.create()
    }
    
    func update() {
        dateBase.update()
    }
    
    func delete() {
        dateBase.delete()
    }
    
    func read() {
        dateBase.read()
    }
}

enum Environment {
    case develop
    case production
}

let environment: Environment = .production

var dataBase: DBOperations = (environment == .develop) ? LocalDB() : RemoteDB()
let storage: Storage = Storage(dataBase: dataBase)
storage.create()
storage.update()
storage.read()
storage.delete()
