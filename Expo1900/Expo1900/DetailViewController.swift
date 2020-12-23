
import UIKit

class DetailViewController: UIViewController {
    
    var itemName: String?
    var itemImage: UIImage?
    var itemDescription: String?
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setAllData() {
        
    }
}
