
import UIKit

class ExpoInfoViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorValueLabel: UILabel!
    @IBOutlet private weak var locationValueLabel: UILabel!
    @IBOutlet private weak var durationValueLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: DescriptionTextView!
    @IBOutlet weak var transitionButton: UIButton!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsToDefault()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - Private Method

extension ExpoInfoViewController {
    private func setViewsToDefault() {
        self.navigationController?.navigationBar.topItem?.title =
            ExpoStringLiteral.expoInfoTitle.text
        do {
            let data = try Parser.parsedExpoInfo()
            self.titleLabel.text = data.formattedTitle
            self.visitorValueLabel.text = data.formattedVisitors
            self.locationValueLabel.text = data.location
            self.durationValueLabel.text = data.duration
            self.titleLabel.numberOfLines = .zero
            self.titleLabel.font = ExpoFont.expoInfoTitleFont
            self.titleLabel.adjustsFontForContentSizeCategory = true
            self.visitorValueLabel.font = ExpoFont.expoInfoBodyFont
            self.visitorValueLabel.adjustsFontForContentSizeCategory = true
            self.locationValueLabel.font = ExpoFont.expoInfoBodyFont
            self.locationValueLabel.adjustsFontForContentSizeCategory = true
            self.durationValueLabel.font = ExpoFont.expoInfoBodyFont
            self.durationValueLabel.adjustsFontForContentSizeCategory = true
            self.durationValueLabel.accessibilityLabel = durationValueLabel.text?.replacingOccurrences(of: "-", with: "부터")
            self.descriptionTextView.setAttribute(with: " " + data.description)
            self.transitionButton.titleLabel?.font = ExpoFont.expoInfoBodyFont
            self.transitionButton.titleLabel?.adjustsFontForContentSizeCategory = true
            self.transitionButton.titleLabel?.numberOfLines = 0
            self.transitionButton.titleLabel?.textAlignment = .center
            
            guard let transitionButtonTitleLabelHeightAnchor = self.transitionButton.titleLabel?.heightAnchor else {
                return
            }
            self.transitionButton.translatesAutoresizingMaskIntoConstraints = false
            self.transitionButton.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
            self.transitionButton.heightAnchor.constraint(equalTo: transitionButtonTitleLabelHeightAnchor).isActive = true
        } catch let error {
            showAlert(message: error.localizedDescription)
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: ExpoStringLiteral.alertActionOK.text,
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
