import UIKit

final class ExpositionMainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var koreanEntryButton: UIButton!
    
    private let alternativeFont = UIFont.preferredFont(forTextStyle: .title3)
    
    private func updateExpositionContents() {
        if let decodedData: Exposition = ParsingAssistant.shared.decodeContent(fileName: "exposition_universelle_1900") {
            titleLabel.text = decodedData.linedTitle()
            imageView.image = UIImage(named: "poster")
            
            visitorsLabel.attributedText = decodedData
                .setTextAttribute(of: "방문객 : \(decodedData.decimalVisitors()) 명",                                                     target: "방문객",
                                  attributes: [.font: alternativeFont])
            
            locationLabel.attributedText = decodedData
                .setTextAttribute(of: "개최지 : \(decodedData.location)",                                                                target: "개최지",
                                  attributes: [.font: alternativeFont])
            
            durationLabel.attributedText = decodedData
                .setTextAttribute(of: "개최 기간 : \(decodedData.duration)",
                                  target: "개최 기간",
                                  attributes: [.font: alternativeFont])
            
            descriptionLabel.text = decodedData.description
        } else {
            showFileNotFoundAlert()
            koreanEntryButton.isEnabled = false
        }
    }
    
    private func showFileNotFoundAlert() {
        let alert = UIAlertController(title: "File Not Found",
                                      message: "파일이 없습니다!",
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인",
                                        style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

//MARK: - Life Cycle
extension ExpositionMainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        koreanEntryButton.titleLabel?.adjustsFontForContentSizeCategory = true
        visitorsLabel.adjustsFontForContentSizeCategory = true
        updateExpositionContents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        let currentOrientationRawValue = UIDevice.current.orientation.rawValue
        OrientationHelper.acceptOrientation(.portrait, andRotateTo: .portrait)
        UIDevice.current.setValue(currentOrientationRawValue, forKey: "orientation")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
        OrientationHelper.acceptOrientation(.all)
    }
}
