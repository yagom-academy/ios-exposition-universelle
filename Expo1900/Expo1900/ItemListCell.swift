import UIKit

class ItemListCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet private var itemImage: UIImageView!
    @IBOutlet private var itemName: UILabel!
    @IBOutlet private var shortDescription: UILabel!

    //MARK:- Methods
    func configureCell(_ item: KoreanItem) {
        itemName.text = item.itemName
        itemImage.image = UIImage(named: item.imageName)
        shortDescription.text = item.shortDescription
        shortDescription.numberOfLines = 0
    }
}
