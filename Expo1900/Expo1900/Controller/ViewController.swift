
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visitorCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data = NSDataAsset(name: "exposition_universelle_1900") else {
            fatalError()
        }
        
        let decoder = JSONDecoder()
        let expositionData = try? decoder.decode(Exposition.self, from: data.data)
        
        titleLabel.text = expositionData?.title
        imageView.image = UIImage(named: "poster")
        visitorCountLabel.text = expositionData?.visitors.description
        locationLabel.text = expositionData?.location
        durationLabel.text = expositionData?.duration
        descriptionLabel.text = expositionData?.description
    }
    

}

