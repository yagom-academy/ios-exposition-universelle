import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet private weak var entryImage: UIImageView!
    @IBOutlet private weak var entryDescription: UILabel!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsFromEntry()
        setNavigationTitle()
    }
    
    private func setViewsFromEntry() {
        guard let entry = entry else { return }
        entryImage.image = UIImage(named: entry.imageName)
        entryDescription.text = entry.description
    }
    
    private func setNavigationTitle() {
        self.navigationItem.title = entry?.name
    }
}
