import UIKit

class EntryDetailStackView: UIStackView {
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryDescriptionLabel: UILabel!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStyle()
    }
    
    func setUp(data: ExpoEntry) {
        entryImageView.image = UIImage(named: data.imageName)
        entryDescriptionLabel.text = data.description
    }
    
    private func setUpStyle() {
        self.spacing = 10
        entryDescriptionLabel.numberOfLines = 0
    }
}
