import UIKit

class KoreanEntryCell: UITableViewCell {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailIntroLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        detailTitleLabel?.font = UIFont.systemFont(ofSize: 25)
        detailImageView?.contentMode = .scaleAspectFit
        detailIntroLabel?.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}

extension KoreanEntryCell {
    public func setUpCellInfo(title: String, image: String, intro: String) {
        detailTitleLabel?.text = title
        detailImageView?.image = UIImage(named: image)
        detailIntroLabel?.text = intro
    }
}
