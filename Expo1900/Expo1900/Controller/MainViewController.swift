import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        setUpNavigationBar()
        parsing()
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

extension MainViewController {
    private func setUpNavigationBar() {
        self.navigationItem.title = "메인"
    }
    
    private func parsing() {
        let parsedResult = JSONParser<Exposition>().decode(fileName: FileName.exposition)
        
        switch parsedResult {
        case .failure(let parsingError):
            showAlert(message: parsingError.errorDescription ?? parsingError.localizedDescription)
            return
        case .success(let contents):
            setUpView(contents: contents)
        }
    }
    
    private func setUpView(contents: Exposition) {
        let colon = ": "
        let people = " 명"
        
        titleLabel.text =  contents.title.replacingOccurrences(of: "(", with: "\n(")
        descriptionLabel.text = contents.description
        posterImageView.image = UIImage(named: FileName.poster)
        
        editFontSize(of: CategoryPrefix.visitor, with: colon + contents.visitorsDescription + people, in: visitorsLabel)
        editFontSize(of: CategoryPrefix.location, with: colon + contents.location, in: locationLabel)
        editFontSize(of: CategoryPrefix.duration, with: colon + contents.duration, in: durationLabel)
    }
    
    private func editFontSize(of prefix: String, with text: String ,in label: UILabel) {
        let attributedString = NSMutableAttributedString()
        
        attributedString.append(NSAttributedString(string: prefix, attributes: [.font: UIFont.preferredFont(forTextStyle: .title2)]))
        attributedString.append(NSAttributedString(string: text, attributes: [.font: UIFont.preferredFont(forTextStyle: .title3)]))
        
        label.attributedText = attributedString
    }
}

extension MainViewController: UINavigationControllerDelegate {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return navigationController.topViewController?.supportedInterfaceOrientations ?? .all
    }
}
