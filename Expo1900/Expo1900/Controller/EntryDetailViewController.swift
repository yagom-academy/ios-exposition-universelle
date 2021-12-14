import UIKit

class EntryDetailViewController: UIViewController {
    private var image: UIImage?
    private var detailDescription: String?
    
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var itemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    private func prepareView() {
        itemImageView.image = image
        descriptionTextView.text = detailDescription
    }
    
    func setEntryData(image: UIImage?, description: String?) {
        self.image = image
        self.detailDescription = description
    }
}
