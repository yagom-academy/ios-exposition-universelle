import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var informationStackView: InformationStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        informationStackViewSetUp()
        setTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - Method

extension ViewController {
    func setTitle() {
        title = "메인"
    }
}

// MARK: - CustomView SetUp

extension ViewController {
    func informationStackViewSetUp() {
        guard let data = Parser<ExpoInformation>.decode(from: .expositionUniverselle1900) else {
            return
        }
        informationStackView.setUpView(from: data)
    }
}
