

//MARK: - Chain Of Resposnability

protocol Deducatable {
    var next: Deducatable? { get set }
    
    func deduct(amount: Double)
    static func createChain() -> Deducatable
}

extension Deducatable {
    
    static func createChain() -> Deducatable {
        var savingAccount: Deducatable = SavingAccount()
        var fixedAccount: Deducatable = FixedAccount()
        let currentAccount: Deducatable = CurrentAccount()
        
        savingAccount.next = fixedAccount
        fixedAccount.next = currentAccount
        
        return savingAccount
    }
    
}

class SavingAccount: Deducatable {
    var next: Deducatable?
    
    func deduct(amount: Double) {
        if (amount <= 1000) {
            print("Amount Deducated form Saving Account")
        } else {
            next?.deduct(amount: amount)
        }
    }
}

class FixedAccount: Deducatable {
    var next: Deducatable?
    
    func deduct(amount: Double) {
        if (amount > 1000 && amount <= 100000) {
            print("Amount Deducated form Fixed Account")
        } else {
            next?.deduct(amount: amount)
        }
    }
}

class CurrentAccount: Deducatable {
    var next: Deducatable?
    
    func deduct(amount: Double) {
        if (amount > 100000) {
            print("Amount Deducated form Current Account")
        } else {
            next?.deduct(amount: amount)
        }
    }
}

class Customer {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func deductAmount(amount: Double) {
        let account: Deducatable = SavingAccount.createChain()
        account.deduct(amount: amount)
    }
}

let customer: Customer = Customer(name: "Mahmoud")
customer.deductAmount(amount: 100)
customer.deductAmount(amount: 10000)
customer.deductAmount(amount: 1000000)
