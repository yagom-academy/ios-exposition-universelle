import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var exposition: Exposition?
    
    func MakeDecimalComma(value: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(from: NSNumber(value: value)) else { return "MakeDecimalComma method error" }
        
        return result
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "메인"
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setElementValue() {
        guard let titleValue : String = exposition?.title else { return }
        guard let visitorDecimal : UInt = exposition?.visitors else { return }
        let visitorValue : String = MakeDecimalComma(value: Int(visitorDecimal))
        guard let locationValue : String = exposition?.location else { return }
        guard let durationValue : String = exposition?.duration else { return }
        guard let descriptionValue : String = exposition?.description else { return }
        
        self.titleLabel.text = titleValue
        self.visitorLabel.text = "방문객 : " + visitorValue
        self.locationLabel.text = "개최지 : " + locationValue
        self.durationLabel.text = "개최기간 : " + durationValue
        self.descriptionLabel.text = descriptionValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do{
            self.exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        setElementValue()
    }
}
