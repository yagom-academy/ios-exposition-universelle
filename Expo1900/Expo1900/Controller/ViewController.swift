import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customButtonStackView: CustomButtonStackView!
    @IBOutlet weak var informationStackView: InformationStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = Parser<ExpoInformation>.decode(from: .expositionUniverselle1900) else { return }
        customButtonStackView.setUp()
        informationStackView.setUp(data: data)
    }


}

