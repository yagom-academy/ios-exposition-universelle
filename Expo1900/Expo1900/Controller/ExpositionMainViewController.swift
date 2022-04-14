import UIKit

class ExpositionMainViewController: UIViewController {
    
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var expoImageView: UIImageView!
    @IBOutlet weak var expoVisitorsLabel: UILabel!
    @IBOutlet weak var expoLocationLabel: UILabel!
    @IBOutlet weak var expoDurationLabel: UILabel!
    @IBOutlet weak var expoDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let decodedData = parseJSON() else { return }
        expoTitleLabel.text = insertNewLine(value: decodedData.title)
        expoImageView.image = UIImage(named: "poster")
        expoVisitorsLabel.attributedText = attributedText("방문객 : \(insertComma(value: decodedData.visitors)) 명", "방문객")
        expoLocationLabel.attributedText = attributedText("개최지 : \(decodedData.location)", "개최지")
        expoDurationLabel.attributedText = attributedText("개최 기간 : \(decodedData.duration)", "개최 기간")
        expoDescriptionLabel.text = decodedData.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func parseJSON() -> Exposition? {
        let decoder = JSONDecoder()
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else { return nil }
        let data = try? decoder.decode(Exposition.self, from: asset.data)
        return data
    }
    
    private func insertNewLine(value: String) -> String {
        var str = value
        str.insert("\n", at: str.firstIndex(of: "(") ?? str.endIndex)
        return str
    }
    
    private func insertComma(value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(for: value) else { return "" }
        return result
    }
    
    private func attributedText(_ value: String, _ range: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: value)
        let font = UIFont.systemFont(ofSize: 20)
        attributedString.addAttribute(.font, value: font, range: (value as NSString).range(of: range))
        return attributedString
    }
}

