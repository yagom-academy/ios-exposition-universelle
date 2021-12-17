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
        guard let model = expoEntry else {
            return
        }
        
        entryDetailStackView.setUpView(from: model)
        entryDetailStackView.setUpImageAccessibility(from: model)
    }
    
    private func setUpTitle() {
        guard let model = expoEntry else {
            return
        }
        
        title = model.name
    }
}
