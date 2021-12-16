import UIKit

final class ArtWorkDetailViewController: UIViewController {
    var identifier: Int?
    private var expositionItem: [ExpositionItem]?
    
    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var detailExplanation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expositionItem = JSONParser.decodeData(of: "items", how: [ExpositionItem].self)
        
        guard let index = identifier else { return }
        guard let item = expositionItem else { return }
        
        updateUI(item, index)
    }
    
    private func updateUI(_ item: [ExpositionItem], _ index: Int) {
        detailImageView.image = UIImage(named: item[index].imageName)
        detailExplanation.text = item[index].description
        navigationItem.title = item[index].name
    }
}
