import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var myEntry: Entry?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = myEntry?.name
        self.imageView?.image = myEntry?.image
        self.descriptionLabel.text = myEntry?.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
