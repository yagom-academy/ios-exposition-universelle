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
        entryTitle.setUpDynamicFont(forTextStyle: .title1)
        entryDescription.setUpDynamicFont(forTextStyle: .body)
    }
}
