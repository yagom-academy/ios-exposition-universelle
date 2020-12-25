import UIKit

struct UIOrientation {
    static func setUIOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let uiApplication = UIApplication.shared.delegate as? AppDelegate {
            uiApplication.orientation = orientation
        }
    }
}
