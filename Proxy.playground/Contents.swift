

//MARK: - Proxy Design Pattern

protocol AppFeatures {
    func upload()
    func download()
    func post()
    func comment()
}

class Application: AppFeatures {
    
    func upload() {
        print("Upload successful")
    }
    
    func download() {
        print("Download successful")
    }
    
    func post() {
        print("Posted successful")
    }
    
    func comment() {
        print("commented successful")
    }
    
}

class ApplicationProxy {
    
    private let application: Application = Application()
    
    func upload(permissions: Permissions) {
        if permissions.permissions.contains(.Upload) {
            application.upload()
        } else {
           print("No Permission")
        }
        
    }
    
    func download(permissions: Permissions) {
        if permissions.permissions.contains(.Download) {
            application.download()
        } else {
            print("No Permission")
         }
    }
    
    func post(permissions: Permissions) {
        if permissions.permissions.contains(.Post) {
            application.post()
        } else {
            print("No Permission")
         }
    }
    
    func comment(permissions: Permissions) {
        if permissions.permissions.contains(.Comment) {
            application.comment()
        } else {
            print("No Permission")
         }
    }
}

protocol Permissions {
    var permissions: [PermissionType] { get }
}

enum PermissionType {
    case Upload
    case Download
    case Post
    case Comment
}

class User: Permissions {
    var name: String
    var permissions: [PermissionType]
    var appliction: ApplicationProxy = ApplicationProxy()
    
    init(name: String, permissions: [PermissionType]) {
        self.name = name
        self.permissions = permissions
    }
    
    
    func preformUpload() {
        appliction.upload(permissions: self)
    }
    
    func preformDownload() {
        appliction.download(permissions: self)
    }
    
    func post() {
        appliction.post(permissions: self)
    }
    
    func comment() {
        appliction.comment(permissions: self)
    }
}



let user: User = User(name: "Mahmoud", permissions: [.Download,
                                                     .Comment])

user.comment()
user.post()
user.preformUpload()
user.preformDownload()
