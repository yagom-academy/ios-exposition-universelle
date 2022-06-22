import UIKit

final class ContentDetailViewController: UIViewController {
    @IBOutlet private weak var contentImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var content: Content?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIComponents()
    }

    func setupContentData(_ data: Content) {
        content = data
    }
    
    private func setUIComponents() {
        guard let content = content else { return }
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = content.description
        
        contentImageView.image = UIImage(named: content.imageName)
        title = content.name
    }
}
