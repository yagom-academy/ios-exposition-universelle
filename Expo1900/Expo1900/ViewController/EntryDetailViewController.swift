import UIKit

class EntryDetailViewController: UIViewController {

    //MARK: - IBOutlet Properties
    
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryDescriptionLabel: UILabel!
    
    //MARK: - Instance Properties
    
    var entry: Entry?
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureContent()
        setNavigationTitle()
        configureEntryImageAccessiblity()
    }
}

//MARK: - Private Methods

extension EntryDetailViewController {
    
    private func configureContent() {
        guard let entry = entry else {
            return
        }
        entryImageView.image = UIImage(named: entry.imageName)
        entryDescriptionLabel.text = entry.description
    }
    
    private func setNavigationTitle() {
        navigationItem.title = entry?.name
    }
    
    private func configureEntryImageAccessiblity() {
        guard let entry = entry else {
            return
        }
        entryImageView.image?.accessibilityLabel = entry.name
    }
}
