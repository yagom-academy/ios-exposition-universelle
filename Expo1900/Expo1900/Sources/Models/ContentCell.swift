import UIKit

class ContentCell: UITableViewCell {
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(content: Content) {
        descriptionLabel.numberOfLines = 0
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        accessoryType = .disclosureIndicator
        
        contentImageView.image = UIImage(named: content.imageName)
        titleLabel.text = content.name
        descriptionLabel.text = content.shortDescription
    }
}
