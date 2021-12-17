
import UIKit

class ItemTableViewCell: UITableViewCell {
    static let identifier = "itemCell"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCellToDefault()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

// MARK: - Private Method

extension ItemTableViewCell {
    private func setCellToDefault() {
        self.itemDescriptionLabel.numberOfLines = .zero
        self.itemDescriptionLabel.font = ExpoFont.itemDescriptionFont
        self.itemDescriptionLabel.adjustsFontForContentSizeCategory = true
        self.accessoryType = .disclosureIndicator
        self.itemTitleLabel.font = ExpoFont.itemTitleFont
        self.itemTitleLabel.adjustsFontForContentSizeCategory = true
        self.itemTitleLabel.numberOfLines = .zero
    }
}
