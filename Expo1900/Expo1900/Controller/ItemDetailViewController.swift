
import UIKit

class ItemDetailViewController: UIViewController {
    
    private var itemInfo: ItemInfo
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    init?(coder: NSCoder, data: ItemInfo) {
        self.itemInfo = data
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        self.title = itemInfo.name
        self.itemImageView.image = UIImage(named: "\(itemInfo.imageName)")
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = .hangulWordPriority
        let attribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17),
            .paragraphStyle: paragraphStyle]
        itemDescriptionTextView.attributedText = NSAttributedString(
            string: itemInfo.description,
            attributes: attribute)
    }
}
