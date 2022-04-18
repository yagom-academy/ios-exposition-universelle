import UIKit

final class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var detailDescriptionLabel: UILabel!
    
    private var detailContent: DetailContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavigationBarTitle()
        updateDescriptionLabel()
        updateImageView()
    }
    
    private func updateNavigationBarTitle() {
        navigationItem.title = detailContent?.koreanEntryTitle
    }
    
    private func updateDescriptionLabel() {
        if let text = detailContent?.detailDescription {
            detailDescriptionLabel.text = text
        }
    }
    
    private func updateImageView() {
        if let image = detailContent?.imageName {
            detailImageView.image = UIImage(named: image)
        }
    }
    
    func updateDetailContent(data: DetailContent) {
        detailContent = data
    }
}
