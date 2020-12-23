import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return print("에러") }
        
        do{
            self.exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        titleLabel.text = exposition?.title
        visitorLabel.text = "방문객 : " + String(exposition!.visitors) //쉼표처리
        locationLabel.text = "개최지 : " + String(exposition!.location)
        durationLabel.text = "개최기간 : " + String(exposition!.duration)
        descriptionLabel.text = exposition?.description
    }
}
