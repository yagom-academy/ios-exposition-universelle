import UIKit

final class contentViewController: UIViewController {
    @IBOutlet private weak var contentImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var content: Content?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.numberOfLines = 0
        setUIComponents()
    }
    
    private func setUIComponents() {
        guard let content = content else { return }
        contentImageView.image = UIImage(named: content.imageName)
        descriptionLabel.text = content.description
        title = content.name
    }
}
