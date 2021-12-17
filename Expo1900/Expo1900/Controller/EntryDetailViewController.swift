import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var entryDetailStackView: EntryDetailStackView!
    
    var expoEntry: ExpoEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetailView()
        setUpTitle()
    }
    
    private func setUpDetailView() {
        guard let entryData = expoEntry else {
            return
        }
        
        entryDetailStackView.setUpView(from: entryData)
        entryDetailStackView.setUpImageAccessibility(from: entryData)
    }
    
    private func setUpTitle() {
        guard let entryData = expoEntry else {
            return
        }
        
        title = entryData.name
    }
}
