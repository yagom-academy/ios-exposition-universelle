import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var parisExposition: Exposition!
    let visitorText = "방문객 : "
    let locationText = "개최지 : "
    let durationText = "개최 기간 : "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeData()
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    private func decodeData() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        let jsonDecoder = JSONDecoder()
        
        do {
            self.parisExposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            debugPrint("ERROR")
        }
    }
    
    private func setData() {
        titleLabel.text = parisExposition.title
        visitorsLabel.text = visitorText + String(parisExposition.visitors)
        locationLabel.text = locationText + parisExposition.location
        durationLabel.text = durationText + parisExposition.duration
        descriptionTextView.text = parisExposition.description
    }
}

