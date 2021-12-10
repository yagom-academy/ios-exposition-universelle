
import UIKit

class ItemTableViewCell: UITableViewCell {
    
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
        self.itemDescriptionLabel.numberOfLines = 0
        self.accessoryType = .disclosureIndicator
        self.itemTitleLabel.font = UIFont.systemFont(ofSize: 30)
    }
}
