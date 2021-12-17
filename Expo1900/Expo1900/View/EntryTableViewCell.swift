import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryNameLabel: UILabel!
    @IBOutlet private weak var entryShortDescriptionLabel: UILabel!
    
    func configureContent(from entry: Entry) {
        entryImageView.image = UIImage(named: entry.imageName)
        entryNameLabel.text = entry.name
        entryShortDescriptionLabel.text = entry.shortDescription
    }
    
    func configureAccessibility(from entry: Entry) {
        accessibilityHint = "누르면 \(entry.name) 상세정보 화면으로 이동합니다"
    }
}
