import UIKit

class EntryDetailViewController: UIViewController {
    var item: ExpositionEntry?
    
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var itemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
    }
    
    private func prepare() {
        itemImageView.image = item?.image
        descriptionTextView.text = item?.description
        navigationItem.title = item?.name
    }
}
