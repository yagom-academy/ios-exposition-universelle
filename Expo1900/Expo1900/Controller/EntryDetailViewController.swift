import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet weak var detailStackView: EntryDetailStackView!
    
    var expoEntry: ExpoEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetailView()
    }
    
    func setUpDetailView() {
        guard let data = expoEntry else {
            return
        }
        
        detailStackView.setUp(data: data)
        self.title = data.name
    }
    
}
