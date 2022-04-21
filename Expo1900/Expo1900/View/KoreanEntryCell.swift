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
    
    func updateCellData(data: CellContent) {
        configureCell()
        detailTitleLabel?.text = data.entryTitle
        detailImageView?.image = UIImage(named: data.entryImage)
        detailIntroLabel?.text = data.entryIntroduction
    }
    
    private func configureCell() {
        detailTitleLabel?.font = UIFont.systemFont(ofSize: 25)
        detailImageView?.contentMode = .scaleAspectFit
        detailIntroLabel?.numberOfLines = 0
    }
}
