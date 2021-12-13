import UIKit

class aaaViewController: UIViewController {
    
    var id: Int?
    var expositionItem: [ExpositionItem]?

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionss: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        expositionItem = JsonParser.decodeData(of: "items", how: [ExpositionItem].self)
        image.image = UIImage(named: expositionItem?[id ?? .zero].imageName ?? "")
        descriptionss.text = expositionItem?[id ?? .zero].description
        self.navigationItem.title = expositionItem?[id ?? .zero].name
    }
   
}
