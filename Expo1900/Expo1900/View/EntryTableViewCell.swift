import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryNameLabel: UILabel!
    @IBOutlet weak var entryShortDescriptionLabel: UILabel!
    
    func configureContent(from entry: Entry) {
        entryImageView.image = UIImage(named: entry.imageName)
        entryNameLabel.text = entry.name
        entryShortDescriptionLabel.text = entry.shortDescription
    }
}
