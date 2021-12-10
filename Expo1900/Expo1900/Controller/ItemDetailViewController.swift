import UIKit

class ItemDetailViewController: UIViewController {
    
    var item: ExpositionItem?
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        updateUI()
    }
    
    func updateUI() {
        guard let expoItem = item else {
            return
        }
        itemImageView.image = UIImage(named: expoItem.imageName)
        itemDescription.text = expoItem.description
    }

    func setUpNavigationBar() {
        self.navigationItem.title = item?.name
    }
}
