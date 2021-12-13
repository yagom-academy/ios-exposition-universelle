import UIKit

class ExpoEntryCell: UITableViewCell {
    @IBOutlet weak var entryTitle: UILabel!
    @IBOutlet weak var entryDescription: UILabel!
    @IBOutlet weak var entryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setUpView(from data: ExpoEntry) {
        entryTitle.text = data.name
        entryImage.image = UIImage(named: data.imageName)
        entryDescription.text = data.shortDescription
    }
    
    private func setUpStyle() {
        entryTitle.font = .preferredFont(forTextStyle: .title1)
        entryDescription.numberOfLines = 0
        accessoryType = .disclosureIndicator
    }
}
