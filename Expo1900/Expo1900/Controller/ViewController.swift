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
        updateUI()
    }
    
    func updateUI() {
        var modelForMainView = ModelForMainView()
        modelForMainView.setUpData()
        
        titleLabel.text = modelForMainView.title
        imageView.image = modelForMainView.image
        visitorCountLabel.text = modelForMainView.visitors
        locationLabel.text = modelForMainView.location
        durationLabel.text = modelForMainView.duration
        descriptionLabel.text = modelForMainView.description
    }
}

