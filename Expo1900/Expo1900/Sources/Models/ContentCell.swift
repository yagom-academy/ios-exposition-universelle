import UIKit

class ContentCell: UITableViewCell {
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(content: Content) {
        titleLabel.numberOfLines = 0
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = content.name
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .preferredFont(forTextStyle: .body)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.text = content.shortDescription
        
        accessoryType = .disclosureIndicator
        contentImageView.image = UIImage(named: content.imageName)
    }
}
