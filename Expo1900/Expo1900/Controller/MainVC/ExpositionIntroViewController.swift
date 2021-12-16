import UIKit

class ExpositionIntroViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var visitorCountLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func updateUI() {
        var modelForMainView = ExpositionViewModel()
        modelForMainView.setUpData()
        
        titleLabel.text = modelForMainView.title
        imageView.image = UIImage(named: modelForMainView.image)
        visitorCountLabel.text = modelForMainView.visitors
        locationLabel.text = modelForMainView.location
        durationLabel.text = modelForMainView.duration
        descriptionLabel.text = modelForMainView.description
    }
}
