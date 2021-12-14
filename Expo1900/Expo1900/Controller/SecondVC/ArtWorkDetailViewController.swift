import UIKit

class ArtWorkDetailViewController: UIViewController {
    var identifier: Int?
    private var expositionItem: [ExpositionItem]?
    
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var descriptionss: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expositionItem = JsonParser.decodeData(of: "items", how: [ExpositionItem].self)
        
        guard let index = identifier else { return }
        guard let item = expositionItem else { return }
        
        updateUI(item, index)
    }
    
    private func updateUI(_ item: [ExpositionItem], _ index: Int) {
        image.image = UIImage(named: item[index].imageName)
        descriptionss.text = item[index].description
        navigationItem.title = item[index].name
    }
}
