import UIKit

struct AppUtility {
    static func acceptOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.possibleOrientation = orientation
        }
    }
    
    static func acceptOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOientation: UIInterfaceOrientation) {
        self.acceptOrientation(orientation)
        UIDevice.current.setValue(rotateOientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
}
