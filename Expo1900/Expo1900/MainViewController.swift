import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var exposition: Exposition?
    
    func DecimalComma(value: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: value))!
        
        return result
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "메인"
        self.navigationController?.isNavigationBarHidden = true
        titleLabel.text = exposition?.title
        visitorLabel.text = "방문객 : " + DecimalComma(value: (Int(exposition!.visitors)))
        locationLabel.text = "개최지 : " + String(exposition!.location)
        durationLabel.text = "개최기간 : " + String(exposition!.duration)
        descriptionLabel.text = exposition?.description
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
    }
}
