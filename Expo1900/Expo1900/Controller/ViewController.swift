import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var informationStackView: InformationStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        informationStackViewSetUp()
        self.title = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - CustomView SetUp

extension ViewController {
    func informationStackViewSetUp() {
        guard let data = Parser<ExpoInformation>.decode(from: .expositionUniverselle1900) else {
            return
        }
        informationStackView.setUp(data: data)
    }
}
