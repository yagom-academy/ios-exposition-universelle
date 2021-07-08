import UIKit

class ViewController: UIViewController {

    var expoData: Exposition?
    
    @IBOutlet weak var expoTitle: UITextView!
    @IBOutlet weak var expoPoster: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var expoDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        do {
            expoData = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        guard let validExpoData = expoData else {
            return
        }
        
        expoTitle.text = validExpoData.title
        visitorsLabel.text = "방문객 : \(validExpoData.formattedVisitors) 명"
        locationLabel.text = "개최지 : \(validExpoData.location)"
        durationLabel.text = "개최 기간 : \(validExpoData.duration)"
        expoDescription.text = validExpoData.description
    }
}

