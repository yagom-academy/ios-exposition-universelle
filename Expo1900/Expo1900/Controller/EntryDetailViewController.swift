import UIKit

final class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var detailDescriptionLabel: UILabel!
    
    var detailDescription: String?
    var imageName: String?
    var koreanEntryTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavigationBarTitle()
        updateDescriptionLabel()
        updateImageView()
    }
    
    private func updateNavigationBarTitle() {
        navigationItem.title = koreanEntryTitle
    }
    
    private func updateDescriptionLabel() {
        if let text = detailDescription {
            detailDescriptionLabel.text = text
        }
    }
    
    private func updateImageView() {
        if let image = imageName {
            detailImageView.image = UIImage(named: image)
        }
    }
}
