import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var myEntry: Entry?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = myEntry?.name
    }
    
    func setElementValue() {
        guard let imageViewValue : UIImage = myEntry?.image else { return }
        guard let descriptionValue : String = myEntry?.description else { return }
        
        self.imageView.image = imageViewValue
        self.descriptionLabel.text = descriptionValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElementValue()
    }
}
