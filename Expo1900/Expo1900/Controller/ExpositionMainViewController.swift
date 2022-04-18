import UIKit

final class ExpositionMainViewController: UIViewController {
    @IBOutlet private weak var expoTitleLabel: UILabel!
    @IBOutlet private weak var expoImageView: UIImageView!
    @IBOutlet private weak var expoVisitorsLabel: UILabel!
    @IBOutlet private weak var expoLocationLabel: UILabel!
    @IBOutlet private weak var expoDurationLabel: UILabel!
    @IBOutlet private weak var expoDescriptionLabel: UILabel!
    @IBOutlet private weak var koreanEntryButton: UIButton!
    
    private let alternativeFont = UIFont.systemFont(ofSize: 20)
    
    private func decodeExpositionContent() -> Exposition? {
        let decoder = JSONDecoder()
        guard let exposition = NSDataAsset(name: "exposition_universelle_1900") else { return nil }
        let data = try? decoder.decode(Exposition.self, from: exposition.data)
        
        return data
    }
    
    private func updateExpositionContents() {
        if let decodedData = decodeExpositionContent() {
            expoTitleLabel.text = decodedData.linedTitle()
            expoImageView.image = UIImage(named: "poster")
            expoVisitorsLabel.attributedText = decodedData
                .setTextAttribute(of: "방문객 : \(decodedData.decimalVisitors()) 명",
                              target: "방문객",
                          attributes: [.font: alternativeFont])
            expoLocationLabel.attributedText = decodedData
                .setTextAttribute(of: "개최지 : \(decodedData.location)",                                                                      target: "개최지",
                          attributes: [.font: alternativeFont])
            expoDurationLabel.attributedText = decodedData
                .setTextAttribute(of: "개최 기간 : \(decodedData.duration)",
                              target: "개최 기간",
                          attributes: [.font: alternativeFont])
            expoDescriptionLabel.text = decodedData.description
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

extension ExpositionMainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateExpositionContents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}
