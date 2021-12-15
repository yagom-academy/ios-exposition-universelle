import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var itemListButton: UIButton!
    
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
        let parsedResult = JSONParser<Exposition>.decode(fileName: FileName.exposition)
        
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
        visitorsLabel.text = CategoryPrefix.visitor + colon + contents.visitorsDescription + people
        locationLabel.text = CategoryPrefix.location + colon + contents.location
        durationLabel.text = CategoryPrefix.duration + colon + contents.duration
        descriptionLabel.text = contents.description
        posterImageView.image = UIImage(named: FileName.poster)
        
        editFontSize(of: CategoryPrefix.visitor, in: visitorsLabel)
        editFontSize(of: CategoryPrefix.location, in: locationLabel)
        editFontSize(of: CategoryPrefix.duration, in: durationLabel)
        
        itemListButton.titleLabel?.adjustsFontForContentSizeCategory = true
        itemListButton.titleLabel?.numberOfLines = 0
    }
    
    private func editFontSize(of prefix: String ,in label: UILabel) {
        guard let text = label.text else {
            return
        }
        let remainingText = text.replacingOccurrences(of: prefix, with: "")

        let attributedString = NSMutableAttributedString(string: text)
        
        let firstFontSize = UIFont.preferredFont(forTextStyle: .title2)
        let firstRange = (text as NSString).range(of: prefix)
        attributedString.addAttribute(.font, value: firstFontSize, range: firstRange)
        
        let secondFontSize = UIFont.preferredFont(forTextStyle: .title3)
        let secondRange = (text as NSString).range(of: remainingText)
        attributedString.addAttribute(.font, value: secondFontSize, range: secondRange)
        
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
