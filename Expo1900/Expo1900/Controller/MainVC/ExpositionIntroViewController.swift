import UIKit

final class ExpositionIntroViewController: UIViewController {

    @IBOutlet private weak var expositionIntroTitleLabel: UILabel!
    @IBOutlet private weak var expositionIntroImageView: UIImageView!
    @IBOutlet private weak var visitorCountLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var modelForMainView = ExpositionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func updateUI() {
        expositionIntroTitleLabel.text = modelForMainView.title
        expositionIntroImageView.image = UIImage(named: modelForMainView.image)
        visitorCountLabel.text = modelForMainView.visitors
        locationLabel.text = modelForMainView.location
        durationLabel.text = modelForMainView.duration
        descriptionLabel.text = modelForMainView.description
    }
}
