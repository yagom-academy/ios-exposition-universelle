import UIKit

class ExpoNavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let _ = self.topViewController as? ExpoInformationViewController {
            return .portrait
        } else {
            return .all
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
