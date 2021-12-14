import UIKit

class ItemDetailViewController: UIViewController {
    
    private var item: ExpositionItem?
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        updateUI()
    }
    
}

extension ItemDetailViewController {
    func setModel(_ model: ExpositionItem) {
        self.item = model
    }
    
    private func updateUI() {
        guard let expoItem = item else {
            fatalError()
        }
        itemImageView.image = UIImage(named: expoItem.imageName)
        itemDescription.text = expoItem.description
    }

    private func setUpNavigationBar() {
        self.navigationItem.title = item?.name
    }
}
