import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var itemDescription: UILabel!
    
    //MARK: - Properties
    private var item: KoreanItem?
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let validItem = item else {
            return
        }
        navigationItem.title = validItem.itemName
        itemImage.image = UIImage(named: validItem.imageName)
        itemDescription.text = validItem.description
    }
    
    //MARK: - Methods
    func getParsedData(with koreanItem: KoreanItem) {
        item = koreanItem
    }
}
