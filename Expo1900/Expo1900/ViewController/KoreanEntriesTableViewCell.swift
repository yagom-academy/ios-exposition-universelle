import UIKit

class KoreanEntriesTableViewCell: UITableViewCell {
    @IBOutlet weak var koreanEntryImage: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var shortDescriptionsTextLabel: UILabel!
    
    func setData(item: KoreanEntries) {
        koreanEntryImage.image = item.image
        nameTextLabel.text = item.name
        shortDescriptionsTextLabel.text = item.shortDescriptions
    }
}
