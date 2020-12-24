import UIKit

class ExpositionTableViewCell: UITableViewCell {
    @IBOutlet var assetImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!

    func setData(_ item: KoreaItem) {
        assetImage.image = UIImage(named: item.imageName)
        titleLabel.text = item.name
        summaryLabel.text = item.shortDescription
    }
}
