

//MARK: - Adapter Design Pattern

protocol BasicMobile {
    func initiateCall()
    func disconnectCall()
}


class Nokia: BasicMobile {
    
    func initiateCall() {
        print("Call Initiated....")
    }
    
    func disconnectCall() {
        print("Call Disconnected...")
    }
    
}

protocol SmartMobile {
    func startCall()
    func stopCall()
    func capturePhoto()
    func captureVideo()
}


class IPhone: SmartMobile {
    func startCall() {
        print("Call Started....")
    }
    
    func stopCall() {
        print("Call Stoped....")
    }
    
    func capturePhoto() {
        print("Photo Captured....")
    }
    
    func captureVideo() {
        print("Video Captured....")
    }
    
}

class SmartAdapter: SmartMobile {

    var basicMobile: BasicMobile
    
    init(basicMobile: BasicMobile) {
        self.basicMobile = basicMobile
    }
    
    func startCall() {
        self.basicMobile.initiateCall()
    }
    
    func stopCall() {
        self.basicMobile.disconnectCall()
    }
    
    func capturePhoto() {
        print("Doesn't support the photo feature")
    }
    
    func captureVideo() {
        print("Doesn't support the video feature")
    }
}

let basicMobile: BasicMobile = Nokia()
let smartMobile: SmartMobile = SmartAdapter(basicMobile: basicMobile)

print(smartMobile.capturePhoto())
