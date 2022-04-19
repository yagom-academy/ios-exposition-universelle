import UIKit

final class KoreanEntryCell: UITableViewCell {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailIntroLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func configureCell(title: String, image: String, intro: String) {
        detailTitleLabel?.font = UIFont.systemFont(ofSize: 25)
        detailTitleLabel?.text = title
        
        detailImageView?.contentMode = .scaleAspectFit
        detailImageView?.image = UIImage(named: image)
        
        detailIntroLabel?.numberOfLines = 0
        detailIntroLabel?.text = intro
    }
}
