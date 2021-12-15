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
    
    func configureAccessibility(from entry: Entry) {
        accessibilityHint = "누르면 \(entry.name) 상세정보 화면으로 이동합니다"
    }
}
