import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var entryDetailStackView: EntryDetailStackView!
    
    var expoEntry: ExpoEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetailView()
    }
    
    private func setUpDetailView() {
        guard let data = expoEntry else {
            return
        }
        
        entryDetailStackView.setUpView(from: data)
        title = data.name
    }
}
