import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsPrefixLabel: UILabel!
    @IBOutlet weak var visitorsContentLabel: UILabel!
    @IBOutlet weak var locationPrefixLabel: UILabel!
    @IBOutlet weak var locationContentLabel: UILabel!
    @IBOutlet weak var durationPrefixLabel: UILabel!
    @IBOutlet weak var durationContentLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var parisExposition: Exposition?
    override var shouldAutorotate: Bool {
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData(from: Constants.parisExpositionDataAssetName)
        setUpAllLablePrefix()
        setUpExpositionInformation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func decodeData(from assetName: String) {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: assetName) else {
            return
        }
        
        do {
            self.parisExposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            showAlert(about: .dataSetting)
        }
    }
    
    private func setUpExpositionInformation() {
        guard let parisExposition = parisExposition else {
            return
        }
        let visitorNumber = addComma(to: parisExposition.visitors)
        let parisExpositionTilte = addNewline(to: parisExposition.title)
        titleLabel.text = parisExpositionTilte
        visitorsContentLabel.text = visitorNumber + Constants.visitorUnit
        locationContentLabel.text = parisExposition.location
        durationContentLabel.text = parisExposition.duration
        descriptionTextView.text = parisExposition.description
    }
    
    private func addComma(to number: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let text = numberFormatter.string(from: NSNumber(value: number)) else {
            return String(number)
        }
        return text
    }
    
    private func setUpAllLablePrefix() {
        visitorsPrefixLabel.text = Constants.visitorText
        locationPrefixLabel.text = Constants.locationText
        durationPrefixLabel.text = Constants.durationText
    }
    
    private func addNewline(to title: String) -> String {
        let text = title.components(separatedBy: "(")
        let changedText = text[0] + "\n(" + text[1]
        return changedText
    }
}

extension UIViewController {
    func showAlert(about error: SystemError) {
        let alert = UIAlertController(title: nil, message: error.description, preferredStyle: .alert)
        let okButton = UIAlertAction(title: Constants.ok, style: .default, handler: nil)
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
