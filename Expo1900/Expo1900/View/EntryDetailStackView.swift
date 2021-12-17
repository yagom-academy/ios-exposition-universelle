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
    
    func setUpView(from model: ExpoEntry) {
        entryImageView.image = UIImage(named: model.imageName)
        entryDescriptionLabel.text = model.description
    }
    
    func setUpImageAccessibility(from model: ExpoEntry) {
        entryImageView.accessibilityLabel = model.name
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
