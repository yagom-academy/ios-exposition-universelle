import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var parisExposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData(from: Constants.parisExpositionDataAssetName)
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func decodeData(from assetName: String) {
        guard let dataAsset = NSDataAsset(name: assetName) else {
            showAlert(about: .dataSetting)
            return
        }
        let jsonDecoder = JSONDecoder()
        
        do {
            self.parisExposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            showAlert(about: .dataSetting)
        }
    }
    
    private func setData() {
        guard let parisExposition = parisExposition,
              let visitorNumber = try? addComma(parisExposition.visitors) else {
            showAlert(about: .dataSetting)
            return
        }
        
        titleLabel.text = parisExposition.title
        visitorsLabel.text = Constants.visitorText + visitorNumber + Constants.visitorUnit
        locationLabel.text = Constants.locationText + parisExposition.location
        durationLabel.text = Constants.durationText + parisExposition.duration
        descriptionTextView.text = parisExposition.description
    }
    
    private func addComma(_ number: UInt) throws -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let text = numberFormatter.string(from: NSNumber(value: number)) else {
            throw SystemError.dataSetting
        }
        return text
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
