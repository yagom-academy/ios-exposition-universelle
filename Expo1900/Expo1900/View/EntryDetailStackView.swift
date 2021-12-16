import UIKit

class EntryDetailStackView: UIStackView {
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryDescriptionLabel: UILabel!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStackViewSpacing()
        setUpLabelFont()
        setUpLabelTextLines()
    }
    
    func setUpView(from data: ExpoEntry) {
        entryImageView.image = UIImage(named: data.imageName)
        entryDescriptionLabel.text = data.description
    }
    
    func setUpImageAccessibility(from data: ExpoEntry) {
        entryImageView.accessibilityLabel = data.name
        entryImageView.isAccessibilityElement = true
    }
    
    private func setUpStackViewSpacing() {
        spacing = 10
    }
    
    private func setUpLabelTextLines() {
        entryDescriptionLabel.numberOfLines = 0
    }
    
    private func setUpLabelFont() {
        entryDescriptionLabel.setUpDynamicFont(forTextStyle: .body)
    }
}
