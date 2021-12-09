import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customButtonStackView: CustomButtonStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customButtonStackView.setUp()
    }


}

