import UIKit

class ExpoEntryCell: UITableViewCell {
    @IBOutlet weak var entryTitle: DynamicTypeLabel!
    @IBOutlet weak var entryDescription: DynamicTypeLabel!
    @IBOutlet weak var entryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpAccessory()
        setUpLabelTextLines()
        setUpLabelFont()
    }

    func setUpView(from data: ExpoEntry) {
        entryTitle.text = data.name
        entryImage.image = UIImage(named: data.imageName)
        entryDescription.text = data.shortDescription
    }
    
    func setUpImageAccessibility(from data: ExpoEntry) {
        entryImage.accessibilityLabel = data.name
        entryImage.isAccessibilityElement = true
    }
    
    private func setUpAccessory() {
        accessoryType = .disclosureIndicator
    }
    
    private func setUpLabelTextLines() {
        entryDescription.numberOfLines = 0
    }
    
    private func setUpLabelFont() {
        entryTitle.setUpFont(forTextStyle: .title1)
        entryDescription.setUpFont(forTextStyle: .body)
    }
}
