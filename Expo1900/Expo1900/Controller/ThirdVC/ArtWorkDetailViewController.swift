import UIKit

final class ArtWorkDetailViewController: UIViewController {
    var rowIndex: Int?
    private var expositionItem: [ExpositionItem]?
    
    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var detailExplanation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expositionItem = try? JSONParser.decodeData(of: "items", type: [ExpositionItem].self).get()
        
        guard let index = rowIndex else { return }
        guard let item = expositionItem else { return }
        
        updateUI(item, index)
    }
    
    private func updateUI(_ item: [ExpositionItem], _ index: Int) {
        detailImageView.image = UIImage(named: item[index].imageName)
        detailExplanation.text = item[index].description
        navigationItem.title = item[index].name
    }
}
