import UIKit

final class ItemViewController: UIViewController {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var content: Content?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.numberOfLines = 0
        setUIComponents()
    }
    
    private func setUIComponents() {
        guard let content = content else { return }
        itemImageView.image = UIImage(named: content.imageName)
        descriptionLabel.text = content.description
        title = content.name
    }
}
