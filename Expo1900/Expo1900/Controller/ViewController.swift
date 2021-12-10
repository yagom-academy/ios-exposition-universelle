import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visitorCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var modelForMainView = ModelForMainView()
    let expositionIdentifier = "exposition_universelle_1900"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let expositionData = JsonParser.decodeData(of: expositionIdentifier)
        modelForMainView.setUpData(with: expositionData)
        updateUI(with: modelForMainView)
    }
    
    func updateUI(with data: ModelForMainView) {
        titleLabel.text = data.title
        imageView.image = data.image
        visitorCountLabel.text = data.visitors
        locationLabel.text = data.location
        durationLabel.text = data.duration
        descriptionLabel.text = data.description
    }
}

