import UIKit

class ExpositionViewController: UITableViewController {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var visitorsTextLabel: UILabel!
    @IBOutlet weak var locationsTextLabel: UILabel!
    @IBOutlet weak var durationTextLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var expositionData: Exposition?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
