
import UIKit

class ExpoNavigationController: UINavigationController {    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let topViewController = topViewController else {
            return .all
        }
        return topViewController.supportedInterfaceOrientations
    }
}
