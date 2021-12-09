import UIKit

class CustomButtonStackView: UIStackView {
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var rightImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        leftImageView.image = UIImage(named: "flag")
        rightImageView.image = UIImage(named: "flag")
        button.setTitle("한국의 출품작 보러가기", for: .normal)
    }
}
