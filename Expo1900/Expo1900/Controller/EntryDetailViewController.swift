import UIKit

final class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var detailDescriptionLabel: UILabel!
    
    private var cellDetailContent: CellDetailContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavigationBarTitle()
        updateDescriptionLabel()
        updateImageView()
    }
    
    private func updateNavigationBarTitle() {
        navigationItem.title = cellDetailContent?.koreanEntryTitle
    }
    
    private func updateDescriptionLabel() {
        if let text = cellDetailContent?.detailDescription {
            detailDescriptionLabel.text = text
        }
    }
    
    private func updateImageView() {
        if let image = cellDetailContent?.imageName {
            detailImageView.image = UIImage(named: image)
        }
    }
    
    func updateDetailContent(data: CellDetailContent) {
        cellDetailContent = data
    }
}
