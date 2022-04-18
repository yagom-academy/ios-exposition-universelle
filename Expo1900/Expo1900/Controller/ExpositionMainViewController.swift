import UIKit

final class ExpositionMainViewController: UIViewController {
    @IBOutlet private weak var expoTitleLabel: UILabel!
    @IBOutlet private weak var expoImageView: UIImageView!
    @IBOutlet private weak var expoVisitorsLabel: UILabel!
    @IBOutlet private weak var expoLocationLabel: UILabel!
    @IBOutlet private weak var expoDurationLabel: UILabel!
    @IBOutlet private weak var expoDescriptionLabel: UILabel!
    @IBOutlet private weak var koreanEntryButton: UIButton!
    
    private let newLine: Character = "\n"
    private let leftParentheses: Character = "("
    
    private func decodeExpositionContent() -> Exposition? {
        let decoder = JSONDecoder()
        guard let exposition = NSDataAsset(name: "exposition_universelle_1900") else { return nil }
        let data = try? decoder.decode(Exposition.self, from: exposition.data)
        return data
    }
    
    private func updateExpositionContents() {
        if let decodedData = decodeExpositionContent() {
            expoTitleLabel.text = insertNewLine(at: decodedData.title)
            expoImageView.image = UIImage(named: "poster")
            expoVisitorsLabel.attributedText = convertTextSize(of: "방문객 : \(insertComma(at: decodedData.visitors)) 명", target: "방문객")
            expoLocationLabel.attributedText = convertTextSize(of: "개최지 : \(decodedData.location)", target: "개최지")
            expoDurationLabel.attributedText = convertTextSize(of: "개최 기간 : \(decodedData.duration)", target: "개최 기간")
            expoDescriptionLabel.text = decodedData.description
        } else {
            showFileNotFoundAlert()
        }
    }
    
    private func insertNewLine(at value: String) -> String {
        var result = value
        result.insert(newLine, at: result.firstIndex(of: leftParentheses) ?? result.endIndex)
        return result
    }
    
    private func insertComma(at value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(for: value) else { return String(value) }
        return result
    }
    
    private func convertTextSize(of value: String, target: String) -> NSAttributedString {
        let alternativeFont = UIFont.systemFont(ofSize: 20)
        let attributedText = NSMutableAttributedString(string: value)
        attributedText.addAttribute(.font, value: alternativeFont, range: (value as NSString).range(of: target))
        return attributedText
    }
    
    private func showFileNotFoundAlert() {
        let alert = UIAlertController(title: "File Not Found",
                                      message: "파일이 없습니다!",
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인",
                                        style: .default)
        alert.addAction(alertAction)
        koreanEntryButton.isEnabled = false
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
