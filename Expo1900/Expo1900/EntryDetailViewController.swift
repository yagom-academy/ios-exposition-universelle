import UIKit

class EntryDetailViewController: UIViewController {

    //MARK: - IBOutlet Properties
    
    @IBOutlet private weak var entryImage: UIImageView!
    @IBOutlet private weak var entryDescription: UILabel!
    
    //MARK: - Instance Properties
    
    var entry: Entry?
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsFromEntry()
        setNavigationTitle()
    }
}

//MARK: - Private Methods

extension EntryDetailViewController {
    private func setViewsFromEntry() {
        guard let entry = entry else { return }
        entryImage.image = UIImage(named: entry.imageName)
        entryDescription.text = entry.description
    }
    
    private func setNavigationTitle() {
        navigationItem.title = entry?.name
    }
}
