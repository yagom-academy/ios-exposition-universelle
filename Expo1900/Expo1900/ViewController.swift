import UIKit

class ViewController: UIViewController {
    
    var posterInformation: Exposition?
    var expositionPosterScrollView: ExpositionPosterScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expositionPosterScrollView = ExpositionPosterScrollView()
        guard let expositionPosterScrollView = expositionPosterScrollView else {
            return
        }
        view.addSubview(expositionPosterScrollView)
    }
}

