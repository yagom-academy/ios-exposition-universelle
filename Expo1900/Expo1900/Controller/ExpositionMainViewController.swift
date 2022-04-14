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
        self.navigationController?.isNavigationBarHidden = true
        
        guard let decodedData = parseJSON() else { return }
        expoTitleLabel.text = insertNewLine(value: decodedData.title)
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
}

