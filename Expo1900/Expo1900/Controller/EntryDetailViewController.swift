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
        updateDetailImage()
    }
    
    private func updateNavigationBarTitle() {
        navigationItem.title = koreanEntryTitle
    }
    
    private func updateDescriptionLabel() {
        if let description = detailDescription {
            detailDescriptionLabel.text = description
        }
    }
    
    private func updateDetailImage() {
        if let image = imageName {
            detailImageView.image = UIImage(named: image)
        }
    }
}
