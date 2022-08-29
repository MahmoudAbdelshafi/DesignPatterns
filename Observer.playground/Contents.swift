

//MARK: - Observer Design Pattern

protocol Observer {
    var id: Int { get }
    func notify(data: String)
}

protocol Subject {
    var observers: [ Observer ] { get set }
    var mobile: String { get set }
    func registerObserver(observer: Observer)
    func unRegisterObserver(observer: Observer)
    func notifyAll()
}

class Student: Observer {
    var id: Int
    var name: String
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
    func notify(data: String) {
        print("The update mobile \(data)")
    }
    
}

class Teacher: Subject {
    var observers: [Observer] = []
    var mobile: String {
        didSet {
            notifyAll()
        }
    }
    var name: String
    
    init(name: String, mobile: String) {
        self.mobile = mobile
        self.name = name
    }
    
    func registerObserver(observer: Observer) {
        self.observers.append(observer)
    }
    
    func unRegisterObserver(observer: Observer) {
        self.observers.removeAll(where: { $0.id == observer.id })
    }
    
    func notifyAll() {
        observers.map { $0.notify(data: mobile) }
    }
    
}

var teacher: Subject = Teacher(name: "Mahmoud", mobile: "01143475757")
let student1: Observer = Student(name: "Stue", id: 1)
let student2: Observer = Student(name: "Stue2", id: 2)
let student3: Observer = Student(name: "Stue3", id: 3)
let student4: Observer = Student(name: "Stue4", id: 4)

teacher.registerObserver(observer: student1)
teacher.registerObserver(observer: student2)
teacher.registerObserver(observer: student3)
teacher.registerObserver(observer: student4)

teacher.mobile = "123456686"
