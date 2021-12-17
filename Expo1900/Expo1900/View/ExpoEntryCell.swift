import UIKit

class ExpoEntryCell: UITableViewCell {
    @IBOutlet weak var entryTitle: UILabel!
    @IBOutlet weak var entryDescription: UILabel!
    @IBOutlet weak var entryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpAccessory()
        setUpLabelTextLines()
        setUpLabelFont()
    }

    func setUpView(from model: ExpoEntry) {
        entryTitle.text = model.name
        entryImage.image = UIImage(named: model.imageName)
        entryDescription.text = model.shortDescription
    }
    
    func setUpImageAccessibility(from model: ExpoEntry) {
        entryImage.accessibilityLabel = model.name
        entryImage.isAccessibilityElement = true
    }
    
    private func setUpAccessory() {
        accessoryType = .disclosureIndicator
    }
    
    private func setUpLabelTextLines() {
        entryDescription.numberOfLines = 0
    }
    
    private func setUpLabelFont() {
        entryTitle.setUpDynamicFont(forTextStyle: .title1)
        entryDescription.setUpDynamicFont(forTextStyle: .body)
    }
}
