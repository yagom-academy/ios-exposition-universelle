import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet weak var detailStackView: EntryDetailStackView!
    
    var expoEntry: ExpoEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetailView()
    }
    
    func setUpDetailView() {
        if let data = expoEntry {
            detailStackView.setUp(data: data)
        }
    }
    
}
