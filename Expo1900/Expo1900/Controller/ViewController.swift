import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customButtonStackView: CustomButtonStackView!
    @IBOutlet weak var informationStackView: InformationStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customViewSetUp()
    }
}

// MARK: - CustomView SetUp

extension ViewController {
    func customViewSetUp() {
        guard let data = Parser<ExpoInformation>.decode(from: .expositionUniverselle1900) else {
            return
        }
        informationStackView.setUp(data: data)
        informationStackView.setUpStyle()
        
        customButtonStackView.setUp()
    }
}
