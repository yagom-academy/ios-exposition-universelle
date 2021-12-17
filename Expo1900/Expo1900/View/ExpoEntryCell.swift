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

    func setUpView(from entryData: ExpoEntry) {
        entryTitle.text = entryData.name
        entryImage.image = UIImage(named: entryData.imageName)
        entryDescription.text = entryData.shortDescription
    }
    
    func setUpImageAccessibility(from entryData: ExpoEntry) {
        entryImage.accessibilityLabel = entryData.name
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
